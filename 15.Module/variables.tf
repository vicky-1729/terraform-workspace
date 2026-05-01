#============================================================
# Module Input Variables
# Optional = has default value (caller can skip)
# Required = NO default value (caller MUST provide)
#============================================================

# Optional inputs (have defaults)
variable "ami_id" {
    type = string
    default = "ami-0220d79f3f480ecf5"
}

variable "instance_type" {
    type = string
    default = "t2.micro"
}

# Required inputs (NO defaults - caller MUST pass these)
variable "sg_ids" {
    type = list(string)   # List of security group IDs
}

variable "tags" {
    type = map(string)    # Tags map: {Name = "my-server"}
}