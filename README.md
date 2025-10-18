# Vault/OpenBao setup for GatePlane
![License: ElasticV2](https://img.shields.io/badge/ElasticV2-green?style=flat-square&label=license&cacheSeconds=3600&link=https%3A%2F%2Fwww.elastic.co%2Flicensing%2Felastic-license)

This Terraform module enables a Vault/OpenBao instance to use GatePlane.

* It enables [Cross-Origin Resource Sharing (CORS)](https://developer.mozilla.org/en-US/docs/Web/HTTP/Guides/CORS)
and [Content Security Policy (CSP) for IFrames](https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/frame-ancestors)
to allow browser access from [`https://app.gateplane.io`](https://app.gateplane.io) (domain can be changed).

* It can register all GatePlane plugins to the Vault/OpenBao instance, so they can be recognised by the UI.


## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_vault"></a> [vault](#provider\_vault) | n/a |

## Resources

| Name | Type |
|------|------|
| [vault_generic_endpoint.cache_cors_headers](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/generic_endpoint) | resource |
| [vault_generic_endpoint.content_security_policy](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/generic_endpoint) | resource |
| [vault_generic_endpoint.cross_origin_requests](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/generic_endpoint) | resource |
| [vault_plugin.mock](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/plugin) | resource |
| [vault_plugin.okta_group_gate](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/plugin) | resource |
| [vault_plugin.policy_gate](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/plugin) | resource |
| [vault_policy.ui](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_ui_policy"></a> [create\_ui\_policy](#input\_create\_ui\_policy) | A Vault/OpenBao Policy that can be used to allow usage of the GatePlane UI ([`app.gateplane.io`](https://app.gateplane.io)) | `bool` | `true` | no |
| <a name="input_domains"></a> [domains](#input\_domains) | Domains to be allowed CORS and HTML iFrame access, by the Vault/OpenBao instance UI. | `list` | <pre>[<br/>  "https://app.gateplane.io"<br/>]</pre> | no |
| <a name="input_mock_plugin"></a> [mock\_plugin](#input\_mock\_plugin) | Filename, version and SHA256 HexDigest of the GatePlane Mock plugin (only used for testing). | <pre>object({<br/>    filename = string<br/>    sha256   = string<br/>    version  = string<br/>  })</pre> | <pre>{<br/>  "filename": null,<br/>  "sha256": null,<br/>  "version": null<br/>}</pre> | no |
| <a name="input_okta_group_gate_plugin"></a> [okta\_group\_gate\_plugin](#input\_okta\_group\_gate\_plugin) | Filename, version and SHA256 HexDigest of the GatePlane Okta Group Gate plugin. | <pre>object({<br/>    filename = string<br/>    sha256   = string<br/>    version  = string<br/>  })</pre> | <pre>{<br/>  "filename": null,<br/>  "sha256": null,<br/>  "version": null<br/>}</pre> | no |
| <a name="input_plugin_directory"></a> [plugin\_directory](#input\_plugin\_directory) | The directory where Vault/OpenBao plugins are stored. | `string` | `"/usr/local/libexec/vault/"` | no |
| <a name="input_policy_gate_plugin"></a> [policy\_gate\_plugin](#input\_policy\_gate\_plugin) | Filename, version and SHA256 HexDigest of the GatePlane Policy Gate plugin. | <pre>object({<br/>    filename = string<br/>    sha256   = string<br/>    version  = string<br/>  })</pre> | <pre>{<br/>  "filename": null,<br/>  "sha256": null,<br/>  "version": null<br/>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_enabled_plugins"></a> [enabled\_plugins](#output\_enabled\_plugins) | The GatePlane Plugins registered in the Vault/OpenBao instance. |
| <a name="output_ui_policy"></a> [ui\_policy](#output\_ui\_policy) | The name of the Vault/OpenBao Policy used to grant access to GatePlane UI. |


## License

This project is licensed under the [Elastic License v2](https://www.elastic.co/licensing/elastic-license).

This means:

- ✅ You can use, fork, and modify it for **yourself** or **within your company**.
- ✅ You can submit pull requests and redistribute modified versions (with the license attached).
- ❌ You may **not** sell it, offer it as a paid product, or use it in a hosted service (e.g., SaaS).
- ❌ You may **not** re-license it under a different license.

In short: You can use and extend the code freely, privately or inside your business - just don’t build a business around it without our permission.
[This FAQ by Elastic](https://www.elastic.co/licensing/elastic-license/faq) greatly summarizes things.

See the [`./LICENSES/Elastic-2.0.txt`](./LICENSES/Elastic-2.0.txt) file for full details.
