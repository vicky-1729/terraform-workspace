#============================================================
# Variables passed to the Module
#============================================================

variable "instance_type" {
  type    = string
  default = "t3.small"   # Overrides module's default of t2.micro
}

variable "sg_ids" {
  type    = list(string)
  default = ["sg-0b03840d19fc5bb2a"]  # Existing SG ID in AWS
}

variable "instance_tags" {
  type = map(string)
  default = {
    Name = "test-server"
  }
}