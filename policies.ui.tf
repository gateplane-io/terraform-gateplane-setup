# Copyright (C) 2025 Ioannis Torakis <john.torakis@gmail.com>
# SPDX-License-Identifier: Elastic-2.0
#
# Licensed under the Elastic License 2.0.
# You may obtain a copy of the license at:
# https://www.elastic.co/licensing/elastic-license
#
# Use, modification, and redistribution permitted under the terms of the license,
# except for providing this software as a commercial service or product.

resource "vault_policy" "ui" {
  count = var.create_ui_policy ? 1 : 0

  name   = "gateplane-ui"
  policy = local.ui_policies
}

locals {
  /*
    These policies are optionally appended to allow
    API calls that are needed by the GatePlane WebUI
  */
  ui_policies = <<EOF
// Allow reading what
// Secrets Engines and Auth Methods
// are mounted (to find out GatePlane instances)
path "sys/auth" {
  capabilities = ["read", "list"]
}

path "sys/mounts" {
  capabilities = ["read"]
}

// Allow reading Policies
// to analyze access of Policy Gate
path "sys/policy/*" {
  capabilities = ["read"]
}

// Allow finding out the level of access
// for each Gate
path "sys/capabilities-self" {
  capabilities = ["update"]
}

path "auth/token/lookup-self" {
  capabilities = ["read"]
}

// Allow extracting information of
// other users
path "identity/entity/id/*" {
  capabilities = ["read"]
}

// Used to automatically sign you in with Vault OIDC
// for GatePlane Services Integration (Team and Enterprise)
path "auth/token/create" {
  capabilities = ["update"]
}

path "sys/wrapping/unwrap" {
  capabilities = ["update"]
}
EOF
}
