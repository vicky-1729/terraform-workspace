#============================================================
# 01. Basic EC2 Instance Creation
# Topic: Creating your FIRST EC2 instance with hardcoded values
# Key Concept: resource "<PROVIDER>_<TYPE>" "<NAME>" { ... }
#============================================================

# EC2 Instance - This is the virtual server in AWS
resource "aws_instance" "roboshop" {
  ami                    = "ami-0220d79f3f480ecf5"  # Amazon Machine Image (OS image)
  instance_type          = "t3.micro"               # Server size (CPU + RAM)
  vpc_security_group_ids = [aws_security_group.allow_all.id]  # Attach SG using reference
  tags = {
    Name = "test-server"  # Name visible in AWS Console
  }
}

# Security Group - Acts as a virtual firewall for your EC2 instance
resource "aws_security_group" "allow_all" {
  name        = "allow-all-sg"
  description = "creating for the testing purpose"

  # Ingress = Inbound rules (who can access your server)
  ingress {
    from_port        = 0       # 0 means all ports
    to_port          = 0       # 0 means all ports
    protocol         = "-1"    # -1 means all protocols (TCP, UDP, etc.)
    cidr_blocks      = ["0.0.0.0/0"]   # 0.0.0.0/0 = allow from anywhere (IPv4)
    ipv6_cidr_blocks = ["::/0"]         # ::/0 = allow from anywhere (IPv6)
  }

  # Egress = Outbound rules (where your server can connect to)
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name    = "allow-all-tags"
    purpose = "demo-purpose"
  }
}