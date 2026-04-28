# resource "aws_instance" "roboshop" {
#   ami           = var.ami_id
#   instance_type = var.instance_type
#   vpc_security_group_ids = [aws_security_group.allow_all.id]
#   tags = var.tags_name
# }


resource "aws_security_group" "allow_all" {
  # ... other configuration ...
  
  name = "allow-all-sg"
  description = "creating for the testing purpose"
  # incoming
  dynamic "ingress" {
    for_each = var.ingress_ports
    content {
            from_port        = ingress.value
            to_port          = ingress.value
            protocol         = "-1"
            cidr_blocks      = ["0.0.0.0/0"]
            ipv6_cidr_blocks = ["::/0"]
    }
  }
  dynamic "egress" {
    for_each = var.egress_ports
    content {
            from_port        = egress.value
            to_port          = egress.value
            protocol         = "-1"
            cidr_blocks      = ["0.0.0.0/0"]
            ipv6_cidr_blocks = ["::/0"]
    }
  }



# outgoing traffic
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags ={
    Name = "allow-all-tags"
    purpose = "demo-purpose"
  }
}