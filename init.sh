#!/bin/bash

clear

ROJO='\033[0;31m'
VERDE='\033[0;32m'
AMARILLO='\033[1;33m'
AZUL='\033[0;34m'
CYAN='\033[0;36m'
GRIS='\033[0;90m'
NC='\033[0m'
BOLD='\033[1m'

ICON_CHECK="✔"
ICON_STEP="→"
ICON_INFO="ℹ"

# Uso: show_progress <duración_estimada_segundos> <mensaje>
show_progress() {
    local duration=$1
    local message=$2
    local width=30
    local filled=0
    local empty=$width

    printf "  ${CYAN}${ICON_STEP} ${message}${NC}\n"
    printf "  ${GRIS}["

    for ((i=0; i<width; i++)); do printf "░"; done
    printf "] 0%%${NC}"

    for ((i=0; i<=width; i++)); do
        local percent=$(( i * 100 / width ))
        local filled=$i
        local empty=$(( width - i ))

        printf "\r  ${GRIS}["

        printf "${VERDE}"
        for ((j=0; j<filled; j++)); do printf "█"; done

        printf "${GRIS}"
        for ((j=0; j<empty; j++)); do printf "░"; done

        printf "] ${percent}%%${NC}"

        sleep "$(echo "scale=2; $duration / $width" | bc -l)"
    done
    echo -e " ${VERDE}${ICON_CHECK}${NC}"
}

cd "$(dirname "$0")"

echo -e "${ROJO}"
cat << "EOF"
████████╗██╗  ██╗███████╗            ⠀⠀⠀ ⣀⣤⣶⣶⣿⣿⣷⣶⣶⣤⣄⠀⠀⠀
╚══██╔══╝██║  ██║██╔════╝           ⠀⠀ ⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣤⡀
   ██║   ███████║█████╗             ⠀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣄
   ██║   ██╔══██║██╔══╝             ⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇
   ██║   ██║  ██║███████╗           ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
   ╚═╝   ╚═╝  ╚═╝╚══════╝           ⣿⣿⡏⠙⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠋⠉⣿⣿
                                    ⢻⣿⡇⠀⠀⠈⠙⠻⣿⣿⣿⣿⣿⣿⠟⠋⠀⢀⣿⡇
██╗  ██╗██╗   ██╗███╗   ██╗████████╗⠘⣿⣷⡀  ⠀⠀⠀⠉⠛⢿⣿⠛⠋⠀⢀⣼⣿⠃
██║  ██║██║   ██║████╗  ██║╚══██╔══╝ ⠹⣿⣿⣶⣦⣤⣀⣤⣶⠟⡿⣷⣦⣤⣶⣿⣿⡟⠀
███████║██║   ██║██╔██╗ ██║   ██║    ⠀⣿⣿⣿⣿⣿⣿⣿⣿⠏⠀⡇⠸⣿⣿⣿⣿⣿⠃⠀
██╔══██║██║   ██║██║╚██╗██║   ██║    ⢈⣿⣿⣿⣿⣿⡿⠿⣷⠀⣼⣷⠀⣿⣿⣿⣿⣿⡇⠀
██║  ██║╚██████╔╝██║ ╚████║   ██║    ⠘⣿⣿⣿⡟⠋⠀⠰⣿⣷⣿⣿⣷⣿⣿⣿⣿⠟⠁⠀
╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝   ╚═╝    ⠀⠀⠀⠈⠁⠀ ⠘⣿⣿⢿⣿⡏⣿⣿⠈⠀⠀⠀⠀
                                      ⠀⠀⠀⠀⠀ ⠀⣿⣿⡇⣿⡇⣿⣿⡇⠀⠀⠀⠀
     > Termux Version <               ⠀⠀⠀⠀⠀ ⠀⣿⣿⡇⣿⡇⣿⣿⠀⠀⠀⠀⠀
                                      ⠀⠀⠀⠀⠀ ⠀⠸⣿⡇⣿⡇⣿⣿⠀⠀⠀⠀⠀
                                      ⠀⠀⠀⠀⠀ ⠀⠀⠿⠇⢿⡿⢸⡿
EOF
echo -e "${BOLD}${GRIS}        > The hunt begins <${NC}\n"



echo -e "${BOLD}${AZUL}--- CONFIGURACIÓN DE DEPENDENCIAS ---${NC}"

instalar_componente() {
    local cmd=$1
    local name=$2
    if ! command -v "$cmd" &> /dev/null; then
        show_progress 1.5 "Instalando $name..."
        pkg install "$cmd" -y > /dev/null 2>&1
    else
        echo -e "  ${VERDE}${ICON_CHECK}${NC} ${name} ya está presente en el sistema."
    fi
}

if [ "$UPDATE_DONE" != true ]; then
    show_progress 2 "Actualizando repositorios de APT..."
    pkg update -qq
    UPDATE_DONE=true
fi

instalar_componente "python3" "Python 3 Core"
instalar_componente "python3-venv" "Python VirtualEnv"
instalar_componente "wget" "Wget Downloader"

echo -e "\n${BOLD}${AZUL}--- CONFIGURACIÓN DEL TÚNEL ---${NC}"
if ! command -v cloudflared &> /dev/null; then
    show_progress 3 "Descargando binario de Cloudflared para Termux..."

    ARCH=$(uname -m)
    case $ARCH in
        aarch64|arm64) URL="https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm64" ;;
        armv7l|arm)    URL="https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm" ;;
        x86_64)        URL="https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64" ;;
        *)             URL="https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm64" ;;
    esac

    wget -q "$URL" -O "$PREFIX/bin/cloudflared"
    chmod +x "$PREFIX/bin/cloudflared"
    echo -e "  ${VERDE}${ICON_CHECK}${NC} Binario instalado en el entorno de usuario."
else
    echo -e "  ${VERDE}${ICON_CHECK}${NC} Motor de túnel detectado y activo."
fi

echo -e "\n${BOLD}${AZUL}--- ENTORNO VIRTUAL ---${NC}"
if [ ! -d "venv" ]; then
    show_progress 2 "Creando VENV y sincronizando librerías..."
    python3 -m venv venv
    source venv/bin/activate
    pip install Flask python-dotenv requests -q
else
    source venv/bin/activate
    echo -e "  ${VERDE}${ICON_CHECK}${NC} Entorno Python (VENV) listo."
fi

clear
echo -e "\n${GRIS}------------------------------------------------------------${NC}"
if [ -f "AcountHack.py" ]; then
    echo -e "${BOLD}${VERDE}  ${ICON_CHECK} TODO LISTO. DISFRUTA DE LA CACERÍA...${NC}\n"
    sleep 1
    exec python3 AcountHack.py
else
    echo -e "${ROJO}${BOLD}[!] ERROR CRÍTICO: AcountHack.py no encontrado.${NC}"
    exit 1
fi
