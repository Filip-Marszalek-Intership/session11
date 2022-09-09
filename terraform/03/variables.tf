variable "location" {
  type    = string
  default = "uksouth"
}
variable "appServiceName" {
  type    = string
  default = "appservice246"
}
variable "pricingTier" {
  type    = string
  default = "B1"
}
variable "numOfNodes" {
  type    = number
  default = 1
}
variable "dockerImage" {
  type    = string
  default = "filip246/hello_world_nginx"
}