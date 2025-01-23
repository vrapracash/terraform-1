variable "instances" {
  type        = map
  default     = {
    mysql       = "t3.small"
    backend     = "t3.micro"
    frontend    = "t3.micro"
  }
}

variable "domain_name" {
  default     = "veeraprakash.online"
}

variable "zone_id" {
  default     = "Z10419222OSUO7G73DLW6"
}


