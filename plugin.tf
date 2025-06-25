# Copyright (C) 2025 Ioannis Torakis <john.torakis@gmail.com>
# SPDX-License-Identifier: Elastic-2.0
#
# Licensed under the Elastic License 2.0.
# You may obtain a copy of the license at:
# https://www.elastic.co/licensing/elastic-license
#
# Use, modification, and redistribution permitted under the terms of the license,
# except for providing this software as a commercial service or product.

resource "vault_plugin" "mock" {
  count = var.mock_plugin.filename != null ? 1 : 0

  type    = "auth"
  name    = "gateplane-mock"
  command = var.mock_plugin.filename
  version = var.mock_plugin.version
  sha256  = var.mock_plugin.sha256
  env = [
  ]
}

resource "vault_plugin" "policy_gate" {
  count = var.policy_gate_plugin.filename != null ? 1 : 0

  type = "auth"
  /*
    Name is used to identify the mount type by the UI
    so it must be hardcoded
  */
  name    = "gateplane-policy-gate"
  command = var.policy_gate_plugin.filename
  version = var.policy_gate_plugin.version
  sha256  = var.policy_gate_plugin.sha256
  env = [
  ]
}

resource "vault_plugin" "okta_group_gate" {
  count = var.okta_group_gate_plugin.filename != null ? 1 : 0

  type = "auth"
  /*
    Name is used to identify the mount type by the UI
    so it must be hardcoded
  */
  name    = "gateplane-okta-group-gate"
  command = var.okta_group_gate_plugin.filename
  version = var.okta_group_gate_plugin.version
  sha256  = var.okta_group_gate_plugin.sha256
  env = [
  ]
}
