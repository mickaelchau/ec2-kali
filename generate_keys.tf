resource "tls_private_key" "keys" {
  algorithm = local.keys_type
}

module "key_pair" {
  source     = "terraform-aws-modules/key-pair/aws"
  key_name   = "created_key"
  public_key = tls_private_key.keys.public_key_openssh
}

resource "aws_key_pair" "ec2_keys" {
  key_name   = local.ec2_keys_name
  public_key = tls_private_key.keys.public_key_openssh
}

resource "local_file" "local_pem" {
  filename = "${path.module}/${local.ec2_keys_name}.pem"
  content  = tls_private_key.keys.private_key_pem
}