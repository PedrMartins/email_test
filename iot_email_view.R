
library(blastula)
library(rmarkdown)


source("import_and_processing_data.R")

if (!colSums(ultima_medicao) == 0) {


recip <- c("pedro.rufino.martins@gmail.com", "gthub_iot@outlook.com")
  objct <- render_email("email_objet_iot.Rmd")
  

  smtp_send(objct,
            from = "pedro.rufino.martins@gmail.com",
            to = recip,
            subject = paste0("Erro sensores ", Sys.Date()),
            credentials = creds_file("iot_creds"))


} else {
  print ("nenhum problema à relatar")
}

