resource "oci_core_vcn" "test_vcn" {
        compartment_id = "ocid1.compartment.oc1..aaaaaaaaw2dcdpnhctp7evmarnajzxqrjwc57leftxhcdzlhebni4ylgfc7q"
        cidr_blocks = ["10.0.0.0/16", "172.168.0.0/20"]
        display_name = "vnc_inlab"
}
