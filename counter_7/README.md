# Tugas 7

## Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya.

Stateless widget adalah Widget yang sifatnya statis, statusnya tidak dapat diubah setelah dibuat. Contoh stateless widgets adalah Text dan Icon yang sifatnya immutable (tidak akan berubah saat runtime). Stateless widget berguna untuk interface yang dapat berdiri sepenuhnya sendiri, tanpa bergantung pada hal lain selain informasi konfigurasi dan BuildContext. Stateful widget adalah widget yang memperbolehkan statusnya untuk diubah setelah dibuat. Stateful widget berguna ketika interface yang ingin kita buat harus dapat berubah secara dinamis. 

## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
Widget yang saya pakai:
1. MaterialApp: membungkus widgets lain untuk menyusun sebuah material design application.
3. AppBar: terdiri dari judul aplikasi.
4. Text: menampilkan teks seperti 'GANJIL', 'GENAP', angka counter, dan judul aplikasi.
5. Center: membuat children widget ini centered di dalamnya (menengahkan column yang berisi text 'GANJIL'/'GENAP' dan angka counter).
6. Column: menampilkan children-nya sebagai array vertikal (membuat text 'GANJIL'/'GENAP' sebaris dengan angka counter secara vertikal).
9. Padding: menampilkan children-nya dengan inset yang ditentukan (memberikan inset 8.0 kepada baris yang menampilkan icon + dan -).
10. Row: menampilkan children-nya dalam array horizontal (membuat icon + dan - sebaris).
12. Icon: Glyph dari sebuah font yang ditampilkan sebagai icon (icon + dan -).

## Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
setState() memberitahu framework bahwa ada perubahan yang terjadi pada internal state dari object yang berkaitan. Variabel yang terdampak adalah variabel yang berada dalam fungsi tersebut. Pada project `counter_7`, variabel yang terdampak adalah variabel `_counter` (oleh fungsi increment dan decrement).

## Jelaskan perbedaan antara const dan final.
Meskipun value dari `const` dan `final` keduanya tidak akan dapat berubah setelah diberikan value, `const` digunakan ketika value diketahui saat compile time dan `final` digunakan apabila value belum diketahui saat compile time dan baru akan diketahui (dikalkulasi/diambil) saat runtime.

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas
* Membuat sebuah program Flutter baru dengan nama `counter_7` dengan menjalankan command `flutter create counter_7` di direktori `pbp-flutter-lab`.
* Mengubah tampilan aplikasi dengan mengganti title MyHomePage menjadi "Program Counter", membuat teks 'GANJIL' dan 'GENAP' yang akan muncul di atas counter sesuai dengan count saat ini, dan membuat FloatingActionButton baru dengan simbol minus yang diletakkan sebaris dengan button plus menggunakan MainAxisAlignment.
* Menggunakan fungsi _incrementCounter yang tersedia di template dan menambahkan fungsi _decrementCounter() yang akan men-decrement variabel `_counter` dengan kondisi `counter > 0`. Kondisi ini akan memastikan bahwa counter tidak akan ter-decrement apabila count saat ini adalah 0. Untuk teks di atas counter, saya menggunakan if-else dengan kondisi seperti `if (_counter%2 == 0)` maka tampilkan teks berupa 'GENAP' dengan properti color pada TextStyle-nya yaitu warna merah. Else, akan ditampilkan teks 'GANJIL' dengan properti color pada TextStyle-nya yaitu biru. Angka 0 jika dimodulo dengan 2 akan menghasilkan 0, sehingga dianggap sebagai angka genap.

# Tugas 8
## Jelaskan perbedaan `Navigator.push` dan `Navigator.pushReplacement`
`Navigator.push` berfungsi untuk menambahkan route ke dalam stack Route yang diatur Navigator tanpa menghapus routing sebelumnya.
`Navigator.pushReplacement` berfungsi seperti `Navigator.push`, namun route sebelumnya akan dihapus dan route baru akan dipush (digantikan).

## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya
Selain widgets yang sudah disebutkan pada tugas 7, widgets yang dipakai di proyek kali ini antara lain:
1. Drawer: widget yang akan slide secara horizontal dari tepi Scaffold untuk menunjukkan navigation links di suatu aplikasi.
2. TextFormField: sebuah FormField yang di dalamnya berisi TextField.
3. DropdownButtonFormField: sebuah FormField yang di dalamnya berisi DropdownButton, yaitu button untuk memilih dari sejumlah pilihan.
4. DropdownMenuItem: item berupa menu yang disediakan oleh DropdownButton.
5. TextButton: button berisi text
6. ListTile: Sebuah row yang fixed-height, biasanya mengandung teks dan icon pada trailing/leading

## Sebutkan jenis-jenis event yang ada pada Flutter
- onClick
- onPressed
- onHover
- onTap
- onChanged
- onLongPress

## Jelaskan bagaimana cara kerja Navigator dalam "mengganti" halaman dari aplikasi Flutter
Navigator bekerja dengan memanfaatkan stack berisi routes ke halaman-halaman dalam aplikasi yang diakses user. Halaman yang ditampilkan adalah halaman pada stack. Navigator akan memanggil method pop untuk melakukan pergantian halaman, dan halaman yang ditampilkan menjadi halaman sebelumnya. Untuk mmelakukan navigasi ke halaman baru, akan dipanggil method push.

## Implementasi checklist
* Menambahkan widget Drawer yang berisi ListTile yang akan memanggil Navigator.pushreplacement() untuk navigasi ke halaman yang ada dalam aplikasi, yaitu counter, form, dan data ketika ListTile di tap
* Membuat file baru yaitu `form.dart`. Pada body, ditambahkan widget Form yang berisi beberapa fields. Terdapat TextFormField untuk input judul yang akan disimpan dalam variabel `_judul`. Kemudian, terdapat TextFormField kedua untuk input nominal yang isinya akan di parse menjadi integer dan disimpan dalam variabel `_nominal`. Terdapat juga DropdownButtonFormField untuk input tipe (pemasukan/pengeluaran) yang akan disimpan dalam variabel `_tipeValue`. Di bottomNavigationBar, diletakkan TextButton untuk menyimpan input.
* Membuat file baru yaitu `data.dart` dan membuat class Data yang akan membuat objek Data berisi judul, nominal, dan tipe. Saat TextButton untuk menyimpan input di tap, maka akan terbuat objek Data baru dan objek tersebut akan ditambahkan ke dalam list.
* Membuat class baru yaitu _DataListItem yang meng-extend Padding dan di dalamnya terdapat container yang berisi ListTile. Data berupa judul, nominal, dan tipe ditampilkan dalam ListTile
* Pada bagian body halaman data, terdapat ListView yang menampilkan objek _DataListItem untuk setiap data dalam list.
