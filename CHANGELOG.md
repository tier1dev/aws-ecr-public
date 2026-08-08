# Changelog

All notable changes to this module are documented here. The format follows
[Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and this project adheres to
[Semantic Versioning](https://semver.org/).

## [Unreleased]

## [0.1.0] - 2026-08-08

### Added

- `aws_ecrpublic_repository` resource with gallery catalog data (description, about,
  usage, architectures, operating systems).
- Required `tags` map input; outputs `repository_uri`, `arn`, `registry_id`.
- `examples/basic` working example.
- CI gate (fmt, validate, tflint, tfsec) via GitHub Actions and pre-commit.

### Changed

- Rewritten from the original private-`aws_ecr_repository` draft, which did not pass
  `terraform validate` (duplicate variables, SNS leftovers, invalid `lifecycle_policy`
  block) and shipped a `Principal: "*"` push/pull repository policy.

[Unreleased]: https://github.com/tier1dev/aws-ecr-public/compare/v0.1.0...HEAD
[0.1.0]: https://github.com/tier1dev/aws-ecr-public/releases/tag/v0.1.0
