resource "aws_elasticache_subnet_group" "redis_subnet_group" {
  name = "redis-subnet-group"
  subnet_ids = [
    module.network.iti-subnet["ITI-Private-SN-1A"].id,
    module.network.iti-subnet["ITI-Private-SN-1B"].id
  ]
}

resource "aws_security_group" "redis_sg" {
  name        = "redis-security-group"
  description = "Allow Redis inbound traffic"
  vpc_id      = module.network.iti-vpc.id

  ingress {
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"] # VPC CIDR
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_elasticache_cluster" "redis" {
  cluster_id                = "my-redis-cluster"
  engine                    = "redis"
  node_type                 = "cache.t3.micro"
  num_cache_nodes           = 1
  subnet_group_name         = aws_elasticache_subnet_group.redis_subnet_group.name
  security_group_ids        = [aws_security_group.redis_sg.id]
  final_snapshot_identifier = "my-redis-final-snapshot"
}

