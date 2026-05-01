#============================================================
# Variables for Workspace Approach
# Note: instance_type is a MAP - lookup() picks by workspace name
#============================================================

variable "ami_id" {
    type = string
  default = "ami-0220d79f3f480ecf5"
}

# MAP: workspace name --> instance type
# lookup(var.instance_type, terraform.workspace, "t2.small")
variable "instance_type" {
    type = map(string)
    default = {
      dev  = "t2.micro"   # Dev gets smaller instance
      prod = "t3.small"   # Prod gets larger instance
    }
}

variable "instance_name" {
    type = list(string)
    default = [ "mongodb","redis" ]
}

variable "project" {
    default = "roboshop"
}

# env variable NOT needed - terraform.workspace replaces it!
# variable "env" {
#     type = string
# }

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