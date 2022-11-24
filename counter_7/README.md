### Directory
`├──` [Tugas 7](#tugas-7)<br>
`├──` [Tugas 8](#tugas-8)<br>
`└──` [Tugas 9](#tugas-9)

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

# Tugas 9
## Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?
Sejatinya bisa-bisa saja, tetapi sangat jarang dilakukan. Tanpa membuat model terlebih dahulu, objek JSON tidak bisa kita akses sebagai objek dari suatu class yang telah kita define sendiri. Menurut saya, membuat model terlebih dahulu masih merupakan langkah terbaik.

## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
Selain widgets yang sudah disebutkan pada tugas 7 dan 8, widgets yang dipakai di proyek kali ini antara lain:
1. FutureBuilder: widget yang melakukan build berdasarkan snapshot interaksi terakhir dengan Future.
2. GestureDetector: widget yang mendeteksi gestur.
3. ListView: scrolling widget yang menampilkan childrennya secara berurutan menurut scroll direction.
4. Navigator: widget yang me-manage sejumlah child widgets dengan disiplin stack.

## Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.
1. Menambahkan dependency http dengan menambahkan http package menggunakan command `flutter pub add http`, kemudian memberikan akses internet ke dalam proyek yang sedang dibuat dengan menambahkan `<uses-permission android:name="android.permission.INTERNET" />` pada file `android/app/src/main/AndroidManifest.xml`
2. Membuat model dari data JSON yang ingin digunakan. Saya memanfaatkan https://app.quicktype.io/ untuk menuliskan code model Watchlist berdasarkan JSON yang sudah dimiliki dari proyek Django sebelumnya.
3. Dari halaman yang ingin menampilkan data, dipanggil fungsi (saya menggunakan fungsi terpisah bernama `fetchWatchlist()`) untuk membuat http request untuk GET dan mem-parse serta decode data JSON dan dibuat menjadi objek Watchlist.
4. List of watchlists yang dikembalikan dapat ditampilkan dengan widgets yang tersedia (saya menggunakan ListView.builder serta Container).

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
1. Menambahkan ListTile baru pada drawer yang akan memanggil `pushReplacement()` ke halaman `MyWatchlistPage`.
2. Membuat file `model/watchlist_item.dart`. Saya memanfaatkan https://app.quicktype.io/ untuk menuliskan code model Watchlist berdasarkan JSON yang sudah dimiliki dari proyek Django sebelumnya.
3. Membuat file `page/mywatchlist.dart` yang berisi halaman untuk menampilkan semua judul pada watchlist. Menggunakan FutureBuilder, future nya memanggil method `fetchwatchlist()` yang akan mem-parse dan meng-decode seluruh data pada url JSON yang diberikan dan mengembalikan List berisi objek-objek Watchlist yang dibuat berdasarkan data pada JSON. Menggunakan ListView.builder, judul tiap watchlist akan ditampilkan menjadi suatu container sendiri.
4. Menggunakan GestureDetector dan property onTap agar saat container suatu watchlist di tap, Navigator akan mem-push halaman `WatchlistDetail` yang akan menampilkan detail dari watchlist tersebut.
5. Membuat file `page/mywatchlist_detail.dart` yang menerima argumen `watchlistItem`. Halaman ini berisi StatelessWidget yang akan menampilkan judul, release date, rating, review, dan status dari watchlistItem tersebut.
6. Menambahkan FloatingActionButton berisi icon arrow back yang akan memanggil Navigator.pop untuk kembali ke halaman sebelumnya.
