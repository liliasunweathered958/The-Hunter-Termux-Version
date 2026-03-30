#!/bin/bash

echo "[-] Iniciando preparación del entorno..."

if ! command -v unzip &> /dev/null; then
    pkg install unzip -y
fi

if [ ! -f "data.assets" ]; then
    echo "[!] Error: data.assets no encontrado."
    exit 1
fi

echo "[?] Introduce la clave para desplegar el laboratorio (password123):"
read -s password

unzip -P "$password" data.assets > /dev/null 2>&1

if [ $? -eq 0 ]; then
    if [ -d "src" ]; then
        mv src/* .
        rmdir src
    fi

    echo "[+] Recursos desplegados. Iniciando motor..."
    chmod +x init.sh
    chmod +x cleanup.sh
    ./init.sh
else
    echo "[X] Clave incorrecta."
    exit 1
fi
