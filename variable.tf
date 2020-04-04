variable "region_number" {
  default = {
      us-east-1 = 1 # Virginia
      us-east-2 = 2 # ohio
  }
}
variable "az_number"{
    default = {
        a = 1
        b = 2
    }
}

variable "region" {
  default = "us-east-1"
  description = "US East (N. Virginia)"
}


variable "vpc_crd_block" {
    default = "10.0.0.0/16"
    description = "cidr blaock for vpc"
}

variable "cdir_block" {
  default = "0.0.0.0/0"
}


variable "subnet_cidr_block" {
  default = {
      public = "10.0.1.0/24"
      private = "10.0.2.0/24"
  }
  description = "subnet cidr black"
}

variable "linux_ami" {
  default = "ami-09a5b0b7edf08843d"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  
}
variable "private_key_path" {
  
}

variable "user" {
  default = "ec2-user"
}

variable "access_key" {
  
}

variable "secret_key" {
  
}





