#============================================================
# Variable Definitions
# Syntax:  variable "<name>" { type, default, description }
# Usage:   var.<name> in resource blocks
# Types:   string, number, bool, list, map, set, object, tuple
#============================================================

# --- EC2 Variables ---
variable "ami_id" {
    type = string
  default = "ami-0220d79f3f480ecf5"  # RHEL 9 DevOps Practice AMI
}

variable "instance_type" {
    type = string
    default = "t3.micro"  # 2 vCPU, 1 GB RAM
}

variable "tags_name" {
    type = map(string)    # map = key-value pairs {"key" = "value"}
    default = {
        Name= "test-server"
    }
}

# --- Security Group Variables ---
variable "sg_name" {
    type = string
    default = "allow-all-sg"
}

variable "sg_des" {
    type = string
    default = "creating for the testing purpose"
}

variable "from_port" {
  type = number    # number type - no quotes needed
  default = 0
}
variable "to_port" {
  type = number
  default = 0
}

variable "cidr_blocks" {
    type = list(string)   # list = ordered collection ["a", "b", "c"]
    default = [ "0.0.0.0/0" ]
}