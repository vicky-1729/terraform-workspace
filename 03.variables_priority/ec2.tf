#============================================================
# 03. Variable Priority / Precedence
# Topic: Terraform loads variables in this priority (low → high):
#   1. default value in variables.tf          (LOWEST)
#   2. terraform.tfvars file                  
#   3. *.auto.tfvars file                     
#   4. -var-file flag (CLI)                   
#   5. -var flag (CLI)                        
#   6. TF_VAR_<name> environment variable     (HIGHEST)
# NOTE: Higher priority OVERRIDES lower priority
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

  # Inbound rule
  ingress {
    from_port        = var.from_port 
    to_port          = var.to_port 
    protocol         = "-1"
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = ["::/0"]
  }

  # Outbound rule
  egress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = "-1"
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = var.sg_tags  # This value can come from tfvars, CLI, or env variable
  }
}