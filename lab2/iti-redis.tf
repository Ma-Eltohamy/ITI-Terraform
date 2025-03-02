resource "aws_elasticache_subnet_group" "redis_subnet_group" {
  name       = "redis_subnet_group"
  subnet_ids = [aws_subnet.iti-subnet["ITI-Private-SN-1A"].id]
}

resource "aws_elasticache_cluster" "redis" {
  cluster_id           = "my-redis-cluster"
  engine              = "redis"
  node_type           = "cache.t3.micro"
  num_cache_nodes     = 1
  subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
}
