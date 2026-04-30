resource "aws_instance" "roboshop" {
  ami                    = "ami-0220d79f3f480ecf5"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_all.id]
  tags = {
    Name = "test-server"
  }

}

resource "aws_security_group" "allow_all" {
  # ... other configuration ...

  name        = "allow-all-sg"
  description = "creating for the testing purpose"
  # incoming
  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  # outgoing traffic
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