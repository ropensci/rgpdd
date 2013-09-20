library("rvest")
library("httr")
download_url <- "https://www.imperial.ac.uk/cpb/gpdd2/download.aspx"
login <- html_form(html(download_url))
session <- html_session(download_url)
form <- set_values(login[[1]], 'Login1$UserName' = "cboettig@ropensci.org", 'Login1$Password' = "ropensci", 'Login1$RememberMe' = "checked")
agreement <- html_form(html(submit_form(session, form)))
agree <- set_values(agreement[[1]], 'chkTermsOK' = "checked")
sessionb <- html_session(download_url)
x <- html(submit_form(session, agree))


