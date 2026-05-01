#============================================================
# 02. EC2 with Variables
# Topic: Replace hardcoded values with variables using var.<name>
# Why: Makes code reusable, flexible, and easy to maintain
#============================================================

# Now using var.xxx instead of hardcoded values
resource "aws_instance" "roboshop" {
  ami           = var.ami_id          # Fetched from variables.tf
  instance_type = var.instance_type   # Fetched from variables.tf
  vpc_security_group_ids = [aws_security_group.allow_all.id]
  tags = var.tags_name                # map(string) variable for tags
}

resource "aws_security_group" "allow_all" {
  name = var.sg_name
  description = var.sg_des

  # Inbound rule - using variable references
  ingress {
    from_port        = var.from_port   # number type variable
    to_port          = var.to_port 
    protocol         = "-1"
    cidr_blocks      = var.cidr_blocks # list(string) type variable
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
    Name = "allow-all-tags"
    purpose = "demo-purpose"
  }
}