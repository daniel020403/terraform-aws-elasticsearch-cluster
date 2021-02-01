output "elasticsearch_arn" {
    description = "The ARN of the Elasticsearch domain."
    value       = aws_elasticsearch_domain.elasticsearch.arn
}

output "elasticsearch_domain_id" {
    description = "The unique identifier of the Elasticsearch domain."
    value       = aws_elasticsearch_domain.elasticsearch.domain_id
}

output "elasticsearch_domain_name" {
    description = "The name of the Elasticsearch domain."
    value       = aws_elasticsearch_domain.elasticsearch.domain_name
}

output "elasticsearch_endpoint" {
    description = "The endpoint of the Elasticsearch domain."
    value       = aws_elasticsearch_domain.elasticsearch.endpoint
}

output "elasticsearch_kibana_endpoint" {
    description = "The Elasticsearch domain's endpoint for kibana."
    value       = aws_elasticsearch_domain.elasticsearch.kibana_endpoint
}