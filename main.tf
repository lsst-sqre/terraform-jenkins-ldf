provider "kubernetes" {
  version = "~> 1.6.2"

  load_config_file = true
}

resource "kubernetes_namespace" "jenkins" {
  metadata {
    name = "jenkins-prod"
  }
}

module "agent" {
  source = "./modules/agent"
  source = "git::https://github.com/lsst-sqre/deploy-jenkins.git//tf/modules/agent"

  name                = "ldf-commons"
  k8s_namespace       = "${kubernetes_namespace.jenkins.metadata.0.name}"
  agent_storage_class = ""
  agent_volume_size   = "1500"
  agent_user          = "${var.jenkins_agent_user}"
  agent_pass          = "${var.jenkins_agent_pass}"
  master_url          = "${var.master_url}"
  agent_replicas      = "5"
  agent_labels        = ["docker", "ldf"]
  agent_executors     = "1"
}
