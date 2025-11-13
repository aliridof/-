# 🎯 UNIVERSAL TUTORIAL GENERATOR PROMPT

Gunakan prompt berikut untuk membuat AI menghasilkan tutorial dengan format yang identik seperti dalam dokumen:
```
https://raw.githubusercontent.com/aliridof/lab/refs/heads/main/format/tui.md
```
---

## 📋 PROMPT UTAMA

```
Buatkan dokumentasi tutorial lengkap untuk [TOPIK] dalam format ASCII tree diagram yang terstruktur.

FORMAT WAJIB:
1. Gunakan ASCII art untuk visualisasi flow
2. Setiap fase harus memiliki:
   - Header box dengan emoji dan nomor fase
   - Tree structure dengan simbol: ├─► └─► │
   - Checkpoint decisions dengan ✓/✗
   - Tampilan UI dalam box menggunakan ┌─┐│└─┘
   - User input scenarios
   - Error handling
   - Validasi dan konfirmasi

STRUKTUR SETIAP FASE:
┌─────────────────────────────────────────────────────────────────────────┐
│ [EMOJI] FASE XX: [NAMA FASE]                                           │
└─────────────────────────────────────────────────────────────────────────┘
│
├─► [CHECK/PROMPT/EXECUTE] Deskripsi aksi
│   ├─── ✓ SUKSES → Aksi jika berhasil
│   │              Lanjut ke FASE berikutnya
│   └─── ✗ GAGAL  → ERROR: "Pesan error"
│                   Aksi alternatif atau EXIT

ELEMEN VISUAL WAJIB:
- Box untuk UI/tampilan: ┌───┐ │ └───┘
- Tree branches: ├─► └─► │
- Checkmarks: ✓ ✗
- Emoji fase: 🔢🌐🔐🌤️📦🔑🛡️💾📦🐳📁🗃️📜🚀
- Separator: ═══════════════════════

DETAIL YANG HARUS ADA:
1. Validasi input user di setiap langkah
2. Error handling dengan pesan jelas
3. Conditional flows (if-else scenarios)
4. Progress indicators
5. Success/failure branches
6. File paths dan commands eksak
7. Expected outputs
8. Fallback options

CONTOH CONDITIONAL:
[CONDITIONAL] Jika KONDISI=nilai:
├─► [YA] → Aksi A
│         Lanjut ke tahap X
└─► [TIDAK] → Aksi B
              Lanjut ke tahap Y

Pastikan:
- Setiap fase connected ke fase berikutnya
- Tidak ada dead-end tanpa solusi
- Error recovery paths jelas
- User journey dari awal sampai akhir seamless
```

---

## 🎨 PROMPT UNTUK STYLING SPESIFIK

```
ATURAN STYLING:

1. HEADER UTAMA:
═══════════════════════════════════════════════════════════════════════════
                    [JUDUL BESAR CENTERED]
                         [subtitle]
═══════════════════════════════════════════════════════════════════════════

2. BOX FASE:
┌─────────────────────────────────────────────────────────────────────────┐
│ 🔢 FASE XX: JUDUL FASE (UPPERCASE)                                      │
└─────────────────────────────────────────────────────────────────────────┘

3. UI DISPLAY BOX (lebih kecil):
┌─────────────────────────────────────────────────┐
│ Konten tampilan UI                              │
│ Pilihan menu atau prompt                        │
└─────────────────────────────────────────────────┘

4. TREE SYMBOLS:
│   - Vertical line (continuation)
├─► - Branch point
└─► - Last branch
├─── - Decision branch
└─── - Last decision

5. STATUS INDICATORS:
✓ YES/SUKSES/OK → Green path
✗ NO/GAGAL/ERROR → Red path/recovery
[CHECK] - Validation point
[EXECUTE] - Action point
[PROMPT] - User input point
[INFO] - Information display
[VERIFY] - Verification step
[CONDITIONAL] - Logic branch

6. INDENTATION:
- Level 1: No indent
- Level 2: 4 spaces atau │ + 3 spaces
- Level 3: 8 spaces atau nested │
- Nested boxes: 4-space left margin

7. CODE/COMMAND BLOCKS:
Dalam box atau indented dengan │ prefix
```

---

