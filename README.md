# SQL Yolculuğu

Başlangıç seviyesinde Türkçe SQL eğitim sitesi. 9 aşamalı, birbirini açan dersler; gerçek SQLite sorguları; ipuçları; otomatik sonuç kontrolü; tarayıcıda ilerleme kaydı.

## GitHub Pages ile yayınlama

1. GitHub'da **sql-yolculugu** adlı **Public** depo oluştur.
2. Bu klasördeki `index.html`, `style.css`, `app.js` dosyalarını deponun kök dizinine yükle (README isteğe bağlı).
3. Depoda **Settings → Pages → Build and deployment → Deploy from a branch** seç.
4. **Branch: main / (root)** seçip **Save** de.
5. Birkaç dakika sonra `https://KULLANICI_ADIN.github.io/sql-yolculugu/` adresi açılır.

## Yerelde çalıştırma

Dosyaların olduğu klasörde `python -m http.server 8000` çalıştır ve tarayıcıda `http://localhost:8000` aç. Python kurulu değilse VS Code Live Server kullanabilirsin.

## Teknik notlar

- Statik HTML/CSS/JS; derleme ve ücretli hosting gerekmez.
- SQLite, sql.js WebAssembly aracılığıyla **tarayıcı içinde** çalışır; eğitim verileri gerçek müşteri verileri değildir.
- İlk açılışta sql.js ve font dosyaları CDN'den indirilir; internet bağlantısı gerekir.
- İlerleme `localStorage` ile cihaz/tarayıcı bazında saklanır; cihazlar arasında eşitlenmez.
- Sadece SELECT/CTE türü sorgulara izin veren temel istemci tarafı filtre bulunur. Bu filtre **güvenlik sınırı değildir**; uygulamada gerçek sunucu ve gizli veri bulunmadığından amaç yanlışlıkla veriyi değiştirmemektir. Her sorgu öncesi veritabanı sıfırlanır.
- Bu ilk sürümde 9 ders bulunur. Sonraki sürümde yeni dersler, görsel açıklamalar ve kişiselleştirme eklenebilir.

## Eğitim Kütüphanesi güncellemesi
- `egitim.html` ve `egitim.js` dosyaları eklendi.
- Ana sayfaya eğitim kütüphanesine geçiş ve Denel'in ilerleme özeti eklendi.
- İlerleme aynı tarayıcıdaki mevcut `sql-yolculugu-v1` kaydından okunur.
- URL sonundaki `?utm_source=chatgpt.com` bir takip parametresidir; site adresi bu parametre olmadan paylaşılabilir.
