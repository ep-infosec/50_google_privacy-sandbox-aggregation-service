# Copyright 2022, Google LLC.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

output "service_account_gcp_role_members" {
  value       = var.simulator_settings.enabled ? [local.service_account_gcp_role_member, module.simulator[0].service_account_gcp_role_member] : [local.service_account_gcp_role_member]
  description = "Service account role members for workload id setup"
}

output "service_ip" {
  value       = kubernetes_service.collector.status[0].load_balancer[0].ingress[0].ip
  depends_on  = [kubernetes_service.collector]
  description = "Collector kubernetes service ingress IP address"
}
