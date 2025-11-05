# Copyright (C) 2025 Ioannis Torakis <john.torakis@gmail.com>
# SPDX-License-Identifier: Elastic-2.0
#
# Licensed under the Elastic License 2.0.
# You may obtain a copy of the license at:
# https://www.elastic.co/licensing/elastic-license
#
# Use, modification, and redistribution permitted under the terms of the license,
# except for providing this software as a commercial service or product.

variable "url_origins" {
  description = "URLs to be allowed CORS and HTML iFrame access by the Vault/OpenBao instance."
  default     = []
}

# Mock Plugin for Testing
variable "mock_plugin" {
  description = "Filename, version and SHA256 HexDigest of the GatePlane Mock plugin (only used for testing)."
  type = object({
    filename = string
    sha256   = string
    version  = string
  })
  default = {
    filename = null
    sha256   = null
    version  = null
  }
}

variable "policy_gate_plugin" {
  description = "Filename, version and SHA256 HexDigest of the GatePlane Policy Gate plugin."
  type = object({
    filename = string
    sha256   = string
    version  = string
  })
  default = {
    filename = null
    sha256   = null
    version  = null
  }
}


variable "okta_group_gate_plugin" {
  description = "Filename, version and SHA256 HexDigest of the GatePlane Okta Group Gate plugin."
  type = object({
    filename = string
    sha256   = string
    version  = string
  })
  default = {
    filename = null
    sha256   = null
    version  = null
  }
}

variable "create_ui_policy" {
  description = "A Vault/OpenBao Policy that can be used to allow usage of the GatePlane UI ([`app.gateplane.io`](https://app.gateplane.io))"
  default     = true
}
