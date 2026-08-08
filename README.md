# aws-ecr-public

Terraform module for an [Amazon ECR Public Gallery](https://gallery.ecr.aws/) repository.
Images pushed here are world-readable via `public.ecr.aws/<alias>/<name>`; push access
stays IAM-gated. Gallery listing metadata (description, about, usage, architectures,
operating systems) is managed alongside the repository.

## Region requirement

The ECR Public API only exists in **us-east-1**. The AWS provider passed to this module
must be configured for that region (use a provider alias if your root module runs
elsewhere).

## Usage

```hcl
provider "aws" {
  alias  = "use1"
  region = "us-east-1"
}

module "public_repo" {
  source = "git::https://github.com/tier1dev/aws-ecr-public.git?ref=v0.1.0"

  providers = {
    aws = aws.use1
  }

  repository_name = "my-image"
  description     = "My public container image"

  tags = {
    Company     = "Skynet Core"
    Application = "my-app"
    Environment = "prod"
    Owner       = "jon@team-skynet.io"
    CostCenter  = "20001"
  }
}
```

See [examples/basic](examples/basic) for a working example.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 6.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 6.58.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ecrpublic_repository.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecrpublic_repository) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_about_text"></a> [about\_text](#input\_about\_text) | Markdown 'About' text for the public gallery listing. | `string` | `null` | no |
| <a name="input_architectures"></a> [architectures](#input\_architectures) | Architectures shown on the gallery listing (e.g. ["x86-64", "ARM 64"]). | `list(string)` | `null` | no |
| <a name="input_description"></a> [description](#input\_description) | Short description shown on the public gallery listing. | `string` | `null` | no |
| <a name="input_operating_systems"></a> [operating\_systems](#input\_operating\_systems) | Operating systems shown on the gallery listing (e.g. ["Linux"]). | `list(string)` | `null` | no |
| <a name="input_repository_name"></a> [repository\_name](#input\_repository\_name) | Name of the ECR Public repository. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags applied to the repository (Company, Application, Environment, Owner, CostCenter, ...). | `map(string)` | n/a | yes |
| <a name="input_usage_text"></a> [usage\_text](#input\_usage\_text) | Markdown usage instructions for the public gallery listing. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | Full ARN of the repository. |
| <a name="output_registry_id"></a> [registry\_id](#output\_registry\_id) | Registry ID the repository was created in. |
| <a name="output_repository_uri"></a> [repository\_uri](#output\_repository\_uri) | URI of the repository (public.ecr.aws/<alias>/<name>) for docker push/pull. |
<!-- END_TF_DOCS -->
