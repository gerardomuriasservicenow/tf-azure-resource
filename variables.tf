variable "stack_name" {
  type    = string
  default = "gerardomysqlserverinstance1"
}

variable "location" {
  type = string
  default = "West Europe"
}

variable "bdd_admin_user"{
  type = string
  default = "mysqladminun"
}

variable "bdd_admin_pwd"{
  type = string
  default = "H@Sh1CoR3!"
}

variable "subsId" {
    
}

variable "clientId" {
}

variable "clientSecret" {
}

variable "tenantId" {
}
