install.packages("gmailr")
library(blastula)
library(rmarkdown)
library(gmailr)

source("import_and_processing_data.R")

# Fetch the email credentials path from environment variable




if (!colSums(ultima_medicao) == 0) {

 email_creds <- Sys.getenv("EMAIL_CREDENTIALS_PATH")

 email_creds <- create_smtp_creds_file (email_creds, user = '$ {{ EMAIL_SAG }}', provider = 'gmail')

  my_email_object <- render_email("email_test_obje.Rmd")

  smtp_send(my_email_object,
          from = "iotree-email-test@just-genius-337505.iam.gserviceaccount.com",
          to = "pedro.rufino.martins@gmail.com",
          subject = paste0("Erro sensores ", Sys.Date()),
          credentials = creds_file (email_creds)
           )

} else {
  print ("nenhum problema à relatar")
}


getwd ()
 gm_auth_configure(path = '~/Desktop/R_analises/email_test/client_secret_423179119965-m2akvbjrp44p2j2qh74cc0b6eietjcf6.apps.googleusercontent.com.json')
 gm_auth(email = TRUE)

 email <- gm_mime() %>%
 gm_to('pedro.rufino.martins@gmail.com') %>%
 gm_from('pedro.rufino.martins@gmail.com') %>%
 gm_subject(paste0("Erro sensores ", Sys.Date())) %>%
 gm_text_body("test")

 gm_send_message(email)
