# Astroによるブログ構築

## 1. はじめに・問題の把握
Astroを使ってブログを作成する。

## 2. 仮説立て・手法調査
まずAstroのブログ作成チュートリアルをやってみる。  
その後シンプルなトップページのみのサイトを作成し、デプロイする。  
サイトが独自ドメインで公開出来たら、その後記事を書いていく。  

## 3. 手法の具体化・スケジュール立て
### 3-1. Astroのブログ作成チュートリアルをやってみる
やるだけ。

### 3-2. シンプルなトップページのみのサイトを作成し、デプロイする
- npmでAstroプロジェクト作成
- ローカルでサイトを起動・修正
- GitHubにpush
- Cloudflareにデプロイ

## 4. 実行・結果確認
### 4-2. シンプルなトップページのみのサイトを作成し、デプロイする
#### npmでAstroプロジェクト作成
完全に素のプロジェクトか、Starter KitのBlogを使うか。  
[astro/examples/blog at main · withastro/astro](https://github.com/withastro/astro/tree/main/examples/blog)

Starter KitのBlogを使ってみる。  
-> 結構複雑なので、素のプロジェクトからやることにした。

#### ローカルでサイトを起動・修正
ひとまず自己紹介とSNSへのリンクを簡単に作成。  

#### GitHubにpush
やるだけ。  

#### Cloudflareにデプロイ
初めてなので、CLI(Wranglerなど)でなくダッシュボードから操作してデプロイする。  

[Deploy your Astro Site to Cloudflare Pages | Docs](https://docs.astro.build/ja/guides/deploy/cloudflare/)  
これを見て手順通りに進める。  
デプロイ完了後、カスタムドメインを設定する。  