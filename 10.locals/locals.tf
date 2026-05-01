#============================================================
# 10. Locals Block
# Topic: Computed/derived values that CANNOT be done in variables
# Why: Variables DON'T support expressions like ${var.a}-${var.b}
# Locals CAN combine variables, use functions, and compute values
# Usage: local.<name> (not var.<name>)
#============================================================

locals {
  # String interpolation: combines 3 variables into one name
  # Result: "testing-dev-roboshop"
  final_name = "${var.component}-${var.env}-${var.project_name}"

  # merge() function: combines multiple maps into one
  # Result: {project="Intel", terraform=true, version="1.0.0", component="test", Name="AWS"}
  final = merge(
    var.common_tags,
    var.variable_tags, {
      Name = "AWS"
    }
  )
}