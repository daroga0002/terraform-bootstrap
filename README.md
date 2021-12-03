# terraform-bootstrap

This repository can be used as a template for repositories holding Terraform code.

It hold a following configuration files which are usefull in developing terraform code:

* `.editroconfig` **->** EditorConfig helps maintain consistent coding styles for multiple developers working on the same project across various editors and IDEs. More about project under https://editorconfig.org/
* `.pre-commit-config.yaml` **->** framework for managing and maintaining pre-commit git hooks. More about project under https://pre-commit.com/. In this config following hooks are implemented:
  * `terraform_fmt` **->** used to rewrite Terraform configuration files to a canonical format and style. Using `terraform` command.
  * `terraform_validate` **->** validates the configuration files in a directory, referring only to the configuration and not accessing any remote services such as remote state, provider APIs, etc. Using `terraform` command.
  * `terraform_docs` **->** generate documentation from Terraform code using [terraform-docs](https://terraform-docs.io/)
  * `terraform_tflint` **->** code linting using [tflint](https://github.com/terraform-linters/tflint)
  * `end-of-file-fixer` **->** makes sure files end in a newline and only a newline.
  * `trailing-whitespace` **->** trims trailing whitespace.
  * `check-merge-conflict` **->** checks for files that contain merge conflict strings
* `.terraform-docs.yaml` **->** configuration file for [terraform_docs](https://terraform-docs.io/user-guide/configuration/)
* `.tflint.hcl` **->** configuration file for [tflint](https://github.com/terraform-linters/tflint/blob/master/docs/user-guide/config.md)
* `.terraform-version` **->** file specifying `terraform` version which will be used by [tfenv](https://github.com/tfutils/tfenv)

## Requirement

To use configs which are attached here you require following tools installed on your environment:

* [tfenv](https://github.com/tfutils/tfenv)
* [tflint](https://github.com/terraform-linters/tflint)
* [terraform_docs](https://terraform-docs.io/)
* [git](https://git-scm.com/)
* [pre-commit](https://pre-commit.com/)
* native support or plugin in your favourite IDE supporting [Editorconfig](https://editorconfig.org/)

Simplest installation on Mac OS is just:

```bash
brew install git pre-commit tflint tfenv terraform-docs
```

## pre-commit

`pre-commit` hooks are running before any `git commit` done into repository. To run `pre-commit` without commiting just run:

```bash
$ pre-commit run -a
Terraform fmt............................................................Passed
Terraform validate.......................................................Passed
Terraform docs...........................................................Passed
Terraform validate with tflint...........................................Passed
Fix End of Files.........................................................Passed
Trim Trailing Whitespace.................................................Passed
Check for merge conflicts................................................Passed
```

`pre-commit` is checking all hooks and in case of `terraform_fmt` and `terraform_docs` hooks is also fixing all issues (overall result is failed but after second run all hooks should be passed).

If you want commit without triggering hooks you can make it using option [--no-verify](https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks):

```bash
git commit --no-verify
```
