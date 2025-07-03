output "security_group_id" {
  value = aws_security_group.ecs_sg.id
}

output "alb_dns_name" {
  description = "DNS do Load Balancer"
  value       = aws_lb.ecs_alb.name
}
