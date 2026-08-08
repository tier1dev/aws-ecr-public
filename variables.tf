variable "repository_name" {
  description = "Name of the ECR Public repository."
  type        = string
}

variable "tags" {
  description = "Tags applied to the repository (Company, Application, Environment, Owner, CostCenter, ...)."
  type        = map(string)
}

variable "description" {
  description = "Short description shown on the public gallery listing."
  type        = string
  default     = null
}

variable "about_text" {
  description = "Markdown 'About' text for the public gallery listing."
  type        = string
  default     = null
}

variable "usage_text" {
  description = "Markdown usage instructions for the public gallery listing."
  type        = string
  default     = null
}

variable "architectures" {
  description = "Architectures shown on the gallery listing (e.g. [\"x86-64\", \"ARM 64\"])."
  type        = list(string)
  default     = null
}

variable "operating_systems" {
  description = "Operating systems shown on the gallery listing (e.g. [\"Linux\"])."
  type        = list(string)
  default     = null
}
