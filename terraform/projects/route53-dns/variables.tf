variable "plan" {
  description = "Plan name"
  default     = "route53-dns"
  type        = string
}

variable "region" {
  description = "AWS region"
  default     = "us-west-2"
  type        = string
}
