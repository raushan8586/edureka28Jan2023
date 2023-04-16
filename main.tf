terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.57.0"
    }
  }
}

provider "aws" {
  region     = "ap-south-1"
  access_key = "*****"
  secret_key = "******"
}

//Create VPC
resource "aws_vpc" "edureka-vpc" {
  cidr_block       = "192.168.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "edureka-vpc"
  }
}

//Create Subnets
resource "aws_subnet" "edureka-subnet" {
  vpc_id     = aws_vpc.edureka-vpc.id
  cidr_block = "192.168.0.0/24"

  tags = {
    Name = "edureka-subnet"
  }
}

//Create Internet Gateway
resource "aws_internet_gateway" "edureka-igw" {
  vpc_id = aws_vpc.edureka-vpc.id

  tags = {
    Name = "edureka-igw"
  }
}
