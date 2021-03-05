data "terraform_remote_state" "aws" {
  backend = "s3"

  config = {
    bucket         = "artichoke-terraform-state"
    region         = "us-west-2"
    key            = "aws/terraform.tfstate"
    encrypt        = true
    dynamodb_table = "terraform_statelock"

    profile = "artichokeruby"
  }
}

locals {
  cargo_deny_version = "0.8.8"
}

resource "github_actions_organization_secret" "cargo_deny_version" {
  secret_name     = "CARGO_DENY_VERSION"
  visibility      = "all"
  plaintext_value = format("version=%s", local.cargo_deny_version)
}

resource "github_actions_organization_secret" "terraform_aws_access_key" {
  secret_name     = "TF_AWS_ACCESS_KEY"
  visibility      = "selected"
  plaintext_value = data.terraform_remote_state.aws.outputs.github_actions_iam_access_id

  selected_repository_ids = [github_repository.project_infrastructure.repo_id]
}

resource "github_actions_organization_secret" "terraform_aws_secret_key" {
  secret_name     = "TF_AWS_SECRET_KEY"
  visibility      = "selected"
  plaintext_value = data.terraform_remote_state.aws.outputs.github_actions_iam_secret_key

  selected_repository_ids = [github_repository.project_infrastructure.repo_id]
}
