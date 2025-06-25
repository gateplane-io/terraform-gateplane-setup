# Copyright (C) 2025 Ioannis Torakis <john.torakis@gmail.com>
# SPDX-License-Identifier: Elastic-2.0
#
# Licensed under the Elastic License 2.0.
# You may obtain a copy of the license at:
# https://www.elastic.co/licensing/elastic-license
#
# Use, modification, and redistribution permitted under the terms of the license,
# except for providing this software as a commercial service or product.

variable "domains" {
  description = "Domains to be allowed CORS and HTML iFrame access, by the Vault/OpenBao instance UI."
  default     = ["https://app.gateplane.io"]
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

variable "plugin_directory" {
  description = "The directory where Vault/OpenBao plugins are stored."
  default     = "/usr/local/libexec/vault/"
}
