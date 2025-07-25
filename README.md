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

### Manual Use

1. **Download or clone this repository**
2. **Run the script in your terminal**

```bash
bash organize_downloads.sh
```

By default, it organizes files under `~/Downloads/`.

> 💡 You can customize the target folder by modifying the `DOWNLOAD_DIR` variable at the top of the script.

---

## 🤖 Automate with Automator on macOS

To make this script run automatically using Automator:

### 1. Save the Script

Place the script file in a safe location, for example:

```
~/Library/Scripts/organize_downloads.sh
```

Make it executable:

```bash
chmod +x ~/Library/Scripts/organize_downloads.sh
```

### 2. Create an Automator App

1. Open **Automator**
2. Create a new **Application**
3. Add the **Run Shell Script** action
4. In the shell script box, enter:

```bash
~/Library/Scripts/organize_downloads.sh
```

5. Save the application, e.g., as `Downloads Organizer.app`

You can now run this app manually, or configure it to launch on login or at timed intervals.

---

## ⏱ Optional: Run Automatically with LaunchAgent

To schedule the script to run every 30 minutes:

1. Create a file at `~/Library/LaunchAgents/com.user.organizedownloads.plist` with this content:

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

2. Load it with:

```bash
launchctl load ~/Library/LaunchAgents/com.user.organizedownloads.plist
```

---

## 🧪 Testing (Optional)

If you'd like to test safely without touching your real Downloads folder:

```bash
mkdir -p ~/Downloads/test_env
cp organize_downloads.sh ~/Downloads/test_env/
cd ~/Downloads/test_env

# Create dummy files
touch file.txt file.txt image.png

# Modify DOWNLOAD_DIR in the script to:
# DOWNLOAD_DIR="$HOME/Downloads/test_env"
bash organize_downloads.sh
```

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).

---

## 🙋 Author

Created by [Your Name] — pull requests and improvements welcome!
