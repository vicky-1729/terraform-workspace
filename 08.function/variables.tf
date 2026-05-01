#============================================================
# Variables for Functions Demo
#============================================================

variable "ami_id" {
  type    = string
  default = "ami-0220d79f3f480ecf5"
}

# Common tags applied to ALL resources via merge()
variable "common_tags" {
  type = map(string)
  default = {
    project   = "Intel"
    terraform = true
    version   = "1.0.0"
  }
}

# Component-specific tags merged with common_tags
variable "variable_tags" {
  type = map(string)
  default = {
    component = "test"
  }
}

variable "env" {
  type    = string
  default = "dev"
}

variable "tags" {
  default = "server"
}

# length() uses this list to determine count
variable "instance_name" {
  type    = list(string)
  default = ["mongodb", "redis", "mysql", "rabbitmq"]  # length = 4
}

variable "sg_name" {
  type    = string
  default = "allow-all-sg"
}

variable "sg_des" {
  type    = string
  default = "creating for the testing purpose"
}

variable "from_port" {
  type    = number
  default = 0
}
variable "to_port" {
  type    = number
  default = 0
}

variable "cidr_blocks" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}