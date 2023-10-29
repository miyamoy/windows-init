# Windows-init
Windowsマシンの初期設定に関するリポジトリ

## 初期設定の流れ
### ソフトウェアのインストール
#### 手動でやること
- アプリインストーラーのバージョンアップ
    - これで `winget` が使えるようになる
    - [winget ツールを使用したアプリケーションのインストールと管理 | Microsoft Learn](https://learn.microsoft.com/ja-jp/windows/package-manager/winget/)

#### スクリプトでやること
- `winget` でアプリをインストール
- スクリプト実行時は管理者での実行を推奨
    - 成功したように見えて、権限が必要なインストールがうまくいってなかったりする
- 実行ポリシーの設定が必要
- 追加する場合は都度スクリプトに追加して再度実行する

```powershell
> Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process

実行ポリシーの変更
実行ポリシーは、信頼されていないスクリプトからの保護に役立ちます。実行ポリシーを変更すると、about_Execution_Policies
のヘルプ トピック (https://go.microsoft.com/fwlink/?LinkID=135170)
で説明されているセキュリティ上の危険にさらされる可能性があります。実行ポリシーを変更しますか?
[Y] はい(Y)  [A] すべて続行(A)  [N] いいえ(N)  [L] すべて無視(L)  [S] 中断(S)  [?] ヘルプ (既定値は "N"): Y

> .\install.ps1
```

### WSL2のインストール
- 管理者でなくとも、自動的に管理者で実行される。
- [WSL のインストール | Microsoft Learn](https://learn.microsoft.com/ja-jp/windows/wsl/install)

```powershell
> wsl --install

インストール中: Linux 用 Windows サブシステム
Linux 用 Windows サブシステム  はインストールされました。
インストール中: Ubuntu
Ubuntu はインストールされました。
要求された操作は正常に終了しました。変更を有効にするには、システムを再起動する必要があります。
```

再起動後、Ubuntuを起動すると初期設定が始まるので、ユーザー名とパスワードを設定する。

```bash
Ubuntu は既にインストールされています。
Ubuntu を起動しています...
Installing, this may take a few minutes...
Please create a default UNIX user account. The username does not need to match your Windows username.
For more information visit: https://aka.ms/wslusers
Enter new UNIX username: miyamo
New password:
Retype new password:
passwd: password updated successfully
Installation successful!
To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.

Welcome to Ubuntu 22.04.2 LTS (GNU/Linux 5.15.90.1-microsoft-standard-WSL2 x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage


This message is shown once a day. To disable it please create the
/home/miyamo/.hushlogin file.
miyamo@x1-carbon:~$
```
- Windows ハイパーバイザプラットフォームを有効化してないのに動いている
- hyper-vの設定しなくても、Rancher Desktop動いた。  
- Windowsの機能で追加で有効化は特にしていない。  
- WSL2でなくHyper-Vを使ったほうが軽いという話もあるので、しばらく様子見する
- [WSL2 のインストール，WSL2 上への Ubuntu のインストールと利用（Windows 11 対応の記事）（Windows 上）](https://www.kkaneko.jp/tools/wsl/wsl2.html)
- [Hyper-Vとサードパーティー製仮想マシン環境を共存させる：Windows 10 Hyper-V入門（1/2 ページ） - ＠IT](https://atmarkit.itmedia.co.jp/ait/articles/2107/29/news021.html)
- [DockerをWSLからHyper-Vに切り替える｜ Kinsta®](https://kinsta.com/jp/knowledgebase/devkinsta/switch-docker-wsl-to-hyper-v/)

### Githubのssh設定
- [新しい SSH キーを生成して ssh-agent に追加する - GitHub Docs](https://docs.github.com/ja/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
    - `config` でのキー指定忘れに注意