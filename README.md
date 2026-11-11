# SQL Yolculuğu — V3

Denel için 12 haftalık, Türkçe SQL eğitim sitesi. GitHub Pages ile yayınlanır.

## Sayfalar
- `hikaye.html`: Karşılama ve hikâye
- `yol-haritasi.html`: 12 haftalık eğitim ve final proje planı
- `index.html`: 1 hikâye görevi + 30 SQL alıştırması + 3 değerlendirme
- `egitim.html`: Etkileşimli konu kütüphanesi

## Yayınlama
ZIP içindeki dosyaları GitHub deposunun ana dizinine yükleyin. Settings > Pages > Deploy from branch > main / (root).

## Teknik notlar
- SQL motoru: sql.js / SQLite WebAssembly (CDN); internet gerekir.
- İlerleme: tarayıcı localStorage, cihazlar arasında senkronize olmaz.
- Eski v1 tamamlanan 9 ders, v3'e ilk açılışta taşınır.
- SQL kontrolü sorgu sonucuna göre yapılır. Sunucuya kullanıcı sorgusu gönderilmez.
- Eğitim veri tabanı her sorguda sıfırlanır.
- SQL temelini öğretir; MSSQL/PostgreSQL/SAP HANA'nın tamamını öğretmez.
