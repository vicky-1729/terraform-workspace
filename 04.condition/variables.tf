variable "ami_id" {
    type = string
  default = "ami-0220d79f3f480ecf5"
}

# variable "instance_type" {
#     type = string
#     default = "t3.micro"
# }

variable "env" {
    type = string
    default = "dev"
  
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