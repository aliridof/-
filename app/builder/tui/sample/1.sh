#!/bin/bash
# Skrip Deployment Interaktif Berbasis TUI menggunakan 'dialog'

# Mengaktifkan mode yang akan menghentikan skrip jika ada perintah penting yang gagal
set -e

# --- Variabel dan Konfigurasi ---
DIALOG_TITLE="Deployment App Workflow TUI"
DIALOG_WIDTH=70
DIALOG_HEIGHT=20
TEMP_LOG="/tmp/deploy_tui_log_$$" # File log sementara dengan PID

# --- Fungsi Utilitas ---

# Memastikan 'dialog' terinstal
check_dialog() {
    if ! command -v dialog &> /dev/null; then
        echo "========================================================"
        echo "  [ERROR] Utilitas 'dialog' tidak ditemukan."
        echo "  Silakan instal: sudo apt install dialog"
        echo "========================================================"
        exit 1
    fi
}

# Fungsi untuk menjalankan perintah dan menampilkan output di tailbox
run_task_and_show_log() {
    local task_title=$1
    local command_to_run=$2
    local error_message=$3

    # Tampilkan pesan proses
    dialog --infobox "Menjalankan: $task_title..." 3 50

    # Jalankan perintah dan redirect stdout & stderr ke file log
    # Gunakan sub-shell untuk menjalankan perintah dan menangkap status exit
    (
        echo "--- Memulai Tugas: $task_title @ $(date +"%Y-%m-%d %H:%M:%S") ---"
        eval "$command_to_run"
    ) &> "$TEMP_LOG"

    local exit_status=$?

    # Tampilkan log hasil eksekusi dalam tailbox
    dialog --title "LOG: $task_title" \
           --backtitle "$DIALOG_TITLE" \
           --ok-label "Lanjut" \
           --tailbox "$TEMP_LOG" $DIALOG_HEIGHT $DIALOG_WIDTH

    if [ $exit_status -ne 0 ]; then
        dialog --title "KESALAHAN FATAL" \
               --backtitle "$DIALOG_TITLE" \
               --msgbox "$error_message (Lihat log di $TEMP_LOG)" 8 50
        return 1
    fi
    return 0
}

# --- LOGIKA DEPLOYMENT (Disesuaikan dari deploy.sh) ---

# Tugas: Install dependencies (apt install -y docker)
install_dependencies() {
    local title="PHASE 01: Install Dependencies (Docker)"
    local cmd='
    if command -v docker &> /dev/null; then
        echo "Docker sudah terinstal. Melewati instalasi."
    else
        echo "Memperbarui daftar paket..."
        sudo apt update || { echo "ERROR: Gagal apt update"; exit 1; }
        echo "Menginstal docker.io..."
        sudo apt install -y docker.io || { echo "ERROR: Gagal menginstal Docker"; exit 1; }
        echo "Memastikan layanan Docker berjalan..."
        sudo systemctl start docker && sudo systemctl enable docker
    fi
    '
    run_task_and_show_log "$title" "$cmd" "Instalasi dependensi (Docker) GAGAL. Hentikan deployment."
}

# Tugas: Configure environment
configure_environment() {
    local title="PHASE 01: Configure Environment"
    local cmd='
    echo "Tidak ada konfigurasi spesifik saat ini..."
    echo "Memeriksa status layanan Docker..."
    sudo systemctl status docker --no-pager || echo "Peringatan: Layanan Docker mungkin tidak aktif atau status tidak dapat diambil."
    '
    run_task_and_show_log "$title" "$cmd" "Konfigurasi lingkungan GAGAL."
}

# Tugas: Build containers (docker-compose build)
build_containers() {
    local title="PHASE 02: Build Containers"
    local cmd='
    if ! command -v docker-compose &> /dev/null; then
        echo "ERROR: Perintah docker-compose tidak ditemukan."
        exit 1
    fi
    echo "Mencari file docker-compose.yml dan membangun kontainer..."
    docker-compose build
    '
    run_task_and_show_log "$title" "$cmd" "Build kontainer GAGAL. Pastikan file docker-compose.yml ada."
}

# Tugas: Start services (docker-compose up -d)
start_services() {
    local title="PHASE 02: Start Services"
    local cmd='
    if ! command -v docker-compose &> /dev/null; then
        echo "ERROR: Perintah docker-compose tidak ditemukan."
        exit 1
    fi
    echo "Memulai layanan di latar belakang..."
    docker-compose up -d
    '
    run_task_and_show_log "$title" "$cmd" "Memulai layanan GAGAL. Periksa port atau log."
}

# --- Fungsi Fase ---

run_phase_01() {
    install_dependencies && configure_environment
    return $?
}

run_phase_02() {
    build_containers && start_services
    return $?
}

run_all_phases() {
    dialog --title "Konfirmasi" --backtitle "$DIALOG_TITLE" \
           --yesno "Apakah Anda yakin ingin menjalankan SEMUA fase secara berurutan (SETUP lalu DEPLOY)?" 8 50
    if [ $? -eq 0 ]; then
        run_phase_01 && run_phase_02
        local status=$?
        if [ $status -eq 0 ]; then
            dialog --title "SELESAI" --backtitle "$DIALOG_TITLE" \
                   --msgbox "✅ Deployment Lengkap dan Berhasil!" 5 50
        fi
    fi
}

# --- Menu Utama ---

main_menu() {
    while true; do
        exec 3>&1 # Deskriptor file 3 untuk output dialog

        CHOICE=$(dialog --title "$DIALOG_TITLE" \
                        --backtitle "Deployment TUI" \
                        --menu "Pilih Fase Deployment:" $DIALOG_HEIGHT $DIALOG_WIDTH 15 \
                        "1" "▶️ Jalankan SELURUH Workflow (Phase 01 & 02)" \
                        "2" "⚙️ PHASE 01: SETUP (Instalasi & Konfigurasi)" \
                        "3" "🚀 PHASE 02: DEPLOY (Build & Start Services)" \
                        "4" "ℹ️ Tentang Skrip" \
                        "0" "❌ Keluar" \
                        2>&1 1>&3)

        exec 3>&- # Tutup deskriptor file

        case $CHOICE in
            1) run_all_phases ;;
            2) run_phase_01 ;;
            3) run_phase_02 ;;
            4) dialog --title "Tentang" --msgbox "Skrip ini mengotomatisasi alur kerja dua fase: SETUP dan DEPLOY, menggunakan utilitas 'dialog' untuk antarmuka interaktif." 6 60 ;;
            0) break ;;
        esac
    done
}

# --- Eksekusi Skrip ---

# 1. Pastikan dialog ada
check_dialog

# 2. Jalankan menu utama
main_menu

# 3. Bersihkan file log sementara
rm -f "$TEMP_LOG"

dialog --clear # Membersihkan layar terminal dari dialog
echo "Skrip Deployment TUI selesai. Terima kasih."
