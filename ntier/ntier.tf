#creation of vpc
resource "aws_vpc" "ntier" {
  cidr_block           = var.vpc_info.cidr_block
  tags                 = var.vpc_info.tags
  enable_dns_hostnames = var.vpc_info.enable_dns_hostnames
}
resource "aws_subnet" "public" {
  count             = length(var.public_subnets)
  vpc_id            = aws_vpc.ntier.id
  cidr_block        = var.public_subnets[count.index].cidr_block
  tags              = var.public_subnets[count.index].tags
  availability_zone = var.public_subnets[count.index].az


}
resource "aws_subnet" "private" {
  count             = length(var.private_subnets)
  vpc_id            = aws_vpc.ntier.id
  cidr_block        = var.private_subnets[count.index].cidr_block
  tags              = var.private_subnets[count.index].tags
  availability_zone = var.private_subnets[count.index].az

}
resource "aws_internet_gateway" "igw" {
  count  = length(var.public_subnets) > 0 ? 1 : 0
  vpc_id = aws_vpc.ntier.id
  tags   = var.aws_igw.tag

}