#============================================================
# Data Source - Fetch EXISTING information from AWS
# Topic: data "<TYPE>" "<NAME>" { filter {} }
# Key Concept: data sources READ info, resources CREATE/MANAGE
# Use Case: Get latest AMI ID dynamically instead of hardcoding
#============================================================

# Fetch AMI ID by name filter - no more hardcoding AMI IDs!
data "aws_ami" "ami_id" {
  filter {
    name   = "name"                        # Filter by AMI name
    values = ["Redhat-9-DevOps-Practice"]  # Matching pattern
  }

  # Additional filters you can use:
  # filter {
  #   name   = "root-device-type"
  #   values = ["ebs"]
  # }
  # filter {
  #   name   = "virtualization-type"
  #   values = ["hvm"]
  # }
}

# Debug: Print the fetched AMI ID
# output "aws_ami_id" {
#     value = data.aws_ami.ami_id.id
# }