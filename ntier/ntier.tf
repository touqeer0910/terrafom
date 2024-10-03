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
  tags = {
    Name = "aws_igw"
  }

}
resource "aws_route_table" "public" {
  count  = length(var.public_subnets) > 0 ? 1 : 0
  vpc_id = aws_vpc.ntier.id
  tags = {
    Name = "public-route-table"
  }

}
resource "aws_route" "public_route" {
  count                  = length(var.public_subnets) > 0 ? 1 : 0
  route_table_id         = aws_route_table.public[0].id
  destination_cidr_block = "0.0.0.0/16"
  gateway_id             = aws_internet_gateway.igw[0].id

}
resource "aws_route_table" "private" {
  count  = length(var.private_subnets) > 0 ? 1 : 0
  vpc_id = aws_vpc.ntier.id
  tags = {
    Name = "private-route-table"
  }

}
resource "aws_route_table_association" "public_aso" {
  count          = length(var.public_subnets)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public[0].id

}
resource "aws_route_table_association" "private_aso" {
  count          = length(var.private_subnets)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private[0].id
}
