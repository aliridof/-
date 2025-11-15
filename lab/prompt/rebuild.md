# 🔧 Prompt Rebuild Aplikasi - Versi Optimasi

## 📋 **KONTEKS & TUJUAN**
Lakukan analisis mendalam dan refactor aplikasi yang telah kamu buat untuk menghasilkan versi yang lebih optimal dengan mempertahankan semua fungsionalitas existing.

## 🎯 **DELIVERABLES**
Hasilkan **1 file HTML tunggal** yang berisi:
- HTML struktur yang semantic
- CSS internal (dalam tag `<style>`)
- JavaScript internal (dalam tag `<script>`)
- Semua fungsionalitas dari aplikasi original

## ⚙️ **SPESIFIKASI TEKNIS**

### **A. Arsitektur & Struktur**
- **Format:** Single HTML file dengan embedded CSS & JavaScript
- **Metodologi:** Refactor dengan prinsip clean code
- **Modularitas:** 
  - Pisahkan concerns (separation of concerns)
  - Gunakan design patterns yang sesuai
  - Implementasikan fungsi/class yang reusable

### **B. UI/UX Requirements**
- **Tema Warna:**
  - Implementasi dual theme (dark/light mode) dengan toggle
  - Palet warna STRICT: Hanya dark, dan light, tanpa warna lain. 
  - Transisi smooth antar mode
- **Desain:** Optimalisasi UI dan UX. 
- **Icons:** Google Material Icons
  ```html
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  ```

### **C. Optimasi Performa**
1. **JavaScript:**
   - Gunakan algoritma yang efisien (O notation optimal)
   - Minimize DOM manipulation
   - Implement debouncing/throttling bila perlu
   - Lazy loading untuk komponen berat

2. **CSS:**
   - Gunakan CSS variables untuk maintainability
   - Minimize reflow/repaint
   - Optimize selector specificity
   - Implement CSS containment bila sesuai

3. **HTML:**
   - Semantic markup
   - Minimize nesting depth
   - Optimize element count

## 📊 **KRITERIA SUKSES**
- [ ] **Ukuran file:** 
- [ ] **Line count:** Lebih ringkas tanpa mengorbankan readability
- [ ] **Performance:** Time to Interactive (TTI) < 2 detik
- [ ] **Fungsionalitas:** 100% feature parity dengan original
- [ ] **Error-free:** Zero console errors/warnings
- [ ] **Cross-browser:** Kompatibel dengan browser modern (Chrome, Firefox, Safari, Edge)

## 📝 **OUTPUT STRUKTUR**
```html
<!DOCTYPE html>
<html lang="id">
<head>
    <!-- Meta tags & Material Icons -->
    <style>
        /* CSS Variables untuk theme switching */
        /* Modular CSS dengan BEM methodology */
    </style>
</head>
<body>
    <!-- Semantic HTML structure -->
    
    <script>
        // Modular JavaScript dengan clear separation
        // 1. Configuration/Constants
        // 2. Utility functions
        // 3. Core functionality
        // 4. Event handlers
        // 5. Initialization
    </script>
</body>
</html>
```

## 🚀 **TAHAPAN EKSEKUSI**
1. **Analisis:** Review kode existing dan identifikasi bottleneck
2. **Planning:** Buat arsitektur baru yang optimal
3. **Refactor:** Implementasi dengan best practices
4. **Testing:** Validasi semua fungsionalitas
5. **Optimization:** Fine-tuning performa final

---
**Note:** Ganti `[nama_aplikasi]` dan `[Spesifikasi_UI/UX_khusus]` dengan detail spesifik aplikasi Anda.
