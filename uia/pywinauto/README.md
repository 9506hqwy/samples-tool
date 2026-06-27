# pywinauto

## Environments

Check package version.

```sh
python.exe -m pip list
```

```text
Package   Version
--------- -------
comtypes  1.4.16
pillow    12.2.0
pip       26.1.2
pywin32   312
pywinauto 0.6.9
six       1.17.0
uv        0.11.25
```

## Create

Show ctrl identifier using `WindowSpecification.dump_tree()`.

```python
app = Desktop(backend="uia").window(title_re="タイトルなし")
app.dump_tree()
```

Show ctrl identifier using `inspect.exe`.

```sh
C:\Program Files (x86)\Windows Kits\10\bin\10.0.26100.0\x64\inspect.exe
```

## Run

Run application.

```sh
uv run notepad.py
```

## References

- [pywinauto](https://github.com/pywinauto/pywinauto)
- [pywinauto](https://pywinauto.readthedocs.io/en/latest/contents.html)
