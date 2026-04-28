resource "aws_instance" "roboshop" {
  count                  = length(var.instance_name)
  ami                    = var.ami_id
  instance_type          = "t2.small"
  vpc_security_group_ids = [aws_security_group.allow_all.id]
  # tags = {
  #   Name = "${var.instance_name[count.index]}-dev-server"
  # }
  tags = merge(
    var.common_tags,
    var.variable_tags,
    {
      Name = "${var.instance_name[count.index]}-dev-server"
    }
  )
}

# resource "aws_instance" "server" {
#   count = 4 # create four similar EC2 instances

#   ami           = var.ami_id
#   instance_type = "t2.micro"

#   tags = {
#     Name = "Server ${count.index}"
#   }
# }


resource "aws_security_group" "allow_all" {
  # ... other configuration ...

  name        = var.sg_name
  description = var.sg_des
  # incoming
  ingress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = "-1"
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = ["::/0"]
  }
  # outgoing traffic
  egress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = "-1"
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name    = "allow-all-tags"
    purpose = "demo-purpose"
  }
}