
variable "image_id" {
  type = string
}
variable "subnet" {
}
variable "security_groups" {
  type = list(string)
  description = "Web Instance security_groups"
}