## 🔧 PROMPT UNTUK ASPEK TEKNIS

```
KOMPONEN TEKNIS YANG HARUS ADA:

1. PRASYARAT (Fase Awal):
- System requirements check
- Permission verification
- Dependency validation
- Network connectivity

2. INPUT VALIDATION:
Untuk setiap user input:
- Format validation
- Range/length check
- Security validation
- Confirmation step

3. ERROR RECOVERY:
Untuk setiap error:
- Clear error message
- Root cause explanation
- Recovery steps
- Alternative options
- Exit conditions

4. PROGRESS TRACKING:
- Phase completion indicators
- Running status
- Time estimates (optional)
- Success confirmations

5. FILE OPERATIONS:
- Full file paths
- Permission requirements (chmod, chown)
- Content verification
- Backup strategies

6. SECURITY CONSIDERATIONS:
- Password handling (hidden input)
- Credential storage
- File permissions
- Network security
- Access control

7. FINAL OUTPUT:
- Success summary
- Access instructions
- Credential reminders
- Next steps
- Troubleshooting tips
```

---

## 📝 TEMPLATE LENGKAP UNTUK COPY-PASTE

```
Buatkan dokumentasi ASCII tree untuk instalasi/setup [NAMA_APLIKASI].

REQUIREMENTS:
- Format: ASCII tree dengan box dan emoji
- Jumlah fase: [TENTUKAN JUMLAH]
- Fokus: [User journey/Technical flow/Troubleshooting]
- Detail level: [Basic/Medium/Advanced]

FASE YANG DIBUTUHKAN:
1. Prasyarat & Validasi Sistem
2. [Fase 2 - sesuaikan]
3. [Fase 3 - sesuaikan]
...
N. Verifikasi & Testing Final

SKENARIO KHUSUS:
- [Conditional scenario 1]
- [Conditional scenario 2]
- [Error handling scenario]

OUTPUT FORMAT:
Ikuti format persis seperti contoh Guacamole installer dengan:
- ASCII boxes ┌─┐│└─┘
- Tree branches ├─► └─► │
- Checkmarks ✓ ✗
- Emoji fase
- UI mockups dalam box
- Validasi di setiap step
- Error recovery paths
- Success/failure indicators

Pastikan setiap fase:
1. Memiliki deskripsi jelas
2. Input validation
3. Success path
4. Failure recovery
5. Connection ke fase berikutnya
6. No dead-ends
```

---

## 🎯 CONTOH PENGGUNAAN

**Prompt 1 - Instalasi WordPress:**
```
Buatkan dokumentasi ASCII tree untuk instalasi WordPress dengan Docker.

Fase: Prasyarat → Domain Setup → SSL Choice → Database Setup → WP Config → Launch → Testing

Format seperti Guacamole installer dengan validasi penuh di setiap step.
```

**Prompt 2 - CI/CD Pipeline:**
```
Buatkan flow diagram ASCII untuk setup CI/CD pipeline GitHub Actions.

Fase: Repository Setup → Workflow Choice → Environment Config → Secret Management → Deploy Strategy → Testing → Monitoring

Include conditional flows untuk different deployment targets (staging/production).
```

**Prompt 3 - Security Audit:**
```
Buatkan checklist interaktif ASCII tree untuk security audit server.

Fase: Initial Scan → Vulnerability Check → Firewall Config → SSL Verification → User Access Audit → Reporting

Setiap check harus punya pass/fail dengan remediation steps.
```

---

## ⚙️ CUSTOMIZATION OPTIONS

Tambahkan modifier berikut ke prompt dasar:

- `dengan fokus keamanan maksimal` → Tambah fase security extra
- `untuk pemula` → Simplified validation, banyak penjelasan
- `production-ready` → Advanced error handling, monitoring
- `dengan troubleshooting guide` → Extra error scenarios
- `multi-platform (Ubuntu/CentOS/Debian)` → Conditional OS paths
- `dengan rollback strategy` → Undo/recovery procedures
- `automated testing` → Verification scripts included

---

Gunakan kombinasi prompt di atas untuk menghasilkan dokumentasi tutorial dengan format ASCII tree yang konsisten, interaktif, dan mudah diikuti seperti dokumen Guacamole installer Anda! 🚀
