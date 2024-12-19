# Email automation

This repository is using the bastula package and gitihub action to send alert emails about sensor status.

On github action was made from a workflow code in YAML language [email.yml](https://github.com/PedrMartins/email_iotree/blob/main/.github/workflows/email.yml).

To do the data analises we coding in R language on this two scripts [email_iot_script.R](https://github.com/PedrMartins/email_iotree/blob/main/email_iot_script.R) to separate and processing the sensors which have faill and the [email_objet_iot.Rmd](https://github.com/PedrMartins/email_iotree/blob/main/email_objet_iot.Rmd) to send a table in html format

to have a google permission to send email you must have a app password. To do this follow this guide  []()



[![.github/workflows/email.yml](https://github.com/PedrMartins/email_iotree/actions/workflows/email.yml/badge.svg)](https://github.com/PedrMartins/email_iotree/actions/workflows/email.yml)
