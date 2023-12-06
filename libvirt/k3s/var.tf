// variables that can be overriden
variable "hostname" {
  type = string
  default = "k3s-master"
}

variable "domain" {
  type = string
  default = "local"
}

variable "ip_type" {
  type    = string
  default = "dhcp"
} # dhcp is other valid type

variable "ramGB" {
  type = number
  default = 2
}

variable "diskGB" {
  type = number
  default = 10

}

variable "cpu" {
  type = number
  default = 2
}

variable "private_key_path" {
  description = "Path to the private SSH key, used to access the instance."
  default     = "~/.ssh/terraform_rsa"
}
