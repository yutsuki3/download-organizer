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

## 🔧 手動で使う場合

1. このリポジトリをダウンロードまたはクローン
2. ターミナルで以下を実行：

```bash
bash organize_downloads.sh
```

> 💡 フォルダの場所を変更したい場合は、スクリプト内の `DOWNLOAD_DIR` を編集してください。

---

## 🤖 macOS Automator の「フォルダアクション」で自動化する方法

ファイルが Downloads フォルダに追加されたときに、自動でスクリプトを実行したい場合：

### 1. スクリプトを保存して実行権限を付与

```bash
mkdir -p ~/Library/Scripts
cp organize_downloads.sh ~/Library/Scripts/
chmod +x ~/Library/Scripts/organize_downloads.sh
```

### 2. Automator でフォルダアクションを設定

1. Automator を起動
2. 「新規書類」→「フォルダアクション」を選択
3. 「このフォルダを監視」→ `Downloads` を選択
4. 「シェルスクリプトを実行」アクションを追加
5. 次のように入力：

```bash
~/Library/Scripts/organize_downloads.sh
```

6. 保存（例：`DownloadsOrganizer.workflow`）

> 📌 Finder または一般的なアプリ経由で Downloads に追加されたファイルに対して自動実行されます。

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
