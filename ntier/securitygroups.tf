resource "aws_security_group" "web" {
  name   = var.web_security_group.name
  vpc_id = aws_vpc.ntier.id
  tags = {
    Name = var.web_security_group.name
  }


}
resource "aws_vpc_security_group_ingress_rule" "web" {
  count             = length(var.web_security_group.ingress)
  security_group_id = aws_security_group.web.id
  ip_protocol       = var.web_security_group.ingress[count.index].protocol
  cidr_ipv4         = var.web_security_group.ingress[count.index].cidr_range
  from_port         = var.web_security_group.ingress[count.index].from_port
  to_port           = var.web_security_group.ingress[count.index].from_port
}
resource "aws_vpc_security_group_ingress_rule" "app" {
  count             = length(var.app_security_group.ingress)
  security_group_id = aws_security_group.web.id
  ip_protocol       = var.app_security_group.ingress[count.index].protocol
  cidr_ipv4         = var.app_security_group.ingress[count.index].cidr_range
  from_port         = var.app_security_group.ingress[count.index].from_port
  to_port           = var.app_security_group.ingress[count.index].from_port
}
resource "aws_vpc_security_group_ingress_rule" "db" {
  count             = length(var.db_security_group.ingress)
  security_group_id = aws_security_group.web.id
  ip_protocol       = var.db_security_group.ingress[count.index].protocol
  cidr_ipv4         = var.db_security_group.ingress[count.index].cidr_range
  from_port         = var.db_security_group.ingress[count.index].from_port
  to_port           = var.db_security_group.ingress[count.index].from_port
}
