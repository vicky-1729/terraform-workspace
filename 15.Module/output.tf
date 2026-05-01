#============================================================
# Module Outputs - Values returned to the CALLER
# The caller accesses these as: module.<name>.<output_name>
# Example: module.ec2.public_ip
#============================================================

output "public_ip" {
    value = aws_instance.this.public_ip   # Public IP of the EC2
}
output "private_ip" {
    value = aws_instance.this.private_ip  # Private IP of the EC2
}
output "instance_id" {
    value = aws_instance.this.id          # Instance ID (e.g., i-0abc123...)
}