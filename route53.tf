data "aws_route53_zone" "selected" {
  name = "demo.gs."
}

data "aws_alb" "servers" {
  arn = "${module.servers.alb_arn}"
}

resource "aws_route53_record" "server" {
  zone_id = "${data.aws_route53_zone.selected.zone_id}"
  name    = "server.demo.gs"
  type    = "A"

  alias {
    name                   = "${data.aws_alb.servers.dns_name}"
    zone_id                = "${data.aws_alb.servers.zone_id}"
    evaluate_target_health = "false"
  }
}

data "aws_alb" "clients" {
  arn = "${module.clients.alb_arn}"
}

resource "aws_route53_record" "www" {
  zone_id = "${data.aws_route53_zone.selected.zone_id}"
  name    = "www.demo.gs"
  type    = "A"

  alias {
    name                   = "${data.aws_alb.clients.dns_name}"
    zone_id                = "${data.aws_alb.clients.zone_id}"
    evaluate_target_health = "false"
  }
}
