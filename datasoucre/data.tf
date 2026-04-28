data "aws_ami" "ami_id" {

  filter {
    name   = "name"
    values = ["Redhat-9-DevOps-Practice"]
  }

#   filter {
#     name   = "root-device-type"
#     values = ["ebs"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }
}


# output "aws_ami_id"{
#     value = data.aws_ami.ami_id.id
# }