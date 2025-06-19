#!/bin/bash

# 🎨 Warna
RED='\033[0;31m'
GREEN='\033[1;32m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
YELLOW='\033[1;33m'
RESET='\033[0m'

# 🖼️ Banner
banner() {
  echo -e "${CYAN}"
  echo "╔══════════════════════════════════════╗"
  echo "║           🚀 T O R L E X             ║"
  echo "║      Tor IP Rotator Installer        ║"
  echo "╚══════════════════════════════════════╝"
  echo -e "${RESET}"
}

# 🔧 Fungsi untuk validasi dependensi
install_dependencies() {
  echo -e "${BLUE}[+] Menginstall dependensi...${RESET}"
  sudo apt update
  sudo apt install tor python3 python3-pip net-tools -y
}

# 🔑 Input password & generate hash
setup_torrc() {
  echo -e "${YELLOW}[?] Masukkan password untuk kontrol Tor:${RESET}"
  read -s TOR_PASSWORD

  HASHED=$(tor --hash-password "$TOR_PASSWORD" | grep '^16:')

  if grep -q "ControlPort 9051" /etc/tor/torrc; then
    echo -e "${RED}[!] Konfigurasi torrc sudah ada. Lewat...${RESET}"
  else
    echo -e "${GREEN}[✓] Menambahkan konfigurasi ke /etc/tor/torrc${RESET}"
    sudo bash -c "cat >> /etc/tor/torrc <<EOF

ControlPort 9051
CookieAuthentication 0
HashedControlPassword $HASHED
EOF"
  fi
}

# 🚀 Restart Tor
restart_tor() {
  echo -e "${BLUE}[+] Restarting Tor service...${RESET}"
  sudo systemctl restart tor
  sleep 2
  sudo systemctl status tor --no-pager | grep Active
}

# 🐍 Install virtualenv dan tornet
setup_tornet() {
  echo -e "${BLUE}[+] Membuat virtual environment...${RESET}"
  python3 -m venv tornet-env
  source tornet-env/bin/activate

  echo -e "${GREEN}[✓] Menginstall tornet...${RESET}"
  pip install --upgrade pip
  pip install tornet
}

# ▶️ Menjalankan tornet
run_tornet() {
  echo -e "${CYAN}Menjalankan tornet... ganti IP setiap 15 detik${RESET}"
  sleep 1
  tornet --interval 15 --count 5
}

# 🧱 Eksekusi Script
banner
install_dependencies
setup_torrc
restart_tor
setup_tornet
run_tornet

