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

## 🔧 Usage

1. **Download or clone this repository**
2. **Run the script in your terminal**

```bash
bash organize_downloads.sh
```

By default, it organizes files under `~/Downloads/`.

> 💡 You can customize the target folder by modifying the `DOWNLOAD_DIR` variable at the top of the script.

---

## 🧪 Testing (Optional)

If you'd like to test safely without touching your real Downloads folder:

```bash
mkdir -p ~/Downloads/test_env
cp organize_downloads.sh ~/Downloads/test_env/
cd ~/Downloads/test_env

# Create dummy files
touch file.txt file.txt image.png

# Run script after modifying DOWNLOAD_DIR inside the script to:
# DOWNLOAD_DIR="$HOME/Downloads/test_env"
bash organize_downloads.sh
```

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).

---

## 🙋 Author

Created by [Your Name] — pull requests and improvements welcome!
