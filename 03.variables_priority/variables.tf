#============================================================
# Variables - Demonstrating Priority
# Try: terraform plan -var="sg_tags=cli-override" to see CLI wins
# Try: export TF_VAR_sg_tags="env-override" to see env var wins
#============================================================

variable "ami_id" {
    type = string
  default = "ami-0220d79f3f480ecf5"
}

variable "instance_type" {
    type = string
    default = "t3.micro"
}

variable "tags_name" {
    type = map(string)
    default = {
        Name= "test-server"
    }
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

# No default = MANDATORY variable (Terraform will prompt for value)
# This demonstrates that tfvars or CLI must provide the value
variable "sg_tags" {
}