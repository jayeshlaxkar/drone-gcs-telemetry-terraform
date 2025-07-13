# # PROMETHEUS CONFIG FILE
# data "template_file" "prometheus_config" {
#   template = <<EOF
# global:
#   scrape_interval: 15s

# scrape_configs:
#   - job_name: 'telemetry-service'
#     static_configs:
#       - targets: ['localhost:3001']
# EOF
# }

# resource "local_file" "prometheus_yml" {
#   content  = data.template_file.prometheus_config.rendered
#   filename = "./prometheus.yml"
# }
