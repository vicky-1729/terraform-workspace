#============================================================
# 08. Terraform Built-in Functions
# Topic: length(), merge() and string interpolation
# Key Functions Used:
#   length(list) --> returns count of items in a list
#   merge(map1, map2, ...) --> combines multiple maps into one
# Try in console: terraform console --> length(["a","b","c"])
#============================================================

resource "aws_instance" "roboshop" {
  # length() returns 4 (list has 4 items), so count = 4
  count                  = length(var.instance_name)  # ["mongodb","redis","mysql","rabbitmq"]
  ami                    = var.ami_id
  instance_type          = "t2.small"
  vpc_security_group_ids = [aws_security_group.allow_all.id]

  # merge() combines multiple maps into a single map of tags
  # Result: {project="Intel", terraform=true, version="1.0.0", component="test", Name="mongodb-dev-server"}
  tags = merge(
    var.common_tags,      # {project, terraform, version}
    var.variable_tags,    # {component}
    {
      Name = "${var.instance_name[count.index]}-dev-server"  # Dynamic name per instance
    }
  )
}


resource "aws_security_group" "allow_all" {
  name        = var.sg_name
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
    Name    = "allow-all-tags"
    purpose = "demo-purpose"
  }
}
