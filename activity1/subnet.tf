resource "aws_subnet" "main" {
  count             = length(var.subnets)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnets[count.index].cidr_block
  availability_zone = var.subnets[count.index].availability_zone
  tags              = var.subnets[count.index].tags
}
