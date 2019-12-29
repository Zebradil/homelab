# Set the variable value in *.tfvars file
# or using the -var="hcloud_token=..." CLI option
variable "hcloud_token" {}

provider "template" {}

provider "external" {}

provider "hcloud" {
  token = "${var.hcloud_token}"
}

data "hcloud_location" "l_1" {
  name = "nbg1"
}

data "hcloud_datacenter" "ds_1" {
  name = "nbg1-dc3"
}

data "template_file" "config" {
  template = "${file("${path.module}/init.tpl")}"

  vars = {
    floating_ip = "${hcloud_floating_ip.master.ip_address}"
  }
}

# Create a new SSH key
resource "hcloud_ssh_key" "default" {
  name       = "personal"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}

resource "hcloud_server" "master" {
  name        = "master"
  image       = "ubuntu-18.04"
  server_type = "cx11"
  datacenter  = "${data.hcloud_datacenter.ds_1.name}"
  ssh_keys    = ["${hcloud_ssh_key.default.id}"]

  user_data = "${data.template_file.config.rendered}"

  provisioner "local-exec" {
    command = "timeout 15m ${path.module}/bin/wait_for_init.sh ${self.ipv4_address}"
  }
}

resource "hcloud_network" "homelab" {
  name     = "homelab"
  ip_range = "10.1.0.0/16"
}

resource "hcloud_network_subnet" "k8s" {
  network_id   = "${hcloud_network.homelab.id}"
  type         = "server"
  network_zone = "eu-central"
  ip_range     = "10.1.0.0/24"
}

resource "hcloud_server_network" "master" {
  server_id  = "${hcloud_server.master.id}"
  network_id = "${hcloud_network.homelab.id}"
  ip         = "10.1.0.2"
}

resource "hcloud_floating_ip" "master" {
  type          = "ipv4"
  home_location = "${data.hcloud_location.l_1.name}"
}

resource "hcloud_floating_ip_assignment" "master" {
  floating_ip_id = "${hcloud_floating_ip.master.id}"
  server_id = "${hcloud_server.master.id}"
}

data "external" "master_node" {
  program = ["${path.module}/bin/get_k3s_info.sh"]

  query = {
    ip = "${hcloud_server.master.ipv4_address}"
  }
}

output "node_token" {
  value = "${data.external.master_node.result.token}"
}

output "master_ip" {
  value = "${hcloud_server.master.ipv4_address}"
}
