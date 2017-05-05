output "route_53_server" {
  value = "${aws_route53_record.server.name}"
}

output "route_53_www" {
  value = "${aws_route53_record.www.name}"
}

output "alb_server_dns" {
  value = "${module.servers.alb_dns}"
}

output "alb_server_arn" {
  value = "${module.servers.alb_arn}"
}

output "alb_clients_dns" {
  value = "${module.clients.alb_dns}"
}

output "alb_clients_arn" {
  value = "${module.clients.alb_arn}"
}

output "subnets" {
  value = ["${module.vpc.subnets}"]
}

output "vpc_id" {
  value = "${module.vpc.id}"
}
