#count and count.index wil not work in locals
# locals {
#     record_name = var.instance_names[count.index] == "frontend" ? var.domain_name : "${var.instance_names[count.index]}.${var.domain_name}"
#     #condition index=0,ie db=frontend is false, it takes nxt index1 ie db.csvdaws78s.online check again
#     record_value = var.instance_names[count.index] == "frontend" ? [aws_instance.expense[count.index].public_ip] : [aws_instance.expense[count.index].private_ip]
#     #if FE means it wil print pub ip,otherise it wil take private ip
# }