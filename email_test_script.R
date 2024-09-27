library(blastula)
library(rmarkdown)

source("import_and_processing_data.R")

if (!colSums(ultima_medicao) == 0) {

  
  objct <- render_email("email_test_obje.Rmd")

  
  smtp_send(objct,
            from = "gthub_iot@outlook.com",
            to = "pedro.rufino.martins@gmail.com",
            subject = paste0("Erro sensores ", Sys.Date()),
            credentials = creds_file ("iot_creds")
           )
} else {
  print ("nenhum problema à relatar")
}


