resource "aws_security_group" "bastion_security_group" {
    ingress {
        from_port       = var.port_number
        to_port         = var.port_number
        protocol        = var.protocol_type
        cidr_blocks     = var.cidr_source
    }

    egress {
        from_port       = var.port_number
        to_port         = var.port_number
        protocol        = var.protocol_type
        cidr_blocks     = var.cidr_source
    }

    egress {
        from_port       = var.port_number
        to_port         = var.port_number
        protocol        = var.protocol_type
    }

}

resource "aws_security_group" "backend_security_group" {
    ingress {
        from_port       = var.port_number
        to_port         = var.port_number
        protocol        = var.protocol_type
        cidr_blocks     = var.cidr_source
    }

    egress {
        from_port       = var.port_number
        to_port         = var.port_number
        protocol        = var.protocol_type
        cidr_blocks     = var.cidr_source
    }
}

# resource "aws_security_group" "frontend_security_group" {
#     ingress:
#         internet -> frontend
#     egress:
#         frontend -> backend
# }

# resource "aws_security_group" "rds_security_group"{
#     ingress:
#         backend -> rds
#     egress:
#         rds -> backend
# }