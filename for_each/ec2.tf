resource "aws_instance" "expense" {
    for_each = var.instance #this variable is map
    # for_each will give us a special variable with each name
    ami = "ami-09c813fb71547fc4f"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]
    tags = {
        Name = "each.key"
    }
}

resource "aws_security_group" "allow_ssh_terraform" {
    name    = "allow_sshhh" #allow_sshh is already there
    description = "allow port number 22 for all ssh access"

    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    ingress {
        from_port       = 22
        to_port         = 22
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"] # allowing all
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = {
        Name = "allow-sshh"
    }
}