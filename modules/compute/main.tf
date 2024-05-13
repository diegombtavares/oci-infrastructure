resource "oci_core_instance" "oci-instance" {
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
  compartment_id      = var.compartment_id
  shape               = "VM.Standard.E4.Flex"
  source_details {
    source_id   = var.source_id
    source_type = "image"
  }

  display_name = "${var.subdomain}-${local.domain_prefix}"
  create_vnic_details {
    assign_public_ip = true
    subnet_id        = var.subnet_id
  }

  shape_config {
    memory_in_gbs = 4
    ocpus         = 1
  }

  metadata = {
    ssh_authorized_keys = file("/home/diegombtavares/.ssh/gosac-key.pub")
    user_data = base64encode(templatefile("../../cloud-init/cloud-init-config.yaml", {
      subdomain      = var.subdomain
      domain         = var.domain
      domain_prefix  = local.domain_prefix
    }))
  }

  preserve_boot_volume = true
}