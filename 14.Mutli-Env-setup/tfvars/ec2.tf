#============================================================
# 14a. Multi-Environment Setup (tfvars Approach)
# Topic: Same code, different environments using .tfvars files
# How it works:
#   terraform plan -var-file=dev/dev.tfvars       --> Dev env
#   terraform plan -var-file=prod/prod.tfvars     --> Prod env
# Each env has its own:
#   - .tfvars file (variable values)
#   - backend.tf (separate state file per env)
# Command:
#   terraform init -backend-config=dev/backend.tf
#   terraform plan -var-file=dev/dev.tfvars
#============================================================

resource "aws_instance" "roboshop" {
  count = length(var.instance_name)
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_all.id]
  tags = {
    # Dynamic name: mongodb-dev-roboshop or mongodb-prod-roboshop
    Name = "${var.instance_name[count.index]}-${var.env}-${var.project}"
  }
}

resource "aws_security_group" "allow_all" {
  name = "${var.sg_name}-${var.env}"   # Unique SG name per env: allow-all-sg-dev
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
    Name = "allow-all-tags-${var.env}"  # Tag includes environment
    purpose = "demo-purpose"
  }
}