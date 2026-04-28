resource "aws_instance" "roboshop" {
  ami           = data.aws_ami.ami_id.id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_all.id]
  tags = var.tags_name
}

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