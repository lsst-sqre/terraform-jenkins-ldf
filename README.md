terraform jenkins-ldfc "top level" deployment
===

[![Build Status](https://travis-ci.org/lsst-sqre/terraform-jenkins-ldfc.png)](https://travis-ci.org/lsst-sqre/terraform-jenkins-ldfc)

Usage
---

This package is intended to be used as a "top level" deployment, rather than as
a general purpose module, and thus declares provider configuration that that
may be inappropriate in a module.

`terragrunt` configuration example:

```terraform
terragrunt = {
  terraform {
    source = "git::git@github.com:lsst-sqre/terraform-jenkins-ldfc.git//?ref=master"
  }
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| agent\_pass | password to access jenkins master. | string | n/a | yes |
| agent\_user | username to access jenkins master. | string | n/a | yes |
| env\_name | Name of deployment environment. | string | n/a | yes |
| master\_url | URL of jenkins master to attach agents to. | string | n/a | yes |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

`pre-commit` hooks
---

```bash
go get github.com/segmentio/terraform-docs
pip install --user pre-commit
pre-commit install

# manual run
pre-commit run -a
```

See Also
---

* [`terraform`](https://www.terraform.io/)
* [`terragrunt`](https://github.com/gruntwork-io/terragrunt)
* [`terraform-docs`](https://github.com/segmentio/terraform-docs)
* [`pre-commit`](https://github.com/pre-commit/pre-commit)
* [`pre-commit-terraform`](https://github.com/antonbabenko/pre-commit-terraform)
