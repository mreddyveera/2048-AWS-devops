# # =========================
# # WAF
# # =========================
# resource "aws_wafv2_web_acl" "alb_waf" {
#   name  = "2048-waf"
#   scope = "REGIONAL"

#   default_action {
#     allow {}
#   }

#   visibility_config {
#     cloudwatch_metrics_enabled = true
#     metric_name                = "2048WAF"
#     sampled_requests_enabled   = true
#   }

#   rule {
#     name     = "AWSManagedRulesCommonRuleSet"
#     priority = 1

#     override_action {
#       none {}
#     }

#     statement {
#       managed_rule_group_statement {
#         name        = "AWSManagedRulesCommonRuleSet"
#         vendor_name = "AWS"
#       }
#     }

#     visibility_config {
#       cloudwatch_metrics_enabled = true
#       metric_name                = "CommonRuleSet"
#       sampled_requests_enabled   = true
#     }
#   }
# }

# resource "aws_wafv2_web_acl_association" "alb_association" {
#   resource_arn = aws_lb.public_alb.arn
#   web_acl_arn  = aws_wafv2_web_acl.alb_waf.arn
# }