variable "ami_id" {
    type = string
    default = "ami-0220d79f3f480ecf5"
    # optional
  
}
variable "instance_type" {
    type = string
    default = "t2.micro"
    # optional
}

# mandaroty
variable "sg_ids" {
    type = list(string)
}
variable "tags" {
    type = map(string)
}