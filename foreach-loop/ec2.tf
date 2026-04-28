resource "aws_instance" "roboshop" {
  for_each = var.instance_tags
  ami           = var.ami_id
  instance_type = each.value
  vpc_security_group_ids = [aws_security_group.allow_all.id]
  tags = {
    Name = "${each.key}-server-dev"
  }
}
# resource "aws_instance" "roboshop" {
#   for_each = toset(var.tags_name) # convert to map
#   ami           = var.ami_id
#   instance_type = "t2.micro"
#   vpc_security_group_ids = [aws_security_group.allow_all.id]
#   tags = {
#     Name = "${each.key}-server-dev"
#   }
# }
resource "aws_security_group" "allow_all" {
  # ... other configuration ...
  
  name = var.sg_name
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

  tags ={
    Name = "allow-all-tags"
    purpose = "demo-purpose"
  }
}