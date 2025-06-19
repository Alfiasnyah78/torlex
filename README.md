# 🚀 Torlex Installer



**Torlex Installer** adalah script Bash interaktif yang mengotomatisasi pemasangan dan konfigurasi `Tor` serta `tornet`, sebuah tool Python yang mengganti IP publik yang bisa diatur secara otomatis melalui jaringan Tor. contoh IP dalam beberapa detik bisa berganti 

---

## 🎯 Fitur

- 🔧 Install **Tor**, **Python3**, **pip**
- 🔐 Konfigurasi `torrc` dengan password interaktif
- 🔁 Install `tornet` dalam virtual environment
- 🛰️ Ganti IP secara otomatis setiap interval
- 🌈 Antarmuka terminal interaktif & berwarna

---

## 🧰 Persyaratan

- OS: Linux (Debian/Ubuntu/Kali)
- Paket: `tor`, `python3`, `pip`
- Hak akses `sudo`

---

## 📥 Instalasi

1. Clone repositori atau download script:

```bash
git clone https://github.com/Alfiasyah78/torlex.git
cd torlex
```

2. Jadikan script executable:

```bash
chmod +x torlex.sh
```

3. Jalankan Script

```bash
./torlex.sh

```

Contoh Penggunaan:

```bash
tornet --interval 15 --count
##Mengganti IP public melalui TOR setiap 15 detik, sebanyak 5 kali
```

🧠 FAQ
💬 Apakah aman digunakan?
Ya, script ini hanya mengonfigurasi Tor lokal dan memakai tool open-source Python (tornet).

🔐 Bagaimana jika ingin IP ganti terus-menerus?
Gunakan --count 0:
```bash
tornet --interval 10 --count 0
```

👨‍💻 Kontributor
al3x — GitHub
Terinspirasi dari karya ByteBreach

📄 Lisensi
MIT License. Bebas digunakan, diubah, dan didistribusikan.


