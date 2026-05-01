#============================================================
# 15. Terraform Module (Reusable Component)
# Topic: Create a REUSABLE module that others can call
# This folder IS the module - it contains resource + variables + outputs
# Structure of a module:
#   Ec2.tf       --> Resource definition
#   variables.tf --> Input variables (parameters)
#   output.tf    --> Output values (return values)
# Whoever CALLS this module passes values for the variables
#============================================================

resource "aws_instance" "this" {
  ami                    = var.ami_id          # Optional: has default
  instance_type          = var.instance_type   # Optional: has default
  vpc_security_group_ids = var.sg_ids          # REQUIRED: caller must provide
  tags                   = var.tags            # REQUIRED: caller must provide
}