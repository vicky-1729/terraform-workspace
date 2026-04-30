variable "instance_type" {
  type    = string
  default = "t3.small"
}

variable "sg_ids" {
  type    = list(string)
  default = ["sg-0b03840d19fc5bb2a"]
}
variable "instance_tags" {
  type = map(string)
  default = {
    Name = "test-server"
  }
}