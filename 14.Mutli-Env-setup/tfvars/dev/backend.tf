#============================================================
# Dev Backend Config - passed via: terraform init -backend-config=dev/backend.tf
#============================================================

    bucket = "vs-terraform-dev-env"      # Separate S3 bucket for dev state
    key    = "vs-terraform-dev"           # State file path in bucket
    use_lockfile = true                   # S3 native locking
    region = "us-east-1"
    encrypt = true 