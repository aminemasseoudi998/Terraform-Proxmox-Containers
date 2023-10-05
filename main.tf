terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      #latest version as of Nov 30 2022
      version = "2.9.14"
    }
  }
}
provider "proxmox" {
  # References our vars.tf file to plug in the api_url 
  pm_api_url = var.api_url
  # References our secrets.tfvars file to plug in our token_id
  pm_api_token_id = var.token_id
  # References our secrets.tfvars to plug in our token_secret 
  pm_api_token_secret = var.token_secret
  # Default to `true` unless you have TLS working within your pve setup 
  pm_tls_insecure = true
}



resource "proxmox_lxc" "docker" {
  target_node     = "pve"
  hostname        = "Docker-node"
  ostemplate      = "local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
  unprivileged    = true
  password        = "root123"
  ssh_public_keys = <<-EOT
    ${var.ssh_key}
  EOT



  features {

    nesting = true

  }


  // Terraform will crash without rootfs defined
  rootfs {
    storage = "local-lvm"
    size    = "10G"
  }
  

  network {
    name   = "ens33"
    bridge = "vmbr0"
    ip     = "192.168.1.30/24"
    ip6    = "auto"
    gw     = "192.168.1.1"
    
 

  }

}


resource "proxmox_lxc" "Jenkins" {
  target_node     = "pve"
  hostname        = "Jenkins-node"
  ostemplate      = "local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
  unprivileged    = true
  password        = "root123"
  ssh_public_keys = <<-EOT
    ${var.ssh_key}
  EOT



  features {

    nesting = true

  }


  // Terraform will crash without rootfs defined
  rootfs {
    storage = "local-lvm"
    size    = "10G"
  }
  

  network {
    name   = "ens33"
    bridge = "vmbr0"
    ip     = "192.168.1.31/24"
    ip6    = "auto"
    gw     = "192.168.1.1"
    
 


  }

}
resource "proxmox_lxc" "Ansible" {
  target_node     = "pve"
  hostname        = "Ansible-node"
  ostemplate      = "local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
  unprivileged    = true
  password        = "root123"
  ssh_public_keys = <<-EOT
    ${var.ssh_key}
  EOT



  features {

    nesting = true

  }


  // Terraform will crash without rootfs defined
  rootfs {
    storage = "local-lvm"
    size    = "10G"
  }
  

  network {
    name   = "ens33"
    bridge = "vmbr0"
    ip     = "192.168.1.32/24"
    ip6    = "auto"
    gw     = "192.168.1.1"
 

  }

}

