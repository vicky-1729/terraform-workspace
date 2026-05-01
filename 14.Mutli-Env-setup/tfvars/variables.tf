#============================================================
# Variables for Multi-Env (tfvars) Demo
# Some variables have NO default = MANDATORY (must come from .tfvars)
#============================================================

variable "ami_id" {
    type = string
  default = "ami-0220d79f3f480ecf5"
}

# No default! Must be provided via -var-file
variable "instance_type" {
    type = string
}

variable "instance_name" {
    type = list(string)
    default = [ "mongodb","redis" ]
}

variable "project" {
    default = "roboshop"
}

# No default! MANDATORY - provided via dev.tfvars or prod.tfvars
variable "env" {
    type = string
}

variable "sg_name" {
    type = string
    default = "allow-all-sg"
}

variable "sg_des" {
    type = string
    default = "creating for the testing purpose"
}

variable "from_port" {
  type = number
  default = 0
}
variable "to_port" {
  type = number
  default = 0
}

variable "cidr_blocks" {
    type = list(string)
    default = [ "0.0.0.0/0" ]
}