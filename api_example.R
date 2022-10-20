#----------------
# Simple Example
#----------------
install.packages(c("devtools","rjson","httr"))
devtools::install_github("AndreasFischer1985/qqBaseX")
clientId="38053956-6618-4953-b670-b4ae7a2360b1"
clientSecret="c385073c-3b97-42a9-b916-08fd8a5d1795"
postData=list( "grant_type"="client_credentials","client_id"=clientId,"client_secret"=clientSecret) 
token_request=httr::POST(
        url="https://rest.arbeitsagentur.de/oauth/gettoken_cc",
        body=postData,encode="form",
        config=httr::config(connecttimeout=60))
token=httr::content(token_request, as='parsed')$access_token
url="https://rest.arbeitsagentur.de/infosysbub/wbsuche/pc/v1/bildungsangebot"
data_request=httr::GET(url=url, httr::add_headers(.headers=c("OAuthAccessToken"=token)),
        config=httr::config(connecttimeout=60))
data=rjson::fromJSON(rawToChar(httr::content(data_request)))

writeLines(jsonlite::toJSON(data1$aggregations,pretty=TRUE,auto_unbox=TRUE),paste0(Sys.Date(),"_wbsuche_aggregations.json"))
