#============================================================
# 05. Count Loop (Meta-Argument)
# Topic: Create MULTIPLE resources from a SINGLE resource block
# Key:   count = N --> creates N copies
#        count.index --> gives current index (0, 1, 2, 3...)
# Limitation: Identified by INDEX, removing middle item shifts all
#============================================================

resource "aws_instance" "roboshop" {
  count = 4  # Creates 4 EC2 instances (index: 0, 1, 2, 3)
  ami           = var.ami_id
  instance_type = "t2.small"
  vpc_security_group_ids = [aws_security_group.allow_all.id]
  tags = {
    # count.index picks value from list: mongodb-dev, redis-dev, mysql-dev, rabbitmq-dev
    Name = "${var.instance_name[count.index]}-dev-server"
  }
}

# Alternative: Simple count with index in name
# resource "aws_instance" "server" {
#   count = 4 # create four similar EC2 instances
#   ami           = var.ami_id
#   instance_type = "t2.micro"
#   tags = {
#     Name = "Server ${count.index}"  # Server 0, Server 1, Server 2, Server 3
#   }
# }


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