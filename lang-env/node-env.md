# WindowsでのNode.js開発環境構築手順

# 1. はじめに・問題の把握
Remixを利用して個人サイトを作成するため、Node.jsの開発環境を構築する。

# 2. 仮説立て・手法調査
C++の時と同様に、Microsoftの公式ドキュメント[Windows で開発環境を設定する | Microsoft Learn](https://learn.microsoft.com/ja-jp/windows/dev-environment/)を参考にするのがよさそう。  

Node.jsに関するドキュメントのトップページ: [Windows での NodeJS | Microsoft Learn](https://learn.microsoft.com/ja-jp/windows/dev-environment/javascript/nodejs-overview)

# 3. 手法の具体化・スケジュール立て
手法の具体化は、ドキュメントの手順通りに進める。  

- [x] WSL2でのNode.jsインストール
    - [x] GitHubに接続できるようにGit Credential Managerの設定
    - [x] WSLとWindowsでのsshキーの共有
    - [x] Node.jsのインストール

# 4. 実行・結果確認
## 4-1. Git Credential Managerの設定
> ❗ **注意: **  この設定はsshを使わない方法なので、検証したが採用しないこととした。

Gitに同梱されているのですでにインストール済み。  
[git-credential-manager/docs/install.md at release · git-ecosystem/git-credential-manager](https://github.com/git-ecosystem/git-credential-manager/blob/release/docs/install.md)

[WSL で Git の使用を開始する | Microsoft Learn](https://learn.microsoft.com/ja-jp/windows/wsl/tutorials/wsl-git)

```powershell
# wincredを利用するように設定
git config --global credential.helper wincred
```

```bash
# gitバージョンが < v2.36.1
git config --global credential.helper "/mnt/c/Program\ Files/Git/mingw64/bin/git-credential-manager-core.exe"
```

インストール先のWSL Ubuntuのバージョンは以下の通り。

```
$ cat /etc/os-release
PRETTY_NAME="Ubuntu 22.04.3 LTS"
NAME="Ubuntu"
VERSION_ID="22.04"
VERSION="22.04.3 LTS (Jammy Jellyfish)"
VERSION_CODENAME=jammy
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
UBUNTU_CODENAME=jammy

$ git --version
git version 2.34.1
```

## 4-2. WSLとWindowsでのsshキーの共有設定
Windowsのホームディレクトリにある.sshディレクトリをWSLのホームディレクトリにコピーする。  
秘密鍵のパーミッションを600に変更する。  
問題なくGithubに接続できることを確認できた。  

[Sharing SSH keys between Windows and WSL 2 - Windows Command Line](https://devblogs.microsoft.com/commandline/sharing-ssh-keys-between-windows-and-wsl-2/)

```bash
$ cp -r /mnt/c/Users/<username>/.ssh ~/.ssh

# パーミッションを変更
$ chmod 600 ~/.ssh/id_rsa

$ ssh -T git@github.com
Hi miyamoy! You've successfully authenticated, but GitHub does not provide shell access.
```

## 4-3. Node.jsのインストール
[WSL 2 上で Node.jis を設定する | Microsoft Learn](https://learn.microsoft.com/ja-jp/windows/dev-environment/javascript/nodejs-on-wsl)を参考に進める。  
ドキュメントではnvmによるインストールを紹介しているが、ここではasdfを利用する。  

asdfのプラグインをインストールする。

```bash
$ asdf plugin add nodejs
```

最新のLTSである20.10.0をインストールする。

```bash
$ asdf install nodejs 20.10.0
```

作業環境のバージョンを以下のように設定する。  
これにより、`.tool-versions`が作成される。  

```bash
$ asdf local nodejs 20.10.0
```