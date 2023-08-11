variable "pubsubnet" {
  type = string
  default = "172.16.10.0/24"

}
variable "prvsubnet"{
    type = string
    default ="172.16.1.0/24"
}

variable "vpc_id" {
type = string
}