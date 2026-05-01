#============================================================
# 11. Terraform State File (Local)
# Topic: terraform.tfstate - The BRAIN of Terraform
# Key Concepts:
#   - State file tracks what resources Terraform manages
#   - terraform.tfstate = current state (JSON format)
#   - terraform.tfstate.backup = previous state backup
#   - NEVER manually edit the state file!
#   - State file contains sensitive data (IPs, IDs, etc.)
# Commands: terraform state list | terraform state show <resource>
#============================================================

resource "aws_instance" "roboshop" {
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_all.id]
  tags = var.tags_name
}

resource "aws_security_group" "allow_all" {
  name = var.sg_name
  description = var.sg_des

  ingress {
    from_port        = var.from_port 
    to_port          = var.to_port 
    protocol         = "-1"
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = ["::/0"]
  }
      
  egress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = "-1"
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow-all-tags"
    purpose = "demo-purpose"
  }
}