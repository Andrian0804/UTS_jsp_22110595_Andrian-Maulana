# UTS_jsp_22110595_Andrian-Maulana
# Sistem Pemesanan Tiket Bioskop

## Deskripsi
Aplikasi ini adalah sistem pemesanan tiket bioskop sederhana yang dibangun menggunakan JSP dan HTML.
📌 Prasyarat Sistem
Sebelum memulai, pastikan Anda telah menginstal:

Java JDK (versi 8 atau lebih baru)

Apache Tomcat (versi 9.x atau 10.x)

Web Browser (Chrome, Firefox, atau Edge)
## Fitur Utama
- Pemesanan tiket melalui form JSP
- Pemrosesan data menggunakan JSP Scriptlet
- Menampilkan hasil transaksi (nama, film, jam tayang, jumlah, dan total harga)

## Cara Menjalankan
1. Pastikan Apache Tomcat sudah terinstall dan berjalan
2. Letakkan folder project di direktori `webapps` Apache Tomcat
3. Akses aplikasi melalui browser dengan URL:


🌐  Akses Aplikasi
Buka browser (Chrome/Firefox).

Masukkan URL:

http://localhost:8080/FutureTicketProject/index.jsp
Tampilan Awal:

Cara menjalankan
Daftar film (Fast & Furious, Cars 4).

Pilih "Pesan Tiket" untuk memulai pemesanan.
![IMG-20250516-WA0021](https://github.com/user-attachments/assets/1b739e7d-ccac-4f79-b184-a1c1a9ea1d16)


🎬  Proses Pemesanan Tiket
Pilih Film (Contoh: Fast & Furious).

Isi Form Pemesanan:

![IMG-20250516-WA0019](https://github.com/user-attachments/assets/c4326272-eb9e-4349-ac22-a67439c2e6f8)


Nama Pemesan (Contoh: Andrian)

Jumlah Tiket (Contoh: 1)

Jam Tayang (Pilih dari dropdown, contoh: 13:00)

Klik "Cetak Struk" untuk melihat ringkasan pemesanan.

![IMG-20250516-WA0018](https://github.com/user-attachments/assets/ae6b5c33-4c38-49e1-b880-627c667f539d)

🖨️ Contoh Output (Struk Pemesanan)
Detail	Nilai
Nama Pemesan	Andrian
Film	Fast And Furious
Jam Tayang	13:00
Jumlah Tiket	1
Harga per Tiket	Rp 50.000
Total Harga	Rp 50.000
