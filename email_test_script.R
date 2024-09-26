library(blastula)
library(rmarkdown)

smtp_creds <- Sys.getenv("SMTP_CREDS")

source("import_and_processing_data.R")

if (!colSums(ultima_medicao) == 0) {

  
  objct <- render_email("email_test_obje.Rmd")

  getwd ()

  smtp_send(objct,
            from = "gthub_iot@outlook.com",
            to = "pedro.rufino.martins@gmail.com",
            subject = paste0("Erro sensores ", Sys.Date()),
            credentials = creds_file(smtp_creds))
} else {
  cat ("nenhum problema à relatar")
}


