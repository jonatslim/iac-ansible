terraform {
    // declare versions required for provider
    required_version =">=0.15"
    required_providers {
        linode = {
            source = "linode/linode"
            version = "1.25.0"
        }
    }
}

// declare linode as a provider.
provider "linode" {
    token = var.linode_pat_token
}

// spin up a server in linode
resource "linode_instance" "ansible" {
    count = var.ansible_count
    image = "linode/ubuntu20.04"
    label = "ansible-${count.index + 1}"
    group = "CFE-Learner-Ansible"
    region = "us-east"
    type = "g6-nanode-1"
    authorized_keys = [ var.authorized_key ]
    root_pass = var.root_user_pw
    tags = [ "python", "ansible","iac" ]
    // add the private IP so that we can use node balancer
    private_ip = true
}

// local template
resource "local_file" "ansible_inventory" {
    content = templatefile(
        "${local.templates_dir}/ansible-inventory.tpl", {
        hosts=[for host in linode_instance.ansible.*: "${host.ip_address}"] 
        }
    )
    filename = "${local.root_dir}/inventory.ini"
    }