#============================================================
# 17. Terraform Import
# Topic: Bring EXISTING AWS resources under Terraform management
# Use Case: Resource was created manually in AWS Console
# Command: terraform import aws_instance.example <instance-id>
# Steps:
#   1. Write the resource block (this file)
#   2. Run: terraform import aws_instance.example i-0xxxx
#   3. Terraform adds it to state file
#   4. Run: terraform plan (should show no changes if config matches)
# NOTE: Import does NOT generate code - you must write the config!
#============================================================

resource "aws_instance" "example" {
   ami           = "ami-098e39bafa7e7303d"
   instance_type = "t3.micro"
   tags = {
     Name = "roboshop-server"
   }
}
