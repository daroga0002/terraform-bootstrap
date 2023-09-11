config {
  module = true
  force = false
  disabled_by_default = false
}

plugin "aws" {
  enabled = true
  version = "0.26.0"
  source  = "github.com/terraform-linters/tflint-ruleset-aws"
}
