# Copyright (C) 2025 Ioannis Torakis <john.torakis@gmail.com>
# SPDX-License-Identifier: Elastic-2.0
#
# Licensed under the Elastic License 2.0.
# You may obtain a copy of the license at:
# https://www.elastic.co/licensing/elastic-license
#
# Use, modification, and redistribution permitted under the terms of the license,
# except for providing this software as a commercial service or product.

output "enabled_plugins" {
  description = "The GatePlane Plugins registered in the Vault/OpenBao instance."
  value = compact([
    var.mock_plugin.filename != null ? "mock" : "",
    var.policy_gate_plugin.filename != null ? "policy-gate" : "",
  ])
}
