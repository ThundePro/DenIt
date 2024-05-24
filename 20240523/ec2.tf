data "aws_ami" "ubuntu" {

    most_recent = true

    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }

    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }

    owners = ["099720109477"]
}

resource "aws_instance" "first_ec2" {
    ami = data.aws_ami.ubuntu.id
    instance_type = var.instance_type

    key_name = var.key_name
    associate_public_ip_address = true
    vpc_security_group_ids = [ aws_security_group.ec2.id ]
}

resource "aws_instance" "secon_ec2" {
    ami = data.aws_ami.ubuntu.id
    instance_type = var.instance_type

    key_name = var.key_name
    associate_public_ip_address = true
    vpc_security_group_ids = [ aws_security_group.ec2.id ]
}