terraform {
  backend "s3" {
    bucket = "2048-game-terraform-locks" 
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
    encrypt        = true
    #dynamodb_table = "2048-game-terraform-locks"
    use_lockfile = true
  }
}
