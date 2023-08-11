variable "myvpc" {
  type = string
  default = "172.16.0.0/16"
}
variable "pubsubnet" {
  type = string
  default = "172.16.10.0/24"

}
variable "prvsubnet"{
    type = string
    default ="172.16.1.0/24"
}
variable "ami1"{
  type = string
  default = "ami-07dfed28fcf95241c"
}