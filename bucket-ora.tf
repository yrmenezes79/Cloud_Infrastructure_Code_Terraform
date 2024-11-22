# Resources
resource "oci_objectstorage_bucket" "tf_bucket" {
  compartment_id = "ocid1.compartment.XXXXXXXXXXXXX"
  name           = "teste234234234"
  namespace      = "axk0nlsgcm5v"
  access_type    = "NoPublicAccess"
}
