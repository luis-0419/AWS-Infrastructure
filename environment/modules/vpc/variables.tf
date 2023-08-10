variable "vpc_name"{
  type = string
}

variable "subnets" {
  type = list(object({
    name       = string
    cidr_block = list(string)
  }))
}