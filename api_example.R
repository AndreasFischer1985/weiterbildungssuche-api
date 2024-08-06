#----------------
# Simple Example
#----------------
install.packages(c("devtools","httr","jsonlite"))
devtools::install_github("AndreasFischer1985/qqBaseX")
clientId="infosysbub-wbsuche"
url="https://rest.arbeitsagentur.de/infosysbub/wbsuche/pc/v2/bildungsangebot?ssw=Teilquali"
data_request=httr::GET(url=url, httr::add_headers(.headers=c("X-API-Key"=clientId)),
        config=httr::config(connecttimeout=60))
data=jsonlite::fromJSON(rawToChar(httr::content(data_request)))

f=paste0(Sys.Date(),"_wbsuche.json")
writeLines(jsonlite::toJSON(data,pretty=TRUE,auto_unbox=TRUE),f)
x=jsonlite::fromJSON(paste(readLines(f,encoding="UTF-8"),collapse="\n"));

