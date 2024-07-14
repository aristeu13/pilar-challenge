terraform {
  backend "s3" {
    bucket         = "aristeu-terraform-states"
    key            = "pilar-challenge-state/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = false
  }
}