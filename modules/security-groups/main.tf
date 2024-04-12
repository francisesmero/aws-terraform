resource "aws_security_group" "bastion_security_group" {
    name                                = "awsdemo-bastion-sg"
    description                         = "security configuration for bastion host"
    vpc_id                              = var.vpc_id
}

resource "aws_security_group_rule" "bastion_security_group_ingress_rule" {
    type                                = "ingress"
    security_group_id                   = aws_security_group.bastion_security_group.id
    cidr_blocks                         = ["119.94.226.200/32"]
    from_port                           = 22
    to_port                             = 22
    protocol                            = "tcp"
}




