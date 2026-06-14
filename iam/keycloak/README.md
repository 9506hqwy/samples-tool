# Keycloak

## Start

Start keycloak service.

```sh
podman run \
    -d \
    --name keycloak \
    -p 8080:8080 \
    -e KC_BOOTSTRAP_ADMIN_USERNAME=admin \
    -e KC_BOOTSTRAP_ADMIN_PASSWORD=admin \
    keycloak/keycloak \
        start-dev
```

Use Admin CLI.

```sh
export PATH="/opt/keycloak/bin:$PATH"
kcadm.sh config credentials \
    --server http://localhost:8080 \
    --realm master \
    --user admin \
    --password admin
```

```text
Logging into http://localhost:8080 as user admin of realm master
```

### Realm

Create realm.

```sh
kcadm.sh create realms -s realm=home -s enabled=true
```

```text
Created new realm with id 'home'
```

Confirm realm.

```sh
kcadm.sh get realms/home --fields id,realm,enabled
```

```json
{
  "id" : "d8784c6f-acc9-47b8-af9e-deb22671dc85",
  "realm" : "home",
  "enabled" : true
}
```

### Client

Create client for SAML
([POST /admin/realms/{realm}/clients](https://www.keycloak.org/docs-api/latest/rest-api/index.html#_post_adminrealmsrealmclients)).

`clientId` must match to issuer URI.
`redirectUris` is SP acs URL.

```sh
kcadm.sh create clients -r home -f - <<EOF
{
    "clientId": "http://app01/saml",
    "name": "App 01",
    "enabled": true,
    "protocol": "saml",
    "redirectUris": [
        "http://app01/saml/acs"
    ],
    "attributes": {
        "saml.client.signature": "false",
        "saml_single_logout_service_url_post": "http://app01/saml/slo"
    },
    "protocolMappers" : [
        {
            "name" : "X500 givenName",
            "protocol" : "saml",
            "protocolMapper" : "saml-user-property-mapper",
            "config" : {
                "attribute.nameformat" : "urn:oasis:names:tc:SAML:2.0:attrname-format:uri",
                "user.attribute" : "firstName",
                "friendly.name" : "givenName",
                "attribute.name" : "urn:oid:2.5.4.42"
             }
        },
        {
            "name" : "X500 email",
            "protocol" : "saml",
            "protocolMapper" : "saml-user-property-mapper",
            "config" : {
                "attribute.nameformat" : "urn:oasis:names:tc:SAML:2.0:attrname-format:uri",
                "user.attribute" : "email",
                "friendly.name" : "email",
                "attribute.name" : "urn:oid:1.2.840.113549.1.9.1"
            }
        },
        {
            "name" : "X500 surname",
            "protocol" : "saml",
            "protocolMapper" : "saml-user-property-mapper",
            "config" : {
                "attribute.nameformat" : "urn:oasis:names:tc:SAML:2.0:attrname-format:uri",
                "user.attribute" : "lastName",
                "friendly.name" : "surname",
                "attribute.name" : "urn:oid:2.5.4.4"
            }
        },
        {
            "name" : "id",
            "protocol" : "saml",
            "protocolMapper" : "saml-user-attribute-nameid-mapper",
            "config" : {
                "mapper.nameid.format" : "urn:oasis:names:tc:SAML:2.0:nameid-format:persistent",
                "user.attribute" : "username"
            }
        }
    ]
}
EOF
```

```text
Created new client with id 'c1a2968a-51bd-48f4-88c8-e0483e9cd9be'
```

Confirm client.

```sh
kcadm.sh get -r home clients/c1a2968a-51bd-48f4-88c8-e0483e9cd9be --fields name,enabled
```

```json
{
  "name" : "App 01",
  "enabled" : true
}
```

### User Federation

Create LDAP provider
([POST /admin/realms/{realm}/components](https://www.keycloak.org/docs-api/latest/rest-api/index.html#_post_adminrealmsrealmcomponents)).

```sh
kcadm.sh create components -r home -f - <<EOF
{
    "name": "LDAP 01",
    "providerId": "ldap",
    "providerType": "org.keycloak.storage.UserStorageProvider",
    "config": {
        "vendor": ["other"],
        "connectionUrl": ["ldap://192.168.0.34:389"],
        "authType": ["simple"],
        "bindDn": ["cn=admin,dc=home,dc=local"],
        "bindCredential": ["ldapadmin"],
        "editMode": ["READ_ONLY"],
        "usersDn": ["ou=People,dc=home,dc=local"],
        "usernameLDAPAttribute": ["uid"],
        "rdnLDAPAttribute": ["uid"],
        "uuidLDAPAttribute": ["entryUUID"],
        "userObjectClasses": ["inetOrgPerson, organizationalPerson, person"],
        "importEnabled": ["false"],
        "fullSyncPeriod": ["-1"],
        "changedSyncPeriod": ["-1"]
    }
}
EOF
```

```text
Created new component with id 'nvaYusWjSAWiGM5_xnzw0g'
```

Confirm LDAP provider.

```sh
kcadm.sh get -r home components/nvaYusWjSAWiGM5_xnzw0g
```

```json
{
  "id" : "nvaYusWjSAWiGM5_xnzw0g",
  "name" : "LDAP 01",
  "providerId" : "ldap",
  "providerType" : "org.keycloak.storage.UserStorageProvider",
  "parentId" : "d8784c6f-acc9-47b8-af9e-deb22671dc85",
  "config" : {
    "krbPrincipalAttribute" : [ "krb5PrincipalName" ],
    "fullSyncPeriod" : [ "-1" ],
    "usersDn" : [ "ou=People,dc=home,dc=local" ],
    "importEnabled" : [ "false" ],
    "userObjectClasses" : [ "inetOrgPerson, organizationalPerson, person" ],
    "bindCredential" : [ "**********" ],
    "bindDn" : [ "cn=admin,dc=home,dc=local" ],
    "changedSyncPeriod" : [ "-1" ],
    "usernameLDAPAttribute" : [ "uid" ],
    "rdnLDAPAttribute" : [ "uid" ],
    "vendor" : [ "other" ],
    "editMode" : [ "READ_ONLY" ],
    "uuidLDAPAttribute" : [ "entryUUID" ],
    "connectionUrl" : [ "ldap://192.168.0.34:389" ],
    "authType" : [ "simple" ]
  }
}
```

Confirm users from LDAP.

```sh
kcadm.sh get -r home users
```

```json
[ {
  "id" : "f:nvaYusWjSAWiGM5_xnzw0g:user01",
  "username" : "user01",
  "firstName" : "user01",
  "lastName" : "user01",
  "email" : "user01@home.local",
  "emailVerified" : false,
  "attributes" : {
    "LDAP_ENTRY_DN" : [ "uid=user01,ou=People,dc=home,dc=local" ],
    "createTimestamp" : [ "20260614003030Z" ],
    "modifyTimestamp" : [ "20260614003030Z" ],
    "LDAP_ID" : [ "fe234e8e-fbd3-1040-8c61-4590f4c196f2" ]
  },
  "enabled" : true,
  "origin" : "nvaYusWjSAWiGM5_xnzw0g",
  "createdTimestamp" : 1781415667115,
  "totp" : false,
  "federationLink" : "nvaYusWjSAWiGM5_xnzw0g",
  "disableableCredentialTypes" : [ ],
  "requiredActions" : [ ],
  "notBefore" : 0,
  "access" : {
    "manage" : true
  }
} ]
```

## Sample

Confirm certificate fingerprint.

```sh
openssl x509 \
    -in <(echo -e "-----BEGIN CERTIFICATE-----\n$(curl -sS http://192.168.0.34:8080/realms/home/protocol/openid-connect/certs | jq -r '.keys[] | select(.alg == "RS256") | .x5c | first')\n-----END CERTIFICATE-----") \
    -noout \
    -fingerprint
```

```text
SHA1 Fingerprint=C4:18:DB:8C:3C:0F:0A:C5:C4:53:E2:BC:5C:6A:94:BC:57:53:DE:39
```

Test with [redmine_omniauth_saml](https://github.com/yoshiokaCB/redmine_omniauth_saml).

```ruby
# config/initializers/saml.rb
require Rails.root.join('plugins/redmine_omniauth_saml/lib/redmine_omniauth_saml')

RedmineOmniauthSaml::Base.configure do |config|
  config.saml = {
    :issuer                         => "http://192.168.0.34:3000/saml/metadata",

    :assertion_consumer_service_url => "http://192.168.0.34:3000/auth/saml/callback",

    :single_logout_service_url      => "http://192.168.0.34:3000/auth/saml/sls",
    :signout_url                    => "http://192.168.0.34.3000/auth/saml/sls",

    :idp_sso_target_url             => "http://192.168.0.34:8080/realms/home/protocol/saml",
    :idp_slo_target_url             => "http://192.168.0.34:8080/realms/home/protocol/saml",
    :idp_cert_fingerprint           => "C4:18:DB:8C:3C:0F:0A:C5:C4:53:E2:BC:5C:6A:94:BC:57:53:DE:39",

    :name_identifier_format         => "urn:oasis:names:tc:SAML:2.0:nameid-format:persistent",
    :name_identifier_value          => "mail",
    :attribute_mapping              => {
      :login      => 'extra raw_info urn:oid:1.2.840.113549.1.9.1',
      :mail       => 'extra raw_info urn:oid:1.2.840.113549.1.9.1',
      :firstname  => 'extra raw_info urn:oid:2.5.4.42',
      :lastname   => 'extra raw_info urn:oid:2.5.4.4',
    }
  }

  config.on_login do |omniauth_hash, user|
  end
end
```

Enable follow plugin configuration.

- **Enable SAML authentication**
- **Create users automatically?**

Modify SAML client in Keycloak.

- Settings
  - Client ID: http://192.168.0.34:3000/saml/metadata
  - Valid redirect URIs: http://192.168.0.34:3000/auth/saml/callback
- Advanced
  - Logout Service POST Binding URL: http://192.168.0.34.3000/auth/saml/sls

Notes:

- Logout does not work.
  - Does not work `Authentication Redirect`.
  - The session was dropped in keycloak, but reamins in redmine.

## References

- [Keycloak](https://www.keycloak.org/)
- [Server Administration Guide](https://www.keycloak.org/docs/latest/server_admin/index.html)
