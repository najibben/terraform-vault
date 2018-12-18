resource "vault_auth_backend" "approle" {
  type = "approle"
}

resource "vault_approle_auth_backend_role" "consul-template" {
  backend   = "${vault_auth_backend.approle.path}"
  role_name = "consul-template"
  policies  = ["default", "pki_int"]
}

resource "vault_approle_auth_backend_role_secret_id" "consul-template" {
  backend   = "${vault_auth_backend.approle.path}"
  role_name = "${vault_approle_auth_backend_role.consul-template.consul-template}"
}