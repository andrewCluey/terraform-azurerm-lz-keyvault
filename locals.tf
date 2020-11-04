locals {
  module_tag = {
    "module" = basename(abspath(path.module))
  }
  tags = merge(var.tags, local.module_tag)
  diagnostics_settings = {
    log = [
      # ["Category name",  "Diagnostics Enabled(true/false)", "Retention Enabled(true/false)", Retention_period] 
      ["AuditEvent", true, true, 30],
    ]
    metric = [
      # ["Category name", "Diagnostics Enabled(true/false)", "Retention Enabled(true/false)", Retention_period]                 
      ["AllMetrics", true, true, 30],
    ]
  }
}