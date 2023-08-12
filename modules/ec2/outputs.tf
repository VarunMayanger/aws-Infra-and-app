output "instance_id" {
    value = aws_instance.web.id
}

output "ecr_repo_name" {
    value = aws_ecr_repository.foo.name
}