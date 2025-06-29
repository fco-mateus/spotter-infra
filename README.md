# Terraform do Projeto Spotter

Esse projeto provisiona a infraestrutura necessária para o projeto https://github.com/fco-mateus/spotter-backend, que, atualmente é:

- Instância RDS (Free tier AWS)
- Bucket S3

Futuramente, esse projeto provisionará também a aplicação Spotter, incluindo front-end, back-end e container de OCR.

## Setup do ambiente
- Crie um arquivo terraform.tfvars e informe os valores das variáveis.
- No `main.tf`, configure o **seu IP**, para que somente você consiga acessar a instância do RDS.

OBS: Esse projeto fornece informações necessárias para configurar as variáveis de ambiente do projeto da API do Spotter.

Dessa forma, é possível provisionar o **banco de dados** e o **bucket S3** na nuvem e a API consome-os enquanto roda localmente.