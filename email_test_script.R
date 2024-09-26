library(blastula)
library(rmarkdown)

smtp_user <- Sys.getenv("SMTP_USER")
smtp_pass <- Sys.getenv("SMTP_PASS")

# Create SMTP credentials file using environment variables
create_smtp_creds_file(
  file = "iot_creds",
  user = smtp_user,
  provider = "outlook",
  password = smtp_pass
)

source("import_and_processing_data.R")

if (!colSums(ultima_medicao) == 0) {

  
  objct <- render_email("email_test_obje.Rmd")

  getwd ()

  smtp_send(objct,
            from = "gthub_iot@outlook.com",
            to = "pedro.rufino.martins@gmail.com",
            subject = paste0("Erro sensores ", Sys.Date()),
            credentials = creds_file("iot_creds"))
} else {
  cat ("nenhum problema à relatar")
}


