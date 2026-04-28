locals {
  # support the expressions
  final_name = "${var.component}-${var.env}-${var.project_name}"
  # support functions
  final = merge(
    var.common_tags,
    var.variable_tags, {
      Name = "AWS"
    }
  )
}