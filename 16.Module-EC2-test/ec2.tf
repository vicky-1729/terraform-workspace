#============================================================
# 16. Using a Module (Module Consumer)
# Topic: Call a reusable module using the module block
# Syntax: module "<name>" { source = "<path>" ; inputs... }
# source can be: local path, Git URL, Terraform Registry
#============================================================

# Calling our custom EC2 module from folder 15.Module
module "ec2" {
  source        = "/Users/vicky/Desktop/Terraform-Practice/15.Module"  # Local module path
  instance_type = var.instance_type   # Override default t2.micro with t3.small
  sg_ids        = var.sg_ids          # Required: pass security group IDs
  tags          = var.instance_tags   # Required: pass tags map
}

# You can also use PUBLIC modules from Terraform Registry:
# module "vpc" {
#   source = "terraform-aws-modules/vpc/aws"  # Registry: <namespace>/<name>/<provider>
# }