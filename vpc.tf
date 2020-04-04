# Step 1 . Create a VPC
resource "aws_vpc" "dev_vpc" {
  cidr_block = "${var.vpc_crd_block}"
  enable_dns_hostnames = true

  tags = {
    Name = "dev_vpc"
  }
}

# Step 2. Create Internet Gateway IGW
resource "aws_internet_gateway" "dev_igw" {
  vpc_id = "${aws_vpc.dev_vpc.id}"

  tags = {
      Name = "dev_igw"
  }
}