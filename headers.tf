# Copyright (C) 2025 Ioannis Torakis <john.torakis@gmail.com>
# SPDX-License-Identifier: Elastic-2.0
#
# Licensed under the Elastic License 2.0.
# You may obtain a copy of the license at:
# https://www.elastic.co/licensing/elastic-license
#
# Use, modification, and redistribution permitted under the terms of the license,
# except for providing this software as a commercial service or product.

// Allow CORS for the UI
resource "vault_generic_endpoint" "cross_origin_requests" {
  path = "sys/config/cors"

  data_json = jsonencode({
    enabled         = true
    allowed_origins = var.domains
    allowed_headers = [
      "Content-Type",
      "X-Requested-With",
      "X-Vault-AWS-IAM-Server-ID",
      "X-Vault-MFA",
      "X-Vault-No-Request-Forwarding",
      "X-Vault-Wrap-Format",
      "X-Vault-Wrap-TTL",
      "X-Vault-Policy-Override",
      "Authorization",
      "X-Vault-Token",
    ]

    // Is probably not needed
    allowed_methods = [
      "DELETE",
      "GET",
      "OPTIONS",
      "POST",
      "PUT",
      "LIST",
      "SCAN",
    ]
  })
}

// Allow iFrame inclusion to the UI for transparent OIDC authentication
resource "vault_generic_endpoint" "content_security_policy" {
  path = "/sys/config/ui/headers/Content-Security-Policy"

  data_json = jsonencode({
    values = join("; ", [
      "frame-ancestors 'self' ${join(" ", var.domains)}",
      # "frame-ancestors 'self' *", // star works here too
      # "frame-src ${join(" ", var.domains)}"
    ])
  })
}
