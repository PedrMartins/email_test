install.packages("gmailr")
library(rmarkdown)
library(gmailr)

source("import_and_processing_data.R")

# Fetch the email credentials path from environment variable




if (!colSums(ultima_medicao) == 0) {

 
 gm_auth_configure(path = 'client_secret.json')
 gm_auth(
  scopes = "https://www.googleapis.com/auth/gmail.send",
  email = TRUE
)


 my_email_object <- render("email_test_obje.Rmd")
 
 email <- gm_mime() %>%
 gm_to('pedro.rufino.martins@gmail.com') %>%
 gm_from('pedro.rufino.martins@gmail.com') %>%
 gm_subject(paste0("Erro sensores ", Sys.Date())) %>%
 gm_text_body(my_email_object)

 gm_send_message(email)
 
} else {
  print ("nenhum problema à relatar")
}
