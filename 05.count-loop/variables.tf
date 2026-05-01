#============================================================
# Variables for Count Loop Demo
#============================================================

variable "ami_id" {
    type = string
  default = "ami-0220d79f3f480ecf5"
}

variable "env" {
    type = string
    default = "dev"
}

variable "tags" {
  default = "server"
}

# List of instance names - used with count.index to name each EC2
# count.index 0 = mongodb, 1 = redis, 2 = mysql, 3 = rabbitmq
variable "instance_name" {
  type = list(string)
  default = [ "mongodb","redis","mysql","rabbitmq" ]
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