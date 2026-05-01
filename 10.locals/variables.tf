#============================================================
# Variables for Locals Demo
#============================================================

# These 3 variables are combined in locals.tf using interpolation
variable "project_name" {
  default = "roboshop"
}

variable "env" {
  default = "dev"
}

variable "component" {
  default = "testing"
}

# NOTE: You CANNOT do this in variables (expressions not allowed):
# variable "final_name" {
#   default = "${var.component}-${var.env}-${var.project_name}"  # ERROR!
# }
# That's why we use LOCALS instead!

# Maps used with merge() in locals
variable "common_tags" {
  type = map(string)
  default = {
    project   = "Intel"
    terraform = true
    version   = "1.0.0"
  }
}
variable "variable_tags" {
  type = map(string)
  default = {
    component = "test"
  }
}





variable "ami_id" {
  type    = string
  default = "ami-0220d79f3f480ecf5"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "tags_name" {
  type = map(string)
  default = {
    Name = "test-server"
  }
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