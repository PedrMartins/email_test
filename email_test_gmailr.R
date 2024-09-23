library(gmailr)
library(rmarkdown)

source("import_and_processing_data.R")

# Configuração da autenticação com Gmail API
gm_auth_configure(path = Sys.getenv("EMAIL_CREDENTIALS_PATH"))
gm_auth(email = TRUE)

# Gerar o corpo do email a partir do R Markdown
my_email_object <- render_email("email_test_obje.Rmd")

if (!colSums(ultima_medicao) == 0) {
  # Criar o email com o pacote gmailr
  email <- gm_mime() %>%
    gm_to("pedro.rufino.martins@gmail.com") %>%
    gm_from("iotree-email-test@just-genius-337505.iam.gserviceaccount.com") %>%
    gm_subject(paste0("Erro sensores ", Sys.Date())) %>%
    gm_html_body(my_email_object)
  
  # Enviar o email usando a API do Gmail
  gm_send_message(email)
