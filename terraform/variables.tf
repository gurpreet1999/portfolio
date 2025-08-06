variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = ""
}



locals {
  environment     = terraform.workspace
  instance_type = (
    terraform.workspace == "dev"   ? "t3.large" :
    terraform.workspace == "staging" ? "t3.medium" :
    "t3.large"
  )
}