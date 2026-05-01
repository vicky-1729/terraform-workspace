#============================================================
# Variables for for_each Demo
#============================================================

variable "ami_id" {
    type = string
  default = "ami-0220d79f3f480ecf5"
}

variable "instance_type" {
    type = string
    default = "t3.micro"
}

# MAP variable: key = instance name, value = instance type
# for_each iterates over this map
# each.key = "mongodb", each.value = "t2.micro"
variable "instance_tags" {
    type = map(string)
    default = {
        # key : value
      mongodb  = "t2.micro"   # Small instance for MongoDB
      mysql    = "t3.micro"   # Medium for MySQL
      rabbitmq = "t3.small"   # Larger for RabbitMQ
    }
}

# Alternative: LIST variable (use with toset() for for_each)
# variable "tags_name" {
#     type = list
#     default = ["mongodb","mysql"]
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