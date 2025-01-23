resource "aws_instance" "backend" {
    count = length(var.instance_names)
    ami = var.ami_id
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]
    tags = merge (
        var.common_tags,
        {
            Name = var.instance_names[count.index]
        }
    )
}

resource "aws_security_group" "allow_ssh_terraform"{
    name        = var.sg_name
    description = var.sg_description
    # the below is called block the egress block
    egress{
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    } 
    # the belwo is igress block
    ingress{
        from_port        = var.from_port
        to_port          = var.to_port
        protocol         = var.protocol
        cidr_blocks      = var.ingress_cidr
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = var.tags
}