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
  description = "Pode colocar um dominio customizado"
  default     = "exemplo.com.br"
}