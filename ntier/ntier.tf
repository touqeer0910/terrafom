resource "aws_vpc" "ntier" {
  cidr_block           = var.vpc_info.cidr_block
  tags                 = var.vpc_info.tags
  enable_dns_hostnames = var.vpc_info.enable_dns_hostnames
}
resource "aws_subnet" "public" {
  count      = length(var.public_subnets)
  vpc_id     = aws_vpc.ntier.id
  cidr_block = var.public_subnets[count.index].cidr_block
  tags       = var.public_subnets[count.index].tags
  availability_zone = var.public_subnets[count.index].az


}