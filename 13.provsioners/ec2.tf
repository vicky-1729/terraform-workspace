#============================================================
# 13. Provisioners
# Topic: Run commands/scripts AFTER resource creation or BEFORE destruction
# Types:
#   local-exec  --> runs on YOUR machine (where terraform runs)
#   remote-exec --> runs on the REMOTE server (EC2 via SSH/WinRM)
#   connection  --> SSH/WinRM details to connect to remote server
# Timing:
#   (default)       --> runs at CREATE time
#   when = destroy  --> runs at DESTROY time
# NOTE: Provisioners are a LAST RESORT - prefer user_data or Ansible
#============================================================

resource "aws_instance" "roboshop" {
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_all.id]
  tags = var.tags_name
  
  # --- LOCAL-EXEC: Runs on YOUR machine ---
  # CREATE-TIME: Save server's private IP to inventory file
  provisioner "local-exec" {
    command = "echo The servers IP address is ${self.private_ip}>inventory.ini"
    on_failure = continue  # Don't fail the apply if this command fails
  }

  # DESTROY-TIME: Print message when resource is being destroyed
  provisioner "local-exec" {
    when = destroy
    command = "echo 'Deleting the resource...!'" 
  }

  # --- CONNECTION: How to SSH into the remote server ---
  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = "${self.public_ip}"  # self = current resource
  }

  # --- REMOTE-EXEC: Runs on the EC2 instance ---
  # CREATE-TIME: Install and start Nginx
  provisioner "remote-exec" {
    inline = [
       "sudo dnf install nginx -y",
       "sudo systemctl start nginx"
    ]
  }

  # DESTROY-TIME: Cleanup before destroying the instance
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