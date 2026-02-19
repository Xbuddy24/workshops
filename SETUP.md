---
layout: default
permalink: /setup
title: Environment Setup Guide
---

# Environment Setup Guide

This guide will help you install all the software needed for the Lansing Tech Studio workshops. Complete these steps before attending workshops to maximize hands-on time! If you prefer a video walkthrough, check out our [Workshop Setup playlist](https://youtube.com/playlist?list=PLcAS4Bap4HT-ThYld-2zikuhUShZYpk6G&si=xb5tEnSFvFOZrgOJ).

## What You'll Install

- **WSL2 with Ubuntu** (Windows only) - Linux environment for Windows
- **Linux Environment** (Chromebook only) - Developer tools access
- **Git** - Version control for saving and sharing code
  - **GitHub Account** - You will also need to create a GitHub account
- **VS Code** - Code editor for all your programming
- **Node.js** - Run JavaScript programs
- **Python 3** - For Python workshops (can be deferred)

**Time estimate:** 30-45 minutes \
**Required before:** JavaScript Basics workshop (1/22/2026) \
**Best timing:** if you try at least a few days before the workshop you can get help beforehand if needed

## Prerequisites

- Computer with administrator access
- Stable internet connection
- Parent's permission

<div class="page-break-after"></div>

## Section 1: Operating System Setup

Choose your platform below.

### Windows Users: Installing WSL2 with Ubuntu

**What is WSL2?** Windows Subsystem for Linux version 2 lets Windows run Linux tools natively. This gives you access to powerful developer tools.

**Official Guide:** [Microsoft's WSL Installation Guide](https://docs.microsoft.com/en-us/windows/wsl/install)

**Quick Steps:**

1. Open PowerShell as Administrator (right-click Start → Windows PowerShell (Admin))
2. Run this command:

   ```powershell
   wsl --install
   ```

3. Restart your computer when prompted
4. After restart, Ubuntu will open automatically
5. Create a username and password - **Important!!!**: _remember these!_

**Verification:**

- Open "Ubuntu" from Start menu
- You should see a terminal prompt

**Troubleshooting:**

- If `wsl --install` fails, your Windows may need updates
- [WSL Troubleshooting Guide](https://docs.microsoft.com/en-us/windows/wsl/troubleshooting)
- Minimum requirement: Windows 10 version 2004 or higher

<div class="page-break-after"></div>

### Chromebook Users: Enabling Linux

**What is Linux on Chromebook?** Chromebooks can run a Linux environment for developer tools.

**Official Guide:** [Google's Linux Setup for Chromebook](https://support.google.com/chromebook/answer/9145439)

**Quick Steps:**

1. Open **Settings**
2. Navigate to **Advanced** → **Developers**
3. Find **Linux development environment**
4. Click **Turn on**
5. Follow the setup wizard (may take 10 minutes to download)

**Verification:**

- Look for "Terminal" app in your app drawer
- Open it - you should see a command prompt

**Troubleshooting:**

- Not all Chromebooks support Linux - [check compatibility](https://www.chromium.org/chromium-os/chrome-os-systems-supporting-linux)
- Requires at least 5GB of free space

### Mac Users: Using Terminal

**Good news!** Mac has a Unix-based terminal built in.

**How to Open Terminal:**

- **Applications** → **Utilities** → **Terminal**

- Or use Spotlight: Press Cmd+Space, type "Terminal", press Enter

**Verification:**

- You should see a command prompt ending in `$`

<div class="page-break-after"></div>

## Section 2: Setting Up Git

**What is Git?** Version control system - save your code history and collaborate with others.

### Installation

Most modern systems will already have Git installed. Check by running:

```bash
git --version
```

If you see a version number, skip to the Configuration section below. If not, run the commands for your OS:

**Ubuntu Linux / WSL:** `sudo apt install git`

**Mac:** `xcode-select --install`

### Configuration

After installation, configure Git with your information and set default branch name:

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
git config --global init.defaultBranch main
```

**Verification:**

```bash
git --version
git config --list
```

<div class="page-break-after"></div>

## Section 3: GitHub Account Setup

**What is GitHub?** A website for hosting and sharing code using Git.

### Quick note on password management

Using a password manager is highly recommended to securely store your passwords and SSH keys. Some popular options include Bitwarden and 1Password. Bitwarden offers a free tier that is quite robust and can be accessed across multiple devices. Teaching youth to use a password manager and avoiding password reuse is a valuable skill for maintaining good security practices. Students will need to have access to their GitHub account during the workshop, so ensuring they can log in easily is important.

### Creating an Account

1. Go to [https://github.com/](https://github.com/)
2. Click "Sign up"
3. Follow the prompts (free account is fine)
4. Verify your email

### SSH Key Setup (Optional but Recommended)

**Why?** No need to enter password every time you push/pull.

**Official Guide:** [GitHub SSH Setup](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)

**Quick Steps:**

```bash
# Generate SSH key
ssh-keygen -t ed25519 -C "your.email@example.com"

# Press Enter to accept default location
# Enter a passphrase (optional but recommended; remember it!)

# Show your public key and copy it
cat ~/.ssh/id_ed25519.pub
```

Then:

1. Go to GitHub Settings → SSH and GPG keys
2. Click "New SSH key"
3. Paste your public key
4. Save
5. Test: `ssh -T git@github.com`

## Section 4: Cloning the Workshop Repository

**Forking the Repo:**

1. Go to the workshop repository URL: <https://github.com/Lansing-Tech-Studio/workshops>
2. Click "Fork" (upper right) to create your own copy
3. Choose your GitHub account

**Cloning the Repo:**

```bash
# Replace USERNAME with your GitHub username
git clone git@github.com:USERNAME/workshops.git
cd workshops
```

If you have trouble with SSH, use HTTPs instead:

```bash
# Replace USERNAME with your GitHub username
git clone https://github.com/USERNAME/workshops.git
cd workshops
```

**Updating Your Fork (for returning students):**

If you've already forked and cloned the repository for a previous workshop, you'll want to get any updates before the next session:

1. Go to your fork on GitHub (github.com/YOUR-USERNAME/workshops)
2. If your fork is behind, you'll see a message like "This branch is X commits behind"
3. Click the **Sync fork** button
4. Click **Update branch**
5. On your computer, open a terminal in your `workshops` folder and run:

   ```bash
   git pull
   ```

Now you have the latest workshop materials!

<div class="page-break-after"></div>

## Section 5: Installing VS Code

**What is VS Code?** Visual Studio Code is a free code editor made by Microsoft. It's powerful, customizable, and used by millions of developers.

**Downloads:** [https://code.visualstudio.com/download](https://code.visualstudio.com/download)

### All Platforms

1. Visit the downloads page
2. Choose your operating system
3. Run the installer
4. Follow installation prompts (default options are fine)

### Windows (WSL) Specific

After installing VS Code on Windows, you need the WSL extension:

1. Open VS Code
2. Click the Extensions icon (left sidebar, looks like blocks)
3. Search for "WSL"
4. Install ["WSL" by Microsoft](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-wsl)
5. Restart VS Code

**Opening VS Code from WSL:**

```bash
# In Ubuntu terminal
code . # Opens current folder (the "dot" means current directory) in VS Code
```

**Helpful Guide:** [VS Code with WSL](https://code.visualstudio.com/docs/remote/wsl)

<div class="page-break-after"></div>

### Recommended Extensions for Everyone

Install these VS Code extensions:

- **ESLint** - Helps catch JavaScript errors
- **Prettier** - Code formatter
- **Python** (for Python workshops)

**Verification:**

- Open VS Code
- Create a test file
- See syntax highlighting

## Section 6: Installing Node.js

**What is Node.js?** Node.js lets you run JavaScript outside the browser. We'll use it for JavaScript workshops.

**Required Version:** 18 or higher (preferably 24 or current Long Term Support (LTS))

### Recommended: Using NVM (Node Version Manager)

**Why NVM?** Easily install, update, and switch between Node versions.

**Official Guide:** [NVM Installation](https://github.com/nvm-sh/nvm#installing-and-updating)

#### Linux / Mac / WSL Installation

```bash
# Install NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# Close and reopen your terminal, then:
nvm install --lts
nvm use --lts
nvm alias default lts/*
```

Note that `lts` means "Long Term Support" version, and is a common nomenclature for many software projects. It's usually best to use the latest LTS version for stability.

**Verification:**

```bash
node --version    # Should show v24.x.x or higher
npm --version     # Should show version number
```

### Alternative: Direct Install

**Downloads:** [https://nodejs.org/](https://nodejs.org/)

1. Choose the LTS (Long Term Support) version
2. Download installer for your OS
3. Run installer with default options
4. Restart terminal

**Windows Note:** If using WSL, install Node.js inside Ubuntu (not on Windows side).

<div class="page-break-after"></div>

## Section 7: Installing Python 3

**What is Python?** Python is a programming language we'll use in workshops 4 and 5.

**Note:** You can defer this until Python workshops if needed.

### Linux / WSL

```bash
sudo apt update
sudo apt install python3 python3-pip python-is-python3
```

### Mac

Mac comes with Python, but install Python 3 specifically:

**Using Homebrew** (recommended):

```bash
# Install Homebrew first if needed
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Then install Python
brew install python3
```

**Or download from:** [https://www.python.org/downloads/](https://www.python.org/downloads/)

**Verification:**

```bash
python3 --version    # Should show 3.8 or higher
```

<div class="page-break-after"></div>

## Section 8: Final Verification

Test everything together to make sure it all works!

### Open VS Code

```bash
code .
```

### Create Test File

In VS Code:

1. Create new file: `test.js`
2. Add code:

   ```javascript
   console.log("Hello from Node!");
   ```

3. Save file

### Run Test

In VS Code integrated terminal (View → Terminal):

```bash
# Test Node.js
node $(find . -name "hello.js" -print -quit)
python $(find . -name "hello.py" -print -quit)

# Show versions of installed tools
node --version
python3 --version
git --version
```

### Success Checklist

- ✅ VS Code opens and shows terminal
- ✅ `node --version` shows v18 or higher
- ✅ `python3 --version` shows 3.8 or higher
- ✅ `git --version` shows version
- ✅ `git config --list` shows your name and email (`user.name` and `user.email`)

## Section 9: Troubleshooting & Help

### Common Issues

**"Command not found"**

- Tool might not be installed
- Or not in PATH (environment variable)
- Try restarting terminal or computer

**Permission errors**

- Need administrator access
- Use `sudo` on Linux/Mac (e.g., `sudo apt install`)

**WSL not found (Windows)**

- Windows version may be too old
- Requires Windows 10 version 2004 or newer
- Run Windows Update

**Node/Python wrong version**

- Uninstall old version first
- Or use version manager (NVM for Node)

### Getting Help

**Documentation Links:**

- [Node.js Documentation](https://nodejs.org/docs)
- [VS Code Documentation](https://code.visualstudio.com/docs)
- [WSL Documentation](https://docs.microsoft.com/en-us/windows/wsl/)
- [Git Documentation](https://git-scm.com/doc)

**Day Before Workshop:**

- Arrive 10 minutes early for tech help
- Bring this checklist completed

**During Workshops:**

- Instructors available to help
- Don't hesitate to ask questions!

<div class="page-break-after"></div>

## Section 10: Day Before Workshop Checklist

Complete this checklist 1-2 days before the workshop:

- [ ] VS Code opens successfully
- [ ] Can open terminal in VS Code (View → Terminal)
- [ ] `node --version` shows v18+
- [ ] `python3 --version` shows 3.8+ (can defer to Python workshop)
- [ ] `git --version` shows version number
- [ ] GitHub account created and verified
- [ ] Git configured with your name and email
- [ ] Workshop repo forked and cloned
- [ ] Can create and run a test JavaScript file

**All checked?** You're ready for the workshop!

## Section 11: (Optional) Install Godot Engine for Game Development Workshops

For our workshops, students can just use the [online version of Godot](https://editor.godotengine.org/releases/latest/), but if you want to use Godot more extensively or work on projects outside of workshops, installing the desktop version can be helpful, in particular for file/asset management.

**What is Godot?** Godot is a free and open-source game engine used for creating 2D and 3D games.

**Downloads:** [https://godotengine.org/download](https://godotengine.org/download)

For Windows, Mac, and Linux, follow the instructions on the download page.

### Chromebook Installation Steps

1. Open the Terminal app and start penguin (the Linux environment)
1. Check what processor your Chromebook has by running:

   ```bash
   lscpu | grep Architecture | awk '{print $2}'
   ```

   The result will be one of the following:
   - `x86_64` (choose `x86_64` below)
   - `i686` or `i386` (choose `x86_32` below)
   - `aarch64` (choose `arm64` below)
   - `armv7l` (choose `arm32` below)
1. Visit the Godot download page at <https://godotengine.org/download/linux/>
1. Scroll down to the "All downloads" section and click the link for your architecture:
   - [Linux - x86_64](https://downloads.godotengine.org/?version=4.6&flavor=stable&slug=linux.x86_64.zip&platform=linux.64)
   - [Linux - x86_32](https://downloads.godotengine.org/?version=4.6&flavor=stable&slug=linux.x86_32.zip&platform=linux.32)
   - [Linux - arm64](https://downloads.godotengine.org/?version=4.6&flavor=stable&slug=linux.arm64.zip&platform=linux.arm64)
   - [Linux - arm32](https://downloads.godotengine.org/?version=4.6&flavor=stable&slug=linux.arm32.zip&platform=linux.arm32)
1. Once you have the zip file downloaded, move it to your Linux home directory (you can find it in the "Files" app under "Linux files")
1. Open the terminal and navigate to your home directory

   ```bash
   cd ~
   ```
1. Unzip the downloaded file

   ```bash
   unzip linux.x86_64.zip  # replace with the name of your downloaded file
   ```
1. Rename the extracted file to "godot"

   ```bash
   mv godot-4.6-stable-linux.x86_64 godot  # replace with the actual extracted folder name
   ```
1. Make the "godot" file executable

   ```bash
   chmod +x godot
   ```
1. Move the "godot" file to `/usr/local/bin` to make it accessible from anywhere

   ```bash
   sudo mv godot /usr/local/bin/
   ```
1. Now you can run Godot from the terminal by typing:

   ```bash
   godot
   ```

Here's a script that combines all the terminal commands, including downloading the file, for installing Godot on a Chromebook with a `x86_64` architecture (you can copy and then paste it into the terminal by pressing Ctrl+Shift+V):

```bash
wget 'https://downloads.godotengine.org/?version=4.6&flavor=stable&slug=linux.x86_64.zip&platform=linux.64' -O godot.zip
unzip godot.zip
mv Godot_v4.6-stable_linux.x86_64 godot
chmod +x godot
sudo mv godot /usr/local/bin/
rm godot.zip
```

### Create a Desktop Shortcut (Chromebook Linux or Linux Mint Cinnamon)

After Godot is installed, run:

```bash
chmod +x scripts/create-godot-shortcut.sh
./scripts/create-godot-shortcut.sh
```

Or run it without cloning this repo:

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Lansing-Tech-Studio/workshops/main/scripts/create-godot-shortcut.sh)"
```

Without cloning, if you need to pass a specific Godot executable path:

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Lansing-Tech-Studio/workshops/main/scripts/create-godot-shortcut.sh)" -- /path/to/godot
```

If your executable is not in your `PATH`, pass it directly:

```bash
./scripts/create-godot-shortcut.sh /path/to/godot
```

The script downloads the official Godot icon and creates launcher files in:

- `~/.local/share/applications/godot.desktop`
- `~/Desktop/Godot.desktop` (if your desktop folder exists)
