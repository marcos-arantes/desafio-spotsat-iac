# amplify/variables.tf

variable "repository" {
  description = "repositorio da aplicacao"
  default     = "https://github.com/marcos-arantes/desafio-spotsat-app"
}

variable "oauth_token" {
  description = "token de acesso"
  default     = "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"
}

variable "domain_name" {
  description = "Se quiser colocar um dominio customizado"
  default     = "exemplo.com.br"
}