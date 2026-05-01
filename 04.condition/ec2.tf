#============================================================
# 04. Conditional Expression
# Topic: Ternary operator --> condition ? true_value : false_value
# Use Case: Pick different instance types based on environment
# Example: prod gets t2.micro, everything else gets t3.small
#============================================================

resource "aws_instance" "roboshop" {
  ami           = var.ami_id
  # CONDITIONAL: if env is "prod" use t2.micro, else use t3.small
  instance_type = var.env == "prod" ? "t2.micro" : "t3.small"
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