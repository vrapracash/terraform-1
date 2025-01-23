locals {
  domain_name = "veeraprakash.online"
  zone_id     = "Z10419222OSUO7G73DLW6"
  instance_type = var.environment == "mysql" ? "t3.small" : "t3.micro"
  #count index will not work in locals
}
