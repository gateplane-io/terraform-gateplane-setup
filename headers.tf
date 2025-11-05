# Copyright (C) 2025 Ioannis Torakis <john.torakis@gmail.com>
# SPDX-License-Identifier: Elastic-2.0
#
# Licensed under the Elastic License 2.0.
# You may obtain a copy of the license at:
# https://www.elastic.co/licensing/elastic-license
#
# Use, modification, and redistribution permitted under the terms of the license,
# except for providing this software as a commercial service or product.

# resource "vault_generic_endpoint" "cross_origin_requests_read" {
#   path = "sys/config/cors"

#   disable_read = false
#   data_json = "{}"
#   # write_fields = ["allowed_origins"]
# }

// Allow CORS for the UI
resource "vault_generic_endpoint" "cross_origin_requests" {
  count = length(var.url_origins) == 0 ? 0 : 1

  path = "sys/config/cors"

  data_json = jsonencode({
    enabled = true
    # Include the existing CORS domains - do not overwrite with var.domains
    allowed_origins = flatten([var.url_origins])
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

resource "vault_generic_endpoint" "cache_cors_headers" {
  path = "/sys/config/ui/headers/Access-Control-Max-Age"

  data_json = jsonencode({
    values = [86400]
  })
}


// Allow iFrame inclusion to the UI for transparent OIDC authentication
resource "vault_generic_endpoint" "content_security_policy" {
  path = "/sys/config/ui/headers/Content-Security-Policy"

  data_json = jsonencode({
    values = join("; ", [
      "frame-ancestors 'self' ${join(" ", var.url_origins)}",
      # "frame-ancestors 'self' *", // star works here too
      # "frame-src ${join(" ", var.domains)}"
    ])
  })
}
