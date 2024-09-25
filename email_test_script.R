install.packages("gmailr")
library(rmarkdown)
library(gmailr)

source("import_and_processing_data.R")

# Fetch the email credentials path from environment variable




if (!colSums(ultima_medicao) == 0) {

 
 gm_auth_configure(path = '~/Desktop/R_analises/email_test/client_secret_423179119965-m2akvbjrp44p2j2qh74cc0b6eietjcf6.apps.googleusercontent.com.json')
 gm_auth(email = TRUE)


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



 
