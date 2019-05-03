variable "agent_user" {
  description = "username to access jenkins master."
}

variable "agent_pass" {
  description = "password to access jenkins master."
}

variable "master_url" {
  description = "URL of jenkins master to attach agents to."
}

variable "env_name" {
  description = "Name of deployment environment."
}
