resource "aws_route53_record" "expense" {

  count = length(var.instance_names) #here we r creating 3 r53 records so thats y use count
  zone_id = var.zone_id
  name = var.instance_names[count.index] == "frontend" ? var.domain_name : "${var.instance_names[count.index]}.${var.domain_name}"
  #name = local.record_name
  type    = "A" 
  ttl     = 1 
  #count and count.index wil not work in locals
  records = var.instance_names[count.index] == "frontend" ? [aws_instance.expense[count.index].public_ip] : [aws_instance.expense[count.index].private_ip]
  #records = local.record_value 
  allow_overwrite = true #if DNS records already exists in aws account means use overwrite
}