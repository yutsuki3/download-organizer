# 📁 Download Organizer Script

A simple and safe Bash script to organize files in your `Downloads` folder by year and month. It automatically creates folders like `2025_04`, moves files into them, and **prevents overwriting** by renaming duplicates (e.g., `file.txt`, `file_1.txt`, `file_2.txt`, etc.).

## ✨ Features

- ✅ Automatically groups downloaded files into `YYYY_MM` folders
- ✅ Prevents overwriting by renaming duplicate filenames
- ✅ Handles files with or without extensions
- ✅ Simple and self-contained – no dependencies

---

## 🖥️ Example

Before:

```
~/Downloads/
├── photo.jpg
├── resume.pdf
├── photo.jpg  ← duplicated
```

After running the script:

```
~/Downloads/
└── 2025_04/
    ├── photo.jpg
    ├── resume.pdf
    └── photo_1.jpg
```

---

## 🔧 Manual Usage

1. **Download or clone this repository**
2. **Run the script in your terminal**

```bash
bash organize_downloads.sh
```

By default, it organizes files under `~/Downloads/`.

> 💡 You can customize the target folder by modifying the `DOWNLOAD_DIR` variable in the script.

---

## 🤖 Automate with Folder Action on macOS

To automatically execute the script whenever a file is added to your Downloads folder:

### 1. Save and make the script executable

```bash
mkdir -p ~/Library/Scripts
cp organize_downloads.sh ~/Library/Scripts/
chmod +x ~/Library/Scripts/organize_downloads.sh
```

### 2. Set up a Folder Action using Automator

1. Open the **Automator** app
2. Create a new **Folder Action**
3. Choose `Downloads` as the folder to watch
4. Add the **Run Shell Script** action
5. In the script box, enter:

```bash
~/Library/Scripts/organize_downloads.sh
```

6. Save the workflow (e.g. as `DownloadsOrganizer.workflow`)

> 📌 This will automatically trigger the script when new files are added to the Downloads folder via Finder or most apps.

---

## 🧪 Testing (Optional)

To safely test the behavior:

```bash
mkdir -p ~/Downloads/test_env
cp organize_downloads.sh ~/Downloads/test_env/
cd ~/Downloads/test_env

# Create dummy files
touch file.txt file.txt image.png

# Modify the script's DOWNLOAD_DIR to:
# DOWNLOAD_DIR="$HOME/Downloads/test_env"
bash organize_downloads.sh
```

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).

---

## 🙋 Author

Created by yutsuki3 — pull requests and improvements welcome!
