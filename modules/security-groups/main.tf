resource "aws_security_group" "bastion_security_group" {
    name                        = "bastion security group"
    description                 = "enable internet access to Bastion Host"
    vpc_id                      = var.vpc_id

    ingress {
        description             = "allow ssh access"
        from_port               = 22
        to_port                 = 22
        protocol                = "tcp"
        cidr_blocks             = ["0.0.0.0/0"]
    }

    # egress {
    #     description             = "Allow access from bastion to database"
    #     from_port               = 3306
    #     to_port                 = 3306
    #     protocol                = "tcp"
    #     cidr_blocks             = ["0.0.0.0/0"]
    # }


    # egress {
    #     description             = "Allow http access from bastion to web-server"
    #     from_port               = 80
    #     to_port                 = 80
    #     protocol                = "tcp"
    #     cidr_blocks             = ["0.0.0.0/0"]
    # }

    #   egress {
    #     description             = "Allow https access from bastion to web-server"
    #     from_port               = 443
    #     to_port                 = 443
    #     protocol                = "tcp"
    #     cidr_blocks             = ["0.0.0.0/0"]
    # }
    

    # egress {
    #     description             = "https access to web-server"
    #     from_port               = 443
    #     to_port                 = 443 
    #     protocol                = "tcp"
    #     security_groups         = [aws_security_group.bastion_security_group.id]
    # }

}

# resource "aws_security_group" "backend_security_group" {
#     ingress {
#         from_port       = var.port_number
#         to_port         = var.port_number
#         protocol        = var.protocol_type
#         cidr_blocks     = var.cidr_source
#     }

#     egress {
#         from_port       = var.port_number
#         to_port         = var.port_number
#         protocol        = var.protocol_type
#         cidr_blocks     = var.cidr_source
#     }
# }

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