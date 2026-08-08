# ECR Public repositories can only be created in us-east-1; the provider
# passed to this module must be configured for that region.
resource "aws_ecrpublic_repository" "this" {
  repository_name = var.repository_name

  catalog_data {
    description       = var.description
    about_text        = var.about_text
    usage_text        = var.usage_text
    architectures     = var.architectures
    operating_systems = var.operating_systems
  }

  tags = var.tags
}
