# Pester

## Environments

Check pwsh version.

```powershell
$PSVersionTable
```

```text
Name                           Value
----                           -----
PSVersion                      7.6.5
PSEdition                      Core
GitCommitId                    7.6.5
OS                             Debian GNU/Linux 13 (trixie)
Platform                       Unix
PSCompatibleVersions           {1.0, 2.0, 3.0, 4.0…}
PSRemotingProtocolVersion      2.4
SerializationVersion           1.1.0.1
WSManStackVersion              3.0
```

Install pester.

```powershell
Install-Module -Name Pester
```

Confirm pester version.

```powershell
Get-Module -ListAvailable Pester
```

```text
    Directory: /root/.local/share/powershell/Modules

ModuleType Version    PreRelease Name                                PSEdition ExportedCommands
---------- -------    ---------- ----                                --------- ----------------
Script     6.1.0                 Pester                              Desk      {Invoke-Pester, Describe, Context, It…}
```

## References

- [Pester](https://pester.dev/)
