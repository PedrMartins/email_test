install.packages("blastula")
library(blastula)
library(rmarkdown)

source("import_and_processing_data.R")




if (!colSums(ultima_medicao) == 0) {

  my_email_object = render_email("email_test_obje.Rmd")
  smtp_send(my_email_object,
          from = "ggnot_throwaway@outlook.com",
          to = "ggnot_throwaway@outlook.com",
          subject = paste0("Erro sensores ", Sys.Date()),
          credentials = creds_file("ggnot_throwaway_creds"))
} else {
  cat ("nenhum problema a relatar")
  }
