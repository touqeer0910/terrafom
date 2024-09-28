vpc_config = {
  cidr_block = "192.168.0.0/16"
  tags = {
    Name = "vpc"
  }
}
subnets = [{
  cidr_block        = "192.168.0.0/24"
  availability_zone = "ap-south-1a"
  vpc_id            = "aws_vpc.main.id"
  tags = {
    Name = "ap-1"
  }
  }, {
  cidr_block        = "192.168.1.0/24"
  availability_zone = "ap-south-1b"
  vpc_id            = "aws_vpc.main.id"
  tags = {
    Name = "app-2"
  }
  }, {
  cidr_block        = "192.168.2.0/24"
  availability_zone = "ap-south-1c"
  vpc_id            = "aws_vpc.main.id"
  tags = {
    Name = "app-3"
  }
  }, {
  cidr_block        = "192.168.3.0/24"
  availability_zone = "ap-south-1a"
  vpc_id            = "aws_vpc.main.id"
  tags = {
    Name = "app-4"
  }
  }, {
  cidr_block        = "192.168.4.0/24"
  availability_zone = "ap-south-1b"
  vpc_id            = "aws_vpc.main.id"
  tags = {
    Name = "app-5"
  }
}]
