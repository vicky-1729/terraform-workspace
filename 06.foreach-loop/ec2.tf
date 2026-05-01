#============================================================
# 06. for_each Loop (Meta-Argument)
# Topic: Create resources from a MAP or SET (better than count!)
# Key:   for_each = var.map_variable
#        each.key   --> map key (e.g., "mongodb")
#        each.value --> map value (e.g., "t2.micro")
# Advantage over count: Identified by KEY name, not index
#   Removing an item does NOT affect other resources!
#============================================================

# each.key = instance name, each.value = instance type
# Creates: mongodb(t2.micro), mysql(t3.micro), rabbitmq(t3.small)
resource "aws_instance" "roboshop" {
  for_each = var.instance_tags          # Iterates over a map
  ami           = var.ami_id
  instance_type = each.value            # Different size per instance
  vpc_security_group_ids = [aws_security_group.allow_all.id]
  tags = {
    Name = "${each.key}-server-dev"     # mongodb-server-dev, mysql-server-dev, etc.
  }
}

# Alternative: for_each with a LIST (must convert to set using toset)
# resource "aws_instance" "roboshop" {
#   for_each = toset(var.tags_name)     # toset() converts list to set
#   ami           = var.ami_id
#   instance_type = "t2.micro"          # Same size for all
#   vpc_security_group_ids = [aws_security_group.allow_all.id]
#   tags = {
#     Name = "${each.key}-server-dev"   # each.key = each.value for sets
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