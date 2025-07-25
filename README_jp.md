# 📁 ダウンロード整理スクリプト

このスクリプトは、`~/Downloads` フォルダ内のファイルを自動的に年月（例：`2025_04`）ごとのフォルダに分類し、**同名ファイルがあった場合でも上書きせずにリネームして保存**します。

---

## ✨ 主な機能

- ✅ ダウンロードファイルを `YYYY_MM` フォルダに自動振り分け
- ✅ 同名ファイルは自動でリネーム（例：`file_1.txt`）
- ✅ 拡張子なしのファイルにも対応
- ✅ 依存関係なしのシンプルな Bash スクリプト

---

## 🖥️ 実行前後のイメージ

**実行前：**

```
~/Downloads/
├── photo.jpg
├── resume.pdf
├── photo.jpg  ← 重複
```

**実行後：**

```
~/Downloads/
└── 2025_04/
    ├── photo.jpg
    ├── resume.pdf
    └── photo_1.jpg
```

---

## 🔧 使い方（手動）

1. このリポジトリをダウンロードまたはクローン
2. ターミナルで以下を実行：

```bash
bash organize_downloads.sh
```

> 💡 フォルダの場所を変更したい場合は、スクリプト内の `DOWNLOAD_DIR` を変更してください。

---

## 🤖 Automator（オートメーター）で自動化する方法（macOS）

### 1. スクリプトを保存

スクリプトを以下のように保存します：

```
~/Library/Scripts/organize_downloads.sh
```

実行権限を付与：

```bash
chmod +x ~/Library/Scripts/organize_downloads.sh
```

---

### 2. Automator アプリを作成

1. Automator を起動
2. 「新規書類」→「アプリケーション」を選択
3. 「シェルスクリプトを実行」アクションを追加
4. 以下を入力：

```bash
~/Library/Scripts/organize_downloads.sh
```

5. アプリ名を「Downloads Organizer」などにして保存（例：アプリケーションフォルダ内）

> 🚀 保存したアプリを Dock に置いたり、ログイン時に起動させることも可能です。

---

## ⏱ LaunchAgent を使って完全自動実行（オプション）

30分ごとに自動実行したい場合は以下の方法もあります：

1. 以下の内容で `~/Library/LaunchAgents/com.user.organizedownloads.plist` を作成：

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>Label</key>
  <string>com.user.organizedownloads</string>
  <key>ProgramArguments</key>
  <array>
    <string>/Users/YOUR_NAME/Library/Scripts/organize_downloads.sh</string>
  </array>
  <key>StartInterval</key>
  <integer>1800</integer>
  <key>RunAtLoad</key>
  <true/>
</dict>
</plist>
```

2. 実行するには：

```bash
launchctl load ~/Library/LaunchAgents/com.user.organizedownloads.plist
```

---

## 🧪 テスト方法（安全に確認）

実際の `Downloads` を使わずに検証したい場合：

```bash
mkdir -p ~/Downloads/test_env
cp organize_downloads.sh ~/Downloads/test_env/
cd ~/Downloads/test_env

# テスト用ファイルを作成
touch file.txt file.txt image.png

# スクリプト内の DOWNLOAD_DIR を以下に変更：
# DOWNLOAD_DIR="$HOME/Downloads/test_env"
bash organize_downloads.sh
```

---

## 📄 ライセンス

このプロジェクトは [MIT License](LICENSE) のもとで公開されています。

---

## 🙋 作者

作成者: yutsuki3 — 改善提案やプルリク歓迎！
