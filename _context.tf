locals {
  application_name = "kali-linux"
  keys_type        = "RSA"

  region               = "eu-west-3"
  image_virtualization_type = "hvm"

  ec2_keys_name = "${local.application_name}-key"
  instance_ami  = "ami-019165e97403b6aa2"
  instance_type = "t2.medium"
  volume_size = "50"

  all_addresses = ["176.158.178.129/32"]

  inbound_rules = [
    {
      authorized_addresses = "${local.all_addresses}"
      description          = "Listening proxy connection"
      protocol             = "tcp"
      port                 = 8888
    },
    {
      authorized_addresses = ["0.0.0.0/0"]
      description          = "SSH service"
      protocol             = "tcp"
      port                 = 22
    },
    {
      authorized_addresses = ["0.0.0.0/0"]
      description          = "HTTPS service"
      protocol             = "tcp"
      port                 = 443
    }
  ]

  outbound_rules = [
    {
      authorized_addresses = ["0.0.0.0/0"]
      description          = "Service comunicate with every ports"
      protocol             = "-1"
      port                 = 0
    }
  ]
}
