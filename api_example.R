install.packages(c("devtools","rjson","httr"))
devtools::install_github("AndreasFischer1985/qqBaseX")

#------------------------------------------------------------------
# Get clientID & clientSecret from https://web.arbeitsagentur.de/weiterbildungssuche/suche?ort=Feucht_90537_11.224918_49.376701&uk=Bundesweit
#------------------------------------------------------------------
# GET /weiterbildungssuche/suche?ort=Feucht_90537_11.224918_49.376701&uk=Bundesweit HTTP/1.1
# Host: web.arbeitsagentur.de
# User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:88.0) Gecko/20100101 Firefox/88.0
# Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8
# Accept-Language: de,en-US;q=0.7,en;q=0.3
# Accept-Encoding: gzip, deflate, br
# DNT: 1
# Connection: keep-alive
# Upgrade-Insecure-Requests: 1
# Pragma: no-cache
# Cache-Control: no-cache
#------------------------------------------------------------------

getCredentials=function(
    url="https://web.arbeitsagentur.de/weiterbildungssuche/suche?ort=Feucht_90537_11.224918_49.376701&uk=Bundesweit",
    verbose=T
    ){ 
    if(verbose) print("\nTrying to get credentials...\n")
    get_request=httr::GET(
        url=url,
        config=httr::config(connecttimeout=60)
        )
    x=as.character(httr::content(get_request)) 
    clientId=print(gsub("(.* '|',)","",qqBaseX::matchAll(x,"clientId: (.*?),")))
    clientSecret=print(gsub("(.* '|',)","",qqBaseX::matchAll(x,"clientSecret: (.*?),")))
    if(verbose){
        print(paste("URL: ", url))
        print(paste("Credentials unchanged?", clientId=="38053956-6618-4953-b670-b4ae7a2360b1" & clientSecret=="c385073c-3b97-42a9-b916-08fd8a5d1795"))
    }
    return(list(
        clientId=gsub("(.* '|',)","",qqBaseX::matchAll(x,"clientId: (.*?),")),
        clientSecret=gsub("(.* '|',)","",qqBaseX::matchAll(x,"clientSecret: (.*?),")),
        clientCookies=get_request$cookies$value,
        data=get_request
    ))
}


#------------------------------------------------------------------
# Get token from https://rest.arbeitsagentur.de/oauth/gettoken_cc
#------------------------------------------------------------------
# POST /oauth/gettoken_cc HTTP/1.1
# Host: rest.arbeitsagentur.de
# User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:88.0) Gecko/20100101 Firefox/88.0
# Accept: application/json, text/plain, */*
# Accept-Language: de,en-US;q=0.7,en;q=0.3
# Accept-Encoding: gzip, deflate, br
# Content-Type: application/x-www-form-urlencoded
# Content-Length: 127
# Origin: https://web.arbeitsagentur.de
# DNT: 1
# Connection: keep-alive
# Pragma: no-cache
# Cache-Control: no-cache
#------------------------------------------------------------------

getToken=function(
    url="https://rest.arbeitsagentur.de/oauth/gettoken_cc",
    clientId="38053956-6618-4953-b670-b4ae7a2360b1",
    clientSecret="c385073c-3b97-42a9-b916-08fd8a5d1795",
    clientCookies=NULL,
    verbose=T
    ){
    if(verbose) print("\nTrying to get token...\n")
    postHeaders=c(
        "Host"="rest.arbeitsagentur.de",
        "User-Agent"="Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:88.0) Gecko/20100101 Firefox/88.0",
        "Accept"="application/json, text/plain, */*",
        "Accept-Language"="de,en-US;q=0.7,en;q=0.3",
        "Accept-Encoding"="gzip, deflate, br",
        "Content-Type"="application/x-www-form-urlencoded",
        "Content-Length"="127",
        "Origin"="https://web.arbeitsagentur.de",
        "DNT"="1",   
        "Connection"="keep-alive",
        "Pragma"="no-cache",
        "Cache-Control"="no-cache"
    )
    if(!is.null(clientCookies)) postHeaders=c(postHeaders,"Cookie"=clientCookies)
    postData=list( 
        "grant_type"="client_credentials",
        "client_id"=clientId,
        "client_secret"=clientSecret
    ) 
    token_request=httr::POST(
        url=url,
        body=postData,encode="form",
        httr::add_headers(.headers = c(postHeaders)),
        config=httr::config(connecttimeout=60) #config=httr::timeout(60)
    )
    token_body <- httr::content(token_request, as='parsed')
    if(verbose){
        print(paste("URL:", url))
        print(paste("Token:", token_body$access_token))
        print(paste("x-Correlation-Id:", token_request$headers$"x-correlationid"))
        print(paste("Cookies:", token_request$cookies$value))
    }
    return(list(
        access_token=token_body$access_token,
        correlationId=token_request$headers$"x-correlationid",
        clientCookies=token_request$cookies$value,
        data=token_request))
}


#------------------------------------------------------------------
# Get Data from https://rest.arbeitsagentur.de/infosysbub/wbsuche/pc/v1/bildungsangebot?orte=Feucht_90537_11.224918_49.376701&uk=Bundesweit&bg=false&page=...
#------------------------------------------------------------------
# GET /infosysbub/wbsuche/pc/v1/bildungsangebot?orte=Feucht_90537_11.224918_49.376701&uk=Bundesweit&bg=false&page=1 HTTP/1.1
# Host: rest.arbeitsagentur.de
# User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:88.0) Gecko/20100101 Firefox/88.0
# Accept: application/json, text/plain, */*
# Accept-Language: de,en-US;q=0.7,en;q=0.3
# Accept-Encoding: gzip, deflate, br
# OAuthAccessToken: eyJhbGciOiJIUzUxMiJ9...
# Correlation-ID: a1EkTJO89Wtq
# Origin: https://web.arbeitsagentur.de
# DNT: 1
# Connection: keep-alive
# Cookie: rest=024dae17b4-4300-45vOKiLdHVOHS_arV35aZPckQ9HCcIUZc79U521-Jhej62BfRwhdxgpA-N_G3231g0oNI; _pk_id.1060.cfae=8d47d6e7e29d5156.1643703603.1.1643703603.1643703603.; _pk_ses.1060.cfae=1
# Pragma: no-cache
# Cache-Control: no-cache
#------------------------------------------------------------------

getData=function(url="https://rest.arbeitsagentur.de/infosysbub/wbsuche/pc/v1/bildungsangebot?orte=Feucht_90537_11.224918_49.376701&uk=Bundesweit&bg=false&page=0",      
        accessToken="eyJhbGciOiJIUzUxMiJ9.eyAic3ViIjogIlI0amhFWGdOWW1yL21Cd1lFTi9oR0N...",
        correlationId=NULL,
        clientCookies=NULL,
        verbose=T){
    if(verbose) print("\nTrying to get data...\n")
    getHeaders=c(
        "Host"="rest.arbeitsagentur.de",
        "User-Agent"="Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:88.0) Gecko/20100101 Firefox/88.0",
        "Accept"="application/json, text/plain, */*",
        "Accept-Language"="de,en-US;q=0.7,en;q=0.3",
        "Accept-Encoding"="gzip, deflate, br",        
        "Origin"="https://web.arbeitsagentur.de",
        "DNT"="1",
        "Connection"="keep-alive",
        "Pragma"="no-cache",
        "Cache-Control"="no-cache"
    )
    if(!is.null(accessToken)) getHeaders=c(getHeaders,"OAuthAccessToken"=accessToken)
    if(!is.null(correlationId)) getHeaders=c(getHeaders,"Correlation-ID"=correlationId)
    if(!is.null(clientCookies)) getHeaders=c(getHeaders,"Cookie"=clientCookies)
    data_request=httr::GET(
        url=url, 
        httr::add_headers(.headers=getHeaders),
        config=httr::config(connecttimeout=60)
    )
    if(verbose){
        print(paste("URL:", url))
        print(nchar(rawToChar(httr::content(data_request))))
        print(substr(rawToChar(httr::content(data_request)),1,100))

    }
    return(
        data_request
    )
}


#------------------------------------------------------------------
# Demo: get one page
#------------------------------------------------------------------

dataList=list()
if(T){ #get page 0
    url=paste0("https://web.arbeitsagentur.de/weiterbildungssuche/suche?ort=Feucht_90537_11.224918_49.376701&uk=Bundesweit&seite=0")
    credentials=getCredentials(url)
    token=getToken(
        url="https://rest.arbeitsagentur.de/oauth/gettoken_cc",
        clientId=credentials[[1]],
        clientSecret=credentials[[2]])
    data=getData(
        url=paste0("https://rest.arbeitsagentur.de/infosysbub/wbsuche/pc/v1/bildungsangebot?orte=Feucht_90537_11.224918_49.376701&uk=Bundesweit&bg=false&page=0"),        
        accessToken=token[[1]])
    hexCodedData=httr::content(data)
    decodedData=rawToChar(hexCodedData)
    dataList[["page 0"]]=decodedData

    writeLines(decodedData,paste0(Sys.Date(),"_wbData_",0,".txt"))
    save.image(paste0(Sys.Date(),"_wb_successfulRequest.RData"))
}


#------------------------------------------------------------------
# Demo: Get several pages
#------------------------------------------------------------------

i=0;
token=NULL
if(T)
while(T){
    url=paste0("https://web.arbeitsagentur.de/weiterbildungssuche/suche?ort=Feucht_90537_11.224918_49.376701&uk=Bundesweit&seite=",i)
    credentials=getCredentials(url)
    if(i/50==round(i/50))token=NULL # get a new token, once in a while
    if(is.null(token)){
        token=getToken(
            url="https://rest.arbeitsagentur.de/oauth/gettoken_cc",
            clientId=credentials[[1]],
            clientSecret=credentials[[2]])
    }
    data=getData(
        url=paste0("https://rest.arbeitsagentur.de/infosysbub/wbsuche/pc/v1/bildungsangebot?orte=Feucht_90537_11.224918_49.376701&uk=Bundesweit&bg=false&page=",i),
        accessToken=token[[1]])
    hexCodedData=httr::content(data)
    decodedData=rawToChar(hexCodedData)
    dataList[[paste0("page ",i)]]=decodedData

    writeLines(decodedData,paste0(Sys.Date(),"_wbData_",i,".txt"))
    save.image(paste0(Sys.Date(),"_wb_successfulRequest.RData"))
    max=3 # max=rjson::fromJSON(decodedData)[[3]][[3]]
    print(paste(i,"<",max))
    i=i+1
    if(i>=max)break;
}

#--------------
# Explore data
#--------------

if(T){
    decodedData=dataList[[1]]
    jsonData=rjson::fromJSON(decodedData)
    names(jsonData)
    angebote=sapply(jsonData[[1]][[1]],function(x)paste(x,collapse="\n"))
    seitenzahl=(jsonData[[3]][[3]])
    str(jsonData[[4]])
    anbieter=sapply(jsonData[[4]],function(x)paste(x,collapse="\n"))
}


