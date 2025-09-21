# 🐳  Docker Installer Script | Linux

A simple script that lets you **easily install Docker on Linux** with a single command.  
Works on **Debian/Ubuntu, Arch/Manjaro, Fedora, and openSUSE/SUSE**.

---

⚠️ WARNING ⚠️: I am **NOT** affilited with https://www.docker.com/ or their creators. This Repo was a personal project and **unoffical**!
I just want to make it easy for people to install Docker!

---

## ⚙️ Requirements

- A Linux system with `sudo` privileges  
- `curl` installed (only for the curl method)

---

## 💻 How to Install | Local

1. Place your `.sh` file into your "Linux Files" folder.  
2. Open a terminal window and give the script execute permission:

```bash
chmod +x dockerinstallscript.sh
```

3. Run the script:

```bash
./dockerinstallscript.sh
```

4. Let my script “cook” it will install Docker and all necessary dependencies.

---

## 🌐 How to Install | curl

1. Check if `curl` is installed:

```bash
curl --version
```

2. Run the following command to install Docker directly from this Githup Repo:

```bash
curl -fsSL https://raw.githubusercontent.com/therealabela/unoffical-dockerinstall-script/main/dockerinstallscript.sh | sudo bash
```

---

## ✅ How the Script Verifies Installation

After installation, the script will display:

```
Verify Installation
```

It will then run Docker's `hello-world` container.  

You can also test manually:

```bash
sudo docker run hello-world
```

If you see output like:

```
Hello from Docker!
This message shows that your installation appears to be working correctly.
```
then Docker was installed successfully. ✅

---

🐧 Supported Linux Distributions

- Debian / Ubuntu  
- Arch / Manjaro  
- Fedora / RHEL / CentOS  
- openSUSE / SUSE

---

## ⚡ Notes

If something goes wrong, try updating your system first:

Make sure your user has `sudo` privileges.

---

Made by [therealabela](https://github.com/therealabela) :D

