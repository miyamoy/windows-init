# WSL2へのasdfのインストール
[Getting Started | asdf](https://asdf-vm.com/guide/getting-started.html)を参考にインストールする。  

## Download asdf
```bash
$ git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.13.1
```

## Install asdf
WSL2のUbuntuはBash & Gitなので`~/.bashrc`に以下を追記する。  

```bash
. "$HOME/.asdf/asdf.sh"
. "$HOME/.asdf/completions/asdf.bash"
```

```bash
$ asdf --version
v0.13.1-0586b37
```

## install yarn
[twuni/asdf-yarn: asdf plugin for Yarn.](https://github.com/twuni/asdf-yarn)

```
$ asdf plugin add yarn

# Unable to download yarn v1.22.20 or v1.22.21 · Issue #33 · twuni/asdf-yarn
# https://github.com/twuni/asdf-yarn/issues/33
asdf install yarn 1.22.19
```