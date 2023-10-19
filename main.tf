provider "aws" {
  region = "us-west-1"
}

resource "aws_ecs_cluster" "my_cluster" {
  name = "my-cluster"
}

resource "aws_ecs_task_definition" "my_task" {
  family                = "my-task"
  network_mode          = "bridge"
  requires_compatibilities = ["EC2"]
  cpu                   = "256"
  memory                = "512"
  container_definitions = file("task-definition.json")
}

resource "aws_ecs_service" "my_service" {
  name            = "my-service"
  cluster         = aws_ecs_cluster.my_cluster.id
  task_definition = aws_ecs_task_definition.my_task.arn
  desired_count   = 1
  launch_type     = "EC2"
}

