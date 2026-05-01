#============================================================
# 07. Dynamic Blocks
# Topic: Generate REPEATED nested blocks (ingress/egress) dynamically
# Why: Avoid writing the same block multiple times for different ports
# Syntax: dynamic "<block_name>" { for_each = ...; content { ... } }
# Works inside: ingress, egress, setting, tag, etc.
#============================================================

# resource "aws_instance" "roboshop" {
#   ami           = var.ami_id
#   instance_type = var.instance_type
#   vpc_security_group_ids = [aws_security_group.allow_all.id]
#   tags = var.tags_name
# }


resource "aws_security_group" "allow_all" {
  name = "allow-all-sg"
  description = "creating for the testing purpose"

  # DYNAMIC ingress: Creates one ingress rule per port in the list
  # Instead of writing 6 ingress blocks, dynamic generates them!
  dynamic "ingress" {
    for_each = var.ingress_ports    # [22, 443, 80, 2473, 8080, 6060]
    content {
            from_port        = ingress.value  # ingress.value = current port number
            to_port          = ingress.value
            protocol         = "-1"
            cidr_blocks      = ["0.0.0.0/0"]
            ipv6_cidr_blocks = ["::/0"]
    }
  }

  # DYNAMIC egress: Same concept for outbound rules
  dynamic "egress" {
    for_each = var.egress_ports     # [22, 443, 80, 2473, 8080, 6060]
    content {
            from_port        = egress.value   # egress.value = current port number
            to_port          = egress.value
            protocol         = "-1"
            cidr_blocks      = ["0.0.0.0/0"]
            ipv6_cidr_blocks = ["::/0"]
    }
  }

  # Static egress rule - allow ALL outbound (fallback)
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow-all-tags"
    purpose = "demo-purpose"
  }
}