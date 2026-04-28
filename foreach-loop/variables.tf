variable "ami_id" {
    type = string
  default = "ami-0220d79f3f480ecf5"
}

variable "instance_type" {
    type = string
    default = "t3.micro"
}

# variable "tags_name" {
#     type = list
#     default = ["mongodb","mysql"]
# }
variable "instance_tags" {
    type = map(string)
    default = {
        # key : value
      mongodb = "t2.micro"
      mysql = "t3.micro"
      rabbitmq = "t3.small"
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