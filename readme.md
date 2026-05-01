# Terraform Practice - Beginner to Advanced

A hands-on Terraform training covering AWS infrastructure from basics to advanced concepts.

## Topics Covered

| # | Folder | Topic |
|---|--------|-------|
| 01 | `01.Ec2` | Basic EC2 & Security Group with hardcoded values |
| 02 | `02.variables` | Variables (`string`, `number`, `list`, `map`) to replace hardcoded values |
| 03 | `03.variables_priority` | Variable precedence: default → tfvars → CLI → env var |
| 04 | `04.condition` | Conditional expressions using ternary operator (`? :`) |
| 05 | `05.count-loop` | `count` meta-argument to create multiple resources |
| 06 | `06.foreach-loop` | `for_each` with maps & sets (better than count) |
| 07 | `07.dynamic-loop` | `dynamic` blocks for repeated nested blocks (ingress/egress) |
| 08 | `08.function` | Built-in functions: `length()`, `merge()` |
| 09 | `09.datasoucre` | Data sources to fetch existing AWS info (AMI lookup) |
| 10 | `10.locals` | Locals for computed values (what variables can't do) |
| 11 | `11.statefile` | Terraform state file (local) |
| 12 | `12.statefile-s3` | Remote state in S3 with DynamoDB vs S3 native locking |
| 13 | `13.provsioners` | Provisioners: `local-exec`, `remote-exec`, `connection` |
| 14 | `14.Mutli-Env-setup` | Multi-environment: **tfvars** approach & **workspace** approach |
| 15 | `15.Module` | Creating a reusable Terraform module |
| 16 | `16.Module-EC2-test` | Consuming a module (local & registry) |
| 17 | `17. Terrform_import` | Importing existing AWS resources into Terraform |

## Prerequisites

- Terraform installed
- AWS CLI configured with credentials
- S3 bucket for remote state (folders 12–14)

## Quick Commands

```bash
terraform init          # Initialize & download providers
terraform plan          # Preview changes
terraform apply         # Apply changes
terraform destroy       # Destroy all resources
terraform state list    # List resources in state
terraform console       # Interactive expression testing
```
