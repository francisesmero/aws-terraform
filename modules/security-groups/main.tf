resource "aws_security_group" "bastion_security_group" {
    name                        = "awsdemo-bastion-sg"
    description                 = "enable internet access to Bastion Host"
    vpc_id                      = var.vpc_id
}

# resource "aws_security_group_rule" "bastion_ingress_rule" {
#     type                        = "ingress"
#     from_port                   = "22"
#     to_port                     = "22"
#     protocol_type               = "tcp"
#     cidr_blocks                 = aws_vpc.vpc.cidr_block
#     security_group_id           = aws_security_group.bastion_security_group.id

# }


