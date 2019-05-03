provider "kubernetes" {
  version = "~> 1.6.2"

  load_config_file = true
}

locals {
  app_name    = "jenkins"
  app_version = "1.0.0"
}

resource "kubernetes_namespace" "jenkins" {
  metadata {
    name = "${local.app_name}-${var.env_name}"

    labels {
      "app.k8s.io/name"       = "${local.app_name}"
      "app.k8s.io/instance"   = "${var.env_name}"
      "app.k8s.io/version"    = "${local.app_version}"
      "app.k8s.io/component"  = "agent"
      "app.k8s.io/part-of"    = "jenkins"
      "app.k8s.io/managed-by" = "terraform"
    }
  }
}

module "agent" {
  source = "git::https://github.com/lsst-sqre/deploy-jenkins.git//tf/modules/agent-ldfc"

  name                = "agent-ldfc"
  k8s_namespace       = "${kubernetes_namespace.jenkins.metadata.0.name}"
  agent_storage_class = ""
  agent_volume_size   = "1500"
  agent_user          = "${var.jenkins_agent_user}"
  agent_pass          = "${var.jenkins_agent_pass}"
  master_url          = "${var.master_url}"
  agent_replicas      = "5"
  agent_labels        = ["docker", "ldfc"]
  agent_executors     = "1"
  env_name            = "${var.env_name}"
  swarm_image         = "lsstsqre/jenkins-swarm-client:3.15-ldfc"
  agent_uid           = "48435"
  agent_gid           = "202"
}
