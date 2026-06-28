# Windows Application Driver

## Environments

Enable developer mode,
see
[Enable Developer Mode](https://learn.microsoft.com/en-us/windows/advanced-settings/developer-mode#enable-developer-mode).

Install Windows Application Driver.

Check package version.
Do not work,
see
[Support for Selenium 4 #1839](https://github.com/microsoft/WinAppDriver/issues/1839),
[Bad capabilities. Specify either app or appTopLevelWindow to create a session on Python #1848](https://github.com/microsoft/WinAppDriver/issues/1848).

```sh
python.exe -m pip list
```

```text
Package              Version
-------------------- -----------
Appium-Python-Client 5.3.1
attrs                26.1.0
certifi              2026.6.17
cffi                 2.0.0
h11                  0.16.0
idna                 3.18
outcome              1.3.0.post0
pip                  26.1.2
pycparser            3.0
PySocks              1.7.1
selenium             4.45.0
sniffio              1.3.1
sortedcontainers     2.4.0
trio                 0.33.0
trio-websocket       0.12.2
typing_extensions    4.15.0
urllib3              2.7.0
uv                   0.11.25
websocket-client     1.9.0
wsproto              1.3.2
```

Alternatively, use selenium 3.

```sh
python.exe -m pip list
```

```text
Package  Version
-------- -------
pip      26.1.2
selenium 3.141.0
urllib3  2.7.0
uv       0.11.25
```

## Create

Show ctrl identifier using `inspect.exe`.

```sh
C:\Program Files (x86)\Windows Kits\10\bin\10.0.26100.0\x64\inspect.exe
```

## Run

Run Windows Application Driver.

```sh
C:\Program Files\Windows Application Driver\WinAppDriver.exe
```

```text
Windows Application Driver listening for requests at: http://127.0.0.1:4723/
Press ENTER to exit.
```

Run application.

```sh
uv run notepad.py
```

## References

- [Windows Application Driver](https://github.com/microsoft/winappdriver)
- [Appium Python Client](https://github.com/appium/python-client)
- [Selenium](https://github.com/SeleniumHQ/selenium/tree/selenium-3.141.0)
