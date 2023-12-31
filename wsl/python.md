# WSL2のUbuntuでPythonがないと怒られる

環境

```bash
p$ lsb_release -a
No LSB modules are available.
Distributor ID: Ubuntu
Description:    Ubuntu 22.04.2 LTS
Release:        22.04
```

怒られ
```bash
$ python
Command 'python' not found, did you mean:
  command 'python3' from deb python3
  command 'python' from deb python-is-python3
```

以下で解決

```bash
$ sudo apt install python-is-python3
```