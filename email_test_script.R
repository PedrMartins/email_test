library(blastula)
library(rmarkdown)

smtp_creds <- Sys.getenv("SMTP_PASS")


source("import_and_processing_data.R")

if (!colSums(ultima_medicao) == 0) {

  
  objct <- render_email("email_test_obje.Rmd")

  getwd ()

  smtp_send(objct,
            from = "gthub_iot@outlook.com",
            to = "pedro.rufino.martins@gmail.com",
            subject = paste0("Erro sensores ", Sys.Date()),
            credentials = creds_envvar(
              user="gthub_iot@outlook.com"
              provider=
              pass_envvar = Sys.setenv(smtp_creds)
            )
           )
} else {
  cat ("nenhum problema à relatar")
}


