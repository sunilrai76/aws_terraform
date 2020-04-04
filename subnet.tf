#Step 3 create subnet
resource "aws_subnet" "pubic_subnet" {
    cidr_block = "10.0.1.0/24"
    vpc_id = "${aws_vpc.dev_vpc.id}"
    availability_zone = "us-east-1a"
    tags = {
        Name = "public_subnet"
    }
}

#Step 4 create subnet
resource "aws_subnet" "private_subnet" {
    cidr_block = "10.0.2.0/24"
    vpc_id = "${aws_vpc.dev_vpc.id}"
    availability_zone = "us-east-1b"
    tags = {
        Name = "private_subnet"
    }
}
