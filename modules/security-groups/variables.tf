variable "port_number" {
    description             = "Port Number of Security Group Rule"
    type                    = list(string)
}

variable "protocol_type" {
    description             = "Protocol Type of Security Group Rule"
    type                    = list(string)

}

variable "cidr_source" {
    description             = "Source Cidr Block"
    type                    = list(string)
}


variable "allow_internet_access" {
  type = bool
  default = false  
}
