
# Enable the AppRole auth method at path "approle"
resource "vault_auth_backend" "approle" {
  count = var.policy_gate_plugin.filename != null ? 1 : 0

  type        = "approle"
  path        = var.approle_mount
  description = "GatePlane AppRole auth method"
  tune {
    default_lease_ttl = "1h"
    max_lease_ttl     = "1h"
  }
}

resource "vault_policy" "policy_gate_policy" {
  name   = var.policy_gate_plugin.approle_policy
  policy = <<EOF
// Allow the GatePlane PolicyGate plugin
// to alter Entity Policies
path "identity/entity/id/*" {
  capabilities = ["read", "update"]
  // Only allow changing the policies of an Entity
  allowed_parameters = {
    policies = []
  }
}

// Allow authentication check
path "auth/token/lookup-self" {
  capabilities = ["read"]
}
EOF
}
