library(blastula)
library(rmarkdown)


create_smtp_creds_file("iot_creds",
                       user="gthub_iot@outlook.com",
                       provider = "outlook")


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


