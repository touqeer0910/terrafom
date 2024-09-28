variable "vpc_config" {
  type = object({
    cidr_block = string
    tags       = map(string)

  })
  default = {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "vpc_1"
    }
  }

}
variable "subnets" {
  type = list(object({
    cidr_block        = string
    availability_zone = string
    vpc_id            = string
    tags              = map(string)
  }))
  default = [{
    cidr_block        = "10.0.0.0/24"
    availability_zone = "ap-south-1a"
    vpc_id            = "aws_vpc.main.id"
    tags = {
      Name    = "web-1"
      Env     = "project"
      Project = "learning"
    }
    }, {
    cidr_block        = "10.0.1.0/24"
    availability_zone = "ap-south-1b"
    vpc_id            = "aws_vpc.main.id"
    tags = {
      Name    = "web-2"
      Env     = "project"
      Project = "learning"
    }
    }, {
    cidr_block        = "10.0.2.0/24"
    availability_zone = "ap-south-1a"
    vpc_id            = "aws_vpc.main.id"
    tags = {
      Name    = "db-1"
      Env     = "project"
      Project = "learning"
    }
    }, {
    cidr_block        = "10.0.4.0/24"
    availability_zone = "ap-south-1b"
    vpc_id            = "aws_vpc.main.id"
    tags = {
      Name    = "db-21"
      Env     = "project"
      Project = "learning"
    }
  }]
}



