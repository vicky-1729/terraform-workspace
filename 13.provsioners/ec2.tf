resource "aws_instance" "roboshop" {
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_all.id]
  tags = var.tags_name
  
  # create-time-provisioner
  provisioner "local-exec" {
    command = "echo The servers IP address is ${self.private_ip}>inventory.ini"
    on_failure = continue # getting fail also continued
  }
  # destroy-time-provisioner
  provisioner "local-exec" {
    when = destroy
    command = "echo 'Deleting the resource...!'" 
  }
# login
  connection {
      type     = "ssh"
      user     = "ec2-user"
      password = "DevOps321"
      host     = "${self.public_ip}"
    }
  provisioner "remote-exec" {
    inline = [
       "sudo dnf install nginx -y",
       "sudo systemctl start nginx"
    ]
  }
  provisioner "remote-exec" {
    when = destroy
    inline = [
       "sudo systemctl stop nginx",
       "sudo dnf remove nginx -y",
       "echo 'deleting the server'"
    ]
  }

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