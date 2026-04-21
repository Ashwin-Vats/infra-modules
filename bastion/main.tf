data "aws_ami" "amazon_linux" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "bastion" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"

  subnet_id = var.public_subnets[0]

  vpc_security_group_ids = [
    var.bastion_sg_id
  ]

  key_name = var.key_name

  tags = {
    Name = "${var.env}-bastion"
  }
}