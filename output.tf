output "docker_ip" {
  value = proxmox_lxc.docker.network.0.ip
}

output "jenkins_ip" {
  value = proxmox_lxc.Jenkins.network.0.ip
}

output "ansible_ip" {
  value = proxmox_lxc.Ansible.network.0.ip
}