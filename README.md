# Dokumentasi Aplikasi Kuis Mobile: EduQuiz

## 1. Data Diri & Laboratorium

* **Nama**: Bhenarezky Suranta Ginting
* **NIM**: 231401003
* **Lab**: 5 Pemrograman Mobile

---

## 2. Nama Aplikasi

**QUIZ APP: EduQuiz**

---

## 3. Deskripsi Aplikasi

EduQuiz adalah aplikasi kuis pilihan ganda berbasis Flutter yang dikembangkan untuk menguji pengetahuan pengguna dalam berbagai kategori mata pelajaran. Aplikasi ini menerapkan pola arsitektur dasar Flutter dengan fokus pada pemisahan logika (Stateful/Stateless) dan komponen UI yang dapat digunakan kembali (*Reusable Widgets*).

**Fitur Utama:**

* **Personalisasi**: Pengguna diwajibkan memasukkan nama sebelum masuk ke halaman utama. Nama ini akan digunakan sebagai sapaan di halaman beranda dan hasil.
* **Pilihan Kategori**: Menyediakan 5 kategori kuis yang berbeda (**Umum, Sains, Matematika, Bahasa Inggris, Sejarah**), dengan masing-masing kategori memiliki 5 soal yang unik.
* **Kuis Acak**: Fitur untuk memulai kuis secara acak dari salah satu kategori yang tersedia.
* **State Management Lokal**: Mengelola *state* kuis (skor, indeks pertanyaan, jawaban yang dipilih) secara lokal menggunakan `StatefulWidget` untuk memastikan progres pengguna tidak hilang saat interaksi.
* **Halaman Hasil Dinamis**: Menampilkan skor akhir dengan umpan balik pesan dan warna yang berbeda (Hijau, Biru, Oranye, Merah) berdasarkan persentase jawaban benar.

**Struktur Halaman:**

1.  **`PageLogin`**: Halaman awal untuk input nama pengguna.
2.  **`PageHome`**: Halaman utama untuk menampilkan statistik dan memilih kategori.
3.  **`PageQuiz`**: Halaman utama logika kuis.
4.  **`PageResult`**: Halaman untuk menampilkan hasil akhir kuis.

---

## 4. Tampilan Aplikasi

Berikut adalah beberapa tangkapan layar dari aplikasi EduQuiz:

### Login Page
<img width="402" height="694" alt="Screenshot 2025-11-05 205610" src="https://github.com/user-attachments/assets/ca1a1aab-f245-4a32-aa6f-9e9808fe91e0" />



### Home Page
<img width="404" height="703" alt="Screenshot 2025-11-05 205636" src="https://github.com/user-attachments/assets/7d76af04-0780-4fd6-b603-d1d2c7b1a461" />



### Quiz Page
<img width="405" height="698" alt="Screenshot 2025-11-05 205730" src="https://github.com/user-attachments/assets/86a54217-d3e9-4bcd-85db-f6dfc3859928" />
<img width="405" height="697" alt="Screenshot 2025-11-05 205721" src="https://github.com/user-attachments/assets/263e0870-33f4-4b08-a3f9-f76372e43de5" />



### Result Page
<img width="403" height="675" alt="Screenshot 2025-11-05 205802" src="https://github.com/user-attachments/assets/5b2c3be2-dce1-46bd-9e15-94aac926aa24" />



---

## 5. Kredit ke Sumber Aset yang Digunakan

| Tipe Aset | Deskripsi | Sumber Lisensi |
| :-------- | :-------- | :------------- |
| **Ikon** | Semua ikon yang digunakan (misalnya: `Icons.lightbulb_outline`, `Icons.emoji_events_outlined`, dll.) | **Google Fonts/Material Icons** (Lisensi Apache 2.0) |
| **Warna** | Palet warna tema, warna kategori, dan gradien hasil. | Warna *hardcoded* (dikembangkan sendiri berdasarkan inspirasi Material Design) |
| **Data Soal** | Pertanyaan dan jawaban kuis di dalam `page_quiz.dart`. | Data Lokal (Dummy/Local Data) |
| **Inspirasi Aplikasi** | Konsep dasar aplikasi kuis interaktif dan variasi kategori mata pelajaran. | Quizizz (Sebagai Sumber Inspirasi) |
| **Figma** | Alat yang digunakan untuk prototyping dan perancangan User Interface (UI) aplikasi (awal design). | [https://www.figma.com/design/nNkD1ugALqaXuAcbEpRXwA/UTS-Pemrograman-Mobile?node-id=0-1&t=hYnDvd02TRA1i3la-1](https://www.figma.com/design/nNkD1ugALqaXuAcbEpRXwA/UTS-Pemrograman-Mobile?node-id=0-1&t=hYnDvd02TRA1i3la-1) |
