# CineGo — UAS Pemrograman Mobile

## Struktur Folder
```
lib/
├── models/
│   └── models.dart          # Movie, Cinema, Ticket — JANGAN diubah sendiri tanpa koordinasi
├── data/
│   └── dummy_data.dart      # Data statis bersama, dipakai semua halaman
├── screens/
│   ├── onboarding/          # Orang 1
│   ├── auth/                # Orang 1 (login.dart, register.dart)
│   ├── profile/             # Orang 1 (profile.dart)
│   ├── home/                # Orang 2 (home.dart, tab_movie_list.dart)
│   ├── detail/              # Orang 2 & 3 (detail_movie.dart, detail_cinema.dart)
│   └── transaction/         # Orang 3 (buy_ticket_sheet.dart, history.dart)
├── widgets/                 # komponen reusable (movie_card.dart, cinema_card.dart, dll)
└── main.dart
```

## Pembagian Tugas

| Orang | File yang dikerjakan | Halaman |
|---|---|---|
| 1 | `screens/onboarding/`, `screens/auth/login.dart`, `screens/auth/register.dart`, `screens/profile/profile.dart` | OnBoarding, Login, Registrasi, Profil |
| 2 | `screens/home/home.dart`, `screens/detail/detail_movie.dart` | Beranda (tab Movie), Detail Movie + list Cinema |
| 3 | `screens/home/tab_cinema_list.dart`, `screens/detail/detail_cinema.dart`, `screens/transaction/buy_ticket_sheet.dart`, `screens/transaction/history.dart` | List Cinema, Detail Cinema + list Movie, BottomSheet Beli Tiket, Riwayat |

## Aturan Kerja
1. **Jangan edit `models/models.dart` atau `data/dummy_data.dart` sendirian.** Kalau perlu field/data tambahan, diskusikan dulu di grup, lalu satu orang yang update lalu push.
2. Setiap orang kerja di branch sendiri: `git checkout -b nama-fitur`, misal `git checkout -b orang2-home-detail-movie`.
3. Passing data antar halaman pakai constructor parameter, contoh:
   ```dart
   Navigator.push(
     context,
     MaterialPageRoute(
       builder: (context) => DetailMovieScreen(movie: selectedMovie),
     ),
   );
   ```
4. Sebelum merge ke `main`, pastikan `flutter run` jalan tanpa error di HP/emulator masing-masing.
5. Hasil desain Stitch: convert ke widget Flutter manual (copy struktur/style-nya), jangan asal tempel kode HTML dari Stitch.

## Urutan Kerja (Timeline)
1. Hari 1: Setup repo ini + generate UI di Stitch (prompt sudah disiapkan)
2. Hari 2-3: Convert UI ke widget Flutter, pasang dummy data statis
3. Hari 3: Pasang Navigator + argument passing
4. Hari 4: Merge semua branch, testing `flutter run`, push final ke GitHub
