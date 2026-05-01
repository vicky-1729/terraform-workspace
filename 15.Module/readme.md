# EC2 Instance Module

A reusable Terraform module that creates an AWS EC2 instance.

## Usage

```hcl
module "ec2" {
  source        = "../15.Module"
  sg_ids        = ["sg-0abc123def456"]
  tags          = { Name = "my-server" }

  # Optional overrides
  # ami_id        = "ami-xxxxxxxxxxxxxxxxx"
  # instance_type = "t3.medium"
}
```

## Inputs

| Name | Type | Required | Default | Description |
|------|------|----------|---------|-------------|
| `ami_id` | `string` | No | `ami-0220d79f3f480ecf5` | AMI ID for the EC2 instance |
| `instance_type` | `string` | No | `t2.micro` | EC2 instance type |
| `sg_ids` | `list(string)` | Yes | — | List of security group IDs |
| `tags` | `map(string)` | Yes | — | Tags to apply to the instance |

## Outputs

| Name | Description |
|------|-------------|
| `public_ip` | Public IP address of the instance |
| `private_ip` | Private IP address of the instance |
| `instance_id` | ID of the created EC2 instance |