variable "ami" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "name" {
  type = string
}

variable "user_data" {
  type    = string
  default = null
}
variable "vpc_security_group_ids" {
  type      = list(string)
  default   = []
}

variable "tags" {
  type = map(string)
  default = {}
}
variable "subnet_id" {
  type = string
}
