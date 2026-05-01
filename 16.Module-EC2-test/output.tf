#============================================================
# Outputs from Module - Access via module.<name>.<output>
# These expose the module's outputs to the user/caller
#============================================================

output "pub_ip" {
  value = module.ec2.public_ip      # From module's output.tf
}
output "prv_ip" {
  value = module.ec2.private_ip     # From module's output.tf
}
output "instance_id" {
  value = module.ec2.instance_id    # From module's output.tf
}

