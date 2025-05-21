module "mynetwork" {
    source = "./network"
    vpc_cidr_m = var.vpc_cidr
    region_m = var.region
    subnets_m = var.subnets
}