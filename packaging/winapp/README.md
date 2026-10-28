# winapp CLI

Download binary from GitHub Release, and extract zip.

```sh
winapp --version
```

```text
0.7.1
```

## Packaging & Signing

Create manifest file for application.

```sh
winapp.exe manifest generate --package-name helloworld --entrypoint helloworld.bat --template Packaged
```

```text
✅ Manifest generated successfully in: G:\samples-tool\packaging\winapp\samples\helloworld
```

Create development certificate for signing.

```sh
winapp.exe cert generate --output ..\dev.pfx
```

```text
✅ Development certificate generated successfully.
  ℹ  Generating development certificate...
  ℹ  Certificate publisher inferred from: G:\samples-tool\packaging\winapp\samples\helloworld\Package.appxmanifest
  ℹ  Certificate publisher: CN=9506hqwy
  ✅ Development certificate generated → ..\dev.pfx
  ⚠  Protected with the default password ('password'), which is public. Treat this certificate as development-only: anyone who obtains the .pfx can sign as you. Pass --password to choose your own, and use a CA-issued certificate or Azure Trusted Signing to ship.
  📝 Use 'winapp cert install' to install the certificate for development
```

Update assets.

```sh
winapp.exe manifest update-assets ..\logo.svg
```

```text
✅ Successfully updated assets for manifest.
```

Create MSIX packages.

```sh
winapp.exe pack . --cert ..\dev.pfx
```

```text
✅ MSIX package creation completed.
  ✅ Windows SDK Build Tools installed successfully.
  📦 Package: G:\samples-tool\packaging\winapp\samples\helloworld\helloworld_1.0.0.0.msix
  🔒 Package has been signed
```

In test, install *dev.pfx* to trusted people certificate store in local machine.

```sh
Import-PfxCertificate -FilePath dev.pfx -CertStoreLocation Cert:\LocalMachine\TrustedPeople -Password (ConvertTo-SecureString 'password' -AsPlainText -Force)
```

```text
   PSParentPath: Microsoft.PowerShell.Security\Certificate::LocalMachine\TrustedPeople

Thumbprint                                Subject
----------                                -------
E4C2934B1DFAD81801688C3C98F3EFFA373AB944  CN=9506hqwy
```

Install MSIX package.

```sh
Add-AppxPackage .\helloworld_1.0.0.0.msix
```

Get application.

```sh
Get-AppxPackage helloworld
```

```text
Name              : helloworld
Publisher         : CN=9506hqwy
Architecture      : Neutral
ResourceId        :
Version           : 1.0.0.0
PackageFullName   : helloworld_1.0.0.0_neutral__4z6kkfyxw7mxg
InstallLocation   : C:\Program Files\WindowsApps\helloworld_1.0.0.0_neutral__4z6kkfyxw7mxg
IsFramework       : False
PackageFamilyName : helloworld_4z6kkfyxw7mxg
PublisherId       : 4z6kkfyxw7mxg
IsResourcePackage : False
IsBundle          : False
IsDevelopmentMode : False
NonRemovable      : False
IsPartiallyStaged : False
SignatureKind     : Developer
Status            : Ok
Capabilities      : runFullTrust,
                    cellularData,
                    internetClient,
                    wifiData,
                    uniqueAppPackageCapability
```

## References

- [Windows App Development CLI (winapp CLI)](https://learn.microsoft.com/en-us/windows/apps/dev-tools/winapp-cli/)
- [winappCli](https://github.com/microsoft/winappcli)
- [App package manifest schema elements](https://learn.microsoft.com/en-us/uwp/schemas/appxpackage/uapmanifestschema/schema-elements)
