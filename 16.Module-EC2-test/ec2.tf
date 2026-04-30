module "ec2" {
  source        = "/Users/vicky/Desktop/Terraform-Practice/15.Module"
  instance_type = var.instance_type
  sg_ids        = var.sg_ids
  tags          = var.instance_tags
}


# public modules

# module "vpc" {
#   source = "terraform-aws-modules/vpc/aws"

# }