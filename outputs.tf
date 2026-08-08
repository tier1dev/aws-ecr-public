output "repository_uri" {
  description = "URI of the repository (public.ecr.aws/<alias>/<name>) for docker push/pull."
  value       = aws_ecrpublic_repository.this.repository_uri
}

output "arn" {
  description = "Full ARN of the repository."
  value       = aws_ecrpublic_repository.this.arn
}

output "registry_id" {
  description = "Registry ID the repository was created in."
  value       = aws_ecrpublic_repository.this.registry_id
}
