library(blastula)
library(rmarkdown)

source("import_and_processing_data.R")

# Fetch the email credentials path from environment variable




if (!colSums(ultima_medicao) == 0) {

 email_creds <- Sys.getenv("EMAIL_CREDENTIALS_PATH")
 
 email_creds <- create_smtp_creds_file (email_creds)
 
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
