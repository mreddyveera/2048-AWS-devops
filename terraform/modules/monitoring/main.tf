# 1. aws_sns_topic
# 2. aws_sns_topic_subscription
# 3. aws_cloudwatch_metric_alarm (CPU)
# 4. aws_cloudwatch_metric_alarm (Memory)
# 5. aws_cloudwatch_metric_alarm (ALB 5XX)
# 6. aws_cloudwatch_metric_alarm (Healthy Hosts)
# 7. aws_cloudwatch_metric_alarm (Target Response Time)

resource "aws_sns_topic" "monitoring" {

  name = "${var.project_name}-alerts"

  tags = merge(
    var.common_tags,
    {
      name = "${var.project_name}-alerts"
  })
}

resource "aws_sns_topic_subscription" "email" {

  topic_arn = aws_sns_topic.monitoring.arn

  protocol = "email"

  endpoint = var.alert_email
}

resource "aws_cloudwatch_metric_alarm" "ecs_cpu_high" {

  alarm_name        = "${var.project_name}-cpu-high"
  alarm_description = "Alarm when ECS CPU exceeds 70%"

  namespace   = "AWS/ECS"
  metric_name = "CPUUtilization"

  statistic = "Average"

  period             = 300
  evaluation_periods = 2

  threshold = 70

  comparison_operator = "GreaterThanThreshold"

  treat_missing_data = "notBreaching"

  alarm_actions = [
    aws_sns_topic.monitoring.arn
  ]

  dimensions = {
    ClusterName = var.ecs_cluster_name
    ServiceName = var.ecs_service_name
  }

  tags = merge(
    { name = "${var.project_name}-cpu-high" },
    var.common_tags
  )
}

resource "aws_cloudwatch_metric_alarm" "ecs_memory_high" {

  alarm_name        = "${var.project_name}-memory-high"
  alarm_description = "Alarm when ECS memory exceeds 70%"

  namespace   = "AWS/ECS"
  metric_name = "MemoryUtilization"


  statistic = "Average"

  period             = 300
  evaluation_periods = 2

  threshold = 80


  comparison_operator = "GreaterThanThreshold"

  treat_missing_data = "notBreaching"

  alarm_actions = [
    aws_sns_topic.monitoring.arn
  ]

  dimensions = {
    ClusterName = var.ecs_cluster_name
    ServiceName = var.ecs_service_name
  }

  tags = merge(
    { name = "${var.project_name}-memory-high" },
    var.common_tags
  )
}

resource "aws_cloudwatch_metric_alarm" "alb_5xx" {

  alarm_name = "${var.project_name}-alb-5xx"

  namespace = "AWS/ApplicationELB"

  metric_name = "HTTPCode_Target_5XX_Count"

  statistic = "Sum"

  period = 300

  evaluation_periods = 1

  threshold = 5

  comparison_operator = "GreaterThanThreshold"

  alarm_actions = [
    aws_sns_topic.monitoring.arn
  ]

  dimensions = {
    LoadBalancer = var.aws_lb_arn_suffix
  }

  tags = var.common_tags
}

resource "aws_cloudwatch_metric_alarm" "healthy_hosts" {

  alarm_name = "${var.project_name}-healthy-hosts"

  namespace = "AWS/ApplicationELB"

  metric_name = "HealthyHostCount"

  statistic = "Minimum"

  period = 300

  evaluation_periods = 1

  threshold = 2

  comparison_operator = "LessThanThreshold"

  alarm_actions = [
    aws_sns_topic.monitoring.arn
  ]

  dimensions = {
    TargetGroup  = var.aws_target_group_arn_suffix
    LoadBalancer = var.aws_lb_arn_suffix
  }

  tags = var.common_tags
}

resource "aws_cloudwatch_metric_alarm" "response_time" {

  alarm_name = "${var.project_name}-response-time"

  namespace = "AWS/ApplicationELB"

  metric_name = "TargetResponseTime"

  statistic = "Average"

  period = 300

  evaluation_periods = 2

  threshold = 2

  comparison_operator = "GreaterThanThreshold"

  alarm_actions = [
    aws_sns_topic.monitoring.arn
  ]

  dimensions = {
    LoadBalancer = var.aws_lb_arn_suffix
  }

  tags = var.common_tags
}