# ECR Public API only exists in us-east-1.
provider "aws" {
  region = "us-east-1"
}

module "public_repo" {
  source = "../../"

  repository_name = "skynet-example"
  description     = "Example public container image"
  architectures   = ["x86-64", "ARM 64"]

  operating_systems = ["Linux"]

  tags = {
    Company     = "Skynet Core"
    Application = "skynet-example"
    Environment = "prod"
    Owner       = "jon@team-skynet.io"
    CostCenter  = "20001"
  }
}

output "repository_uri" {
  value = module.public_repo.repository_uri
}
