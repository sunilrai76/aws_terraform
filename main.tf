# Configure the AWS Provider
provider "aws" {
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"
    region  = "${var.region}"
}

# Create a new ec2 Instance
resource "aws_instance" "public_ec2" {
  ami = "${var.linux_ami}"
  instance_type = "${var.instance_type}"
  subnet_id = "${aws_subnet.pubic_subnet.id}"
  key_name = "${var.key_name}"
  security_groups = [
      "${aws_security_group.dev-sg.id}"
  ]
  associate_public_ip_address = true
  
  connection {
    type = "ssh"
    user = "${var.user}"
    private_key = "${file(var.private_key_path)}"
    host = self.public_ip
    timeout = "2"
    agent = false
  }

  tags = {
    Name = "terraform-web-server"
  }

provisioner "remote-exec"{
    inline = [
        #!/bin/bash
        "sudo yum update -y",
        "sudo yum install -y httpd",
        "sudo systemctl start httpd",
        "sudo systemctl enable httpd",
        "echo '<h1>Deployed via EC2 by Terrform</h1>' | sudo tee /var/www/html/index.html"
    ]
}
}
