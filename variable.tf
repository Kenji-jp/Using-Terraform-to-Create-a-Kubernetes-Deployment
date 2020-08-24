variable "app_label" {
  type        = string
  default     = "wordpress"
}

variable "mysql_tier" {
  type        = string
  default     = "mysql"
}

variable "wordpress_tier" {
  type        = string
  default     = "frontend"
}

variable "wordpress_version" {
  type        = string
  default     = "4.7.3"
}

variable "mysql_password" {
  type        = string
  default     = "P4sSw0rd!"
}
