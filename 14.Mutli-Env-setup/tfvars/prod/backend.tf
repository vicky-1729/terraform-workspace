#============================================================
# Prod Backend Config - passed via: terraform init -backend-config=prod/backend.tf
#============================================================

    bucket = "vs-terraform-prod-env"     # Separate S3 bucket for prod state
    key    = "vs-terraform-prod"          # State file path in bucket
    use_lockfile = true                   # S3 native locking
    region = "us-east-1"
    encrypt = true 