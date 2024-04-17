module "key_pair" {
  source             = "terraform-aws-modules/key-pair/aws"
  key_name           = "boon-key"
  create_private_key = true
}

resource "null_resource" "write_key" {
  provisioner "local-exec" {
    command   = "echo '${module.key_pair.private_key_openssh}' > private_key.pem && echo '${module.key_pair.public_key_openssh}' > boon_key.pub "
  }
}

