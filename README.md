# Tugas 7
# Stateless Widget & Stateful Widget
Stateless Widget adalah widget yang tidak dapat dirubah atau tidak akan pernah berubah.
Stateful Widget adalah widget yang dapat berubah atau dinamis.
# Widget yang dipakai dalam Project ini
Widget utama yang dipakai dalam project ini ada 2, yaitu stateless dan stateful widget. Stateless widget
pada project ini digunakan untuk header dan navigation bar, sementara stateful widget digunakan
pada fungsi counter pada project. Selain dari widget yang sudah disebutkan sebelumnya, adapun widget-
widget lain yang dipakai dalam project ini, antara lain adalah:

- `MaterialApp`: Widget untuk membuat material komponen pada aplikasi.
- `Scaffold`: Widget untuk mengaplikasikan material komponen pada aplikasi dan menyediakan berbagai widget-widget yang berfungsi pada tampilan aplikasi.
- `Text`: Widget untuk menampilkan text.
- `AppBar`: Widget untuk memberikan bar di bagian atas tampilan aplikasi.
- `Center`: Widget untuk membuat child widget berada di tengah.
- `Column`: Widget untuk membuat susunan vertikal pada child widget.
- `Row`: Widget untuk membuat susunan secara horizontal pada child widget.
- `FloatingActionButton`: Widget untuk membuat button lingkaran yang melayang.
- `Visibility`: Widget untuk mengontrol child widget agar dapat dilihat atau tidak.
- `Padding`: Widget untuk memberikan sisipan pada child widget atau spasi pada child widget.
- `Icon`: Widget untuk membuat ikon pada aplikasi.
# Fungsi `setState()`
`setState()` berfungsi untuk merubah tampilan pada stateful widget.
# Perbedaan `const` dan `final`
`const` dan `final` memiliki fungsi yang tidak jauh berbeda. Perbedaan dari `const` dan `final` ada
pada saat pembuatan variabel yang dimana `const` hanya membuat variabel konstan hanya 
pada saat _compile-time_ sedangkan untuk `final`, _value_ dari variabel tidak bisa diubah sama sekali. 
# Cara Implementasi checklist
- Pertama-tama, buat aplikasi bernama `counter_7` dengan perintah seperti dibawah ini:
```
\> flutter create counter_7
```
- Kedua, menambahkan dua `FloatingActionButton` dengan  `tooltip` bernama `Increment` dan `Decrement` serta menambahkan icon `Icons.add` dan `Icons.remove`.

- Ketiga, tambahkan variabel `_visible` dan tambahkan widget `Visibility` yang didalamnya berisi `FloatingActionButton` untuk mengurangi angka dan set default value dari `_visible` dengan false.

- Keempat, pada `onPressed` yang berada pada `FloatingActionButton` atau FAB, tambahkan kondisi sebagai berikut:
Jika `tooltip` bernama `Increment` dan memiliki `Icons.add`, maka kondisinya seperti dibawah ini,
```
setState((){
    _counter++;
    _visible = true;
})
```
Sedangkan apabila `tooltip` bernama `Decrement` dan memiliki `Icons.remove`, maka kondisinya seperti dibawah ini,
```
if (_counter == 1) {
    setState(() {
        _visible = false;
        _counter = 0;
    });
    }
else if (_counter > 1) {
    setState(() {
        _counter--;
        _visible = true;
    });
}
```
- Kelima, membuat kondisional dengan ternary operator untuk merender text GANJIL atau GENAP sesuai angka dan mengganti warna text dengan `style`.

# Tugas 8

# Perbedaan `Navigator.push` dan `Navigator.pushReplacement`
`Navigator.push` berfungsi untuk menambahkan rute ke dalam stack, sedangkan `Navigator.pushReplacement` berfungsi untuk menambahkan route kedalam stack dan menghapus rute-rute sebelumnya.

# Widget apa saja yang dipakai dalam proyek kali ini
- `Drawer`: Berfungsi untuk membuat layar samping tambahan.
- `ListTile`: Berfungsi untuk menampilkan halaman-halaman yang ada pada aplikasi.

# Jenis-jenis event yang ada pada Flutter
- onPressed
- onHover
- onSaved
- onChange

# Cara kerja `Navigator` dalam "mengganti" halaman dari aplikasi Flutter
Halaman pada aplikasi Flutter disusun seperti stack yang saling menumpuk. Apabila seorang pengguna ingin beralih ke halaman lain, maka aplikasi akan menambahkan rute baru kedalam stack.

# Cara Implementasi
- Menambahkan `formbudget.dart` untuk pengisian form.
- Membuat file baru `model.dart` untuk menyimpan data-data dari `formbudget.dart` kedalam objek model.
- Membuat `budgetdata.dart` untuk menampilkan isi data dari form yang telah dibuat sebelumnya pada `formbudget.dart`.
- Membuat `drawer.dart` untuk menampilkan halaman apa saja yang ingin ditampilkan pada layar samping tambahan.

# Tugas 9

# Pengambilan data JSON tanpa membuat model terlebih dahulu
data JSON dapat dipangil tanpa membuat model terlebih dahulu dengan memasukan data JSON kedalam map. Pengambilan data JSON tanpa memakai model akan lebih sulit dalam memetakan data pada map.

# Widget apa saja yang dipakai dalam proyek ini
- `ListView.builder`: Membuat Array Widget ListTile.
- `FutureBuilder`: Membuat Widget secara otomatis menyesuaikan dengan interaksi `[Future]`.
- `TextButton`: Membuat Tombol Text.

# Mekanisme Pengambilan data dari JSON hingga menuju tampilan
Mengambil data dengan menggunakan `rootBundle` dan `loadString` melalui directory dari file JSON. Lalu, file JSON kemudian akan dibentuk sebagai objek dan disimpan didalam file model yang kemudian akan dipanggil oleh program untuk ditampilkan.

# Cara Implementasi
Membuat file Watchlist untuk menampilkan list judul film dan details.dart untuk menampilkan rincian film secara mendetail.