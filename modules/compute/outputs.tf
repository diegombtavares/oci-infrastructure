output "instance" {
    value = {
        id   = oci_core_instance.oci-instance.id
        name = oci_core_instance.oci-instance.display_name
        ip   = oci_core_instance.oci-instance.public_ip
    }
}