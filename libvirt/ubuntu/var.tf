// variables that can be overriden
variable "hostname" {
  type = string
}

variable "domain" {
  type = string
}

variable "ip_type" {
  type    = string
  default = "dhcp"
} # dhcp is other valid type

variable "ramGB" {
  type = number
}

variable "diskGB" {
  type = number

}

variable "cpu" {
  type = number
}

variable "private_key_path" {
  description = "Path to the private SSH key, used to access the instance."
  default     = "~/.ssh/id_rsa"
}