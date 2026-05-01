#============================================================
# 14b. Multi-Environment Setup (Workspace Approach)
# Topic: terraform.workspace gives current workspace name
# Commands:
#   terraform workspace new dev     --> create dev workspace
#   terraform workspace new prod    --> create prod workspace
#   terraform workspace select dev  --> switch to dev
#   terraform workspace list        --> show all workspaces
# Key: terraform.workspace = "dev" or "prod" (string)
# Advantage: Single backend, separate state per workspace
#============================================================

resource "aws_instance" "roboshop" {
  count = length(var.instance_name)
  ami           = var.ami_id
  # lookup() picks instance_type from map based on current workspace
  # If workspace="dev" --> t2.micro, workspace="prod" --> t3.small
  # "t2.small" is the fallback if workspace doesn't match any key
  instance_type = lookup(var.instance_type, terraform.workspace, "t2.small")
  vpc_security_group_ids = [aws_security_group.allow_all.id]
  tags = {
    # terraform.workspace auto-inserts current env name
    Name = "${var.instance_name[count.index]}-${terraform.workspace}-${var.project}"
  }
}

resource "aws_security_group" "allow_all" {
  name = "${var.sg_name}-${terraform.workspace}"  # Unique name per workspace
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
    Name = "allow-all-tags-${terraform.workspace}"
    purpose = "demo-purpose"
  }
}