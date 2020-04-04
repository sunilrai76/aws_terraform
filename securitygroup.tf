resource "aws_security_group" "dev-sg" {
name = "allow_all_ssh"
description = "Allow all inbound ssh traffic"
vpc_id = "${aws_vpc.dev_vpc.id}"

ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [
        "${var.cdir_block}"
        ]
}

ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [
        "${var.cdir_block}"
        ]
}

}
