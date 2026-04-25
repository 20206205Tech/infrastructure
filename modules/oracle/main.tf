resource "oci_core_instance" "generated_oci_core_instance" {
  availability_domain = "UMqd:AP-SINGAPORE-1-AD-1"
  compartment_id      = var.OCI_COMPARTMENT_OCID
  display_name        = "instance-20260326-2228"
  shape               = "VM.Standard.A1.Flex"

  agent_config {
    is_management_disabled = "false"
    is_monitoring_disabled = "false"
    plugins_config {
      desired_state = "DISABLED"
      name          = "Vulnerability Scanning"
    }
    plugins_config {
      desired_state = "DISABLED"
      name          = "Management Agent"
    }
    plugins_config {
      desired_state = "ENABLED"
      name          = "Custom Logs Monitoring"
    }
    plugins_config {
      desired_state = "DISABLED"
      name          = "Compute RDMA GPU Monitoring"
    }
    plugins_config {
      desired_state = "ENABLED"
      name          = "Compute Instance Monitoring"
    }
    plugins_config {
      desired_state = "DISABLED"
      name          = "Compute HPC RDMA Auto-Configuration"
    }
    plugins_config {
      desired_state = "DISABLED"
      name          = "Compute HPC RDMA Authentication"
    }
    plugins_config {
      desired_state = "ENABLED"
      name          = "Cloud Guard Workload Protection"
    }
    plugins_config {
      desired_state = "DISABLED"
      name          = "Block Volume Management"
    }
    plugins_config {
      desired_state = "DISABLED"
      name          = "Bastion"
    }
  }

  availability_config {
    recovery_action = "RESTORE_INSTANCE"
  }

  create_vnic_details {
    assign_ipv6ip             = "false"
    assign_private_dns_record = "true"
    assign_public_ip          = "true"
    display_name              = "vps-oracle-free"
    subnet_id                 = oci_core_subnet.generated_oci_core_subnet.id
  }

  instance_options {
    are_legacy_imds_endpoints_disabled = "false"
  }

  is_pv_encryption_in_transit_enabled = "true"

  shape_config {
    memory_in_gbs = "24"
    ocpus         = "4"
  }

  source_details {
    boot_volume_size_in_gbs = "200"
    boot_volume_vpus_per_gb = "10"
    source_id               = "ocid1.image.oc1.ap-singapore-1.aaaaaaaa3rjnbq273x5kzisyx6os5r57735jnhytwkmwx7c5gm4ybkvzi2ua"
    source_type             = "image"
  }

  metadata = {
    ssh_authorized_keys = var.OCI_SSH_PUBLIC_KEY
  }
}

resource "oci_core_vcn" "generated_oci_core_vcn" {
  cidr_block     = "10.0.0.0/16"
  compartment_id = var.OCI_COMPARTMENT_OCID
  display_name   = "vcn-20260326-2229"
  dns_label      = "vcn03262229"
}

resource "oci_core_subnet" "generated_oci_core_subnet" {
  cidr_block     = "10.0.0.0/24"
  compartment_id = var.OCI_COMPARTMENT_OCID
  display_name   = "subnet-20260326-2229"
  dns_label      = "subnet03262229"
  route_table_id = oci_core_vcn.generated_oci_core_vcn.default_route_table_id
  vcn_id         = oci_core_vcn.generated_oci_core_vcn.id
}

resource "oci_core_internet_gateway" "generated_oci_core_internet_gateway" {
  compartment_id = var.OCI_COMPARTMENT_OCID
  display_name   = "Internet Gateway vcn-20260326-2229"
  enabled        = "true"
  vcn_id         = oci_core_vcn.generated_oci_core_vcn.id
}

resource "oci_core_default_route_table" "generated_oci_core_default_route_table" {
  manage_default_resource_id = oci_core_vcn.generated_oci_core_vcn.default_route_table_id

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.generated_oci_core_internet_gateway.id
  }
}

resource "oci_core_default_security_list" "generated_oci_core_default_security_list" {
  manage_default_resource_id = oci_core_vcn.generated_oci_core_vcn.default_security_list_id

  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol    = "all"
  }

  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"
    tcp_options {
      max = 22
      min = 22
    }
  }

#   ingress_security_rules {
#     protocol = "6"
#     source   = "0.0.0.0/0"
#     tcp_options {
#       max = 8000
#       min = 8000
#     }
#   }

#   ingress_security_rules {
#     protocol = "6"
#     source   = "0.0.0.0/0"
#     tcp_options {
#       max = 8080
#       min = 8080
#     }
#   }

#   ingress_security_rules {
#     protocol = "6"
#     source   = "0.0.0.0/0"
#     tcp_options {
#       max = 30002
#       min = 30002
#     }
#   }

#   ingress_security_rules {
#     protocol = "6"
#     source   = "0.0.0.0/0"
#     tcp_options {
#       max = 30003
#       min = 30003
#     }
#   }

#   ingress_security_rules {
#     protocol = "6"
#     source   = "0.0.0.0/0"
#     tcp_options {
#       max = 30004
#       min = 30004
#     }
#   }





  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"
    tcp_options {
      max = 30706
      min = 30706
    }
  }



  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"
    tcp_options {
      max = 31743
      min = 31743
    }
  }



}