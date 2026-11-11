# SQL Yolculuğu V9 — Supabase kurulumu

1. Supabase projesinin SQL Editor ekranında `supabase-setup.sql` dosyasının tamamını **bir kez** çalıştırın. Bu işlem `learning_state` ve `gifts` tablolarını ve kullanıcı bazlı RLS politikalarını oluşturur.
2. Authentication > Users altında önceden oluşturduğunuz iki hesabın e-posta değerleri `denelsertel@sql-yolculugu.invalid` ve `aycelen@sql-yolculugu.invalid` olmalı. Her iki kullanıcı için Supabase Auth'ta belirlediğiniz **gerçek şifre** kullanılır. Kodda şifre bulunmaz.
3. `cloud.js` dosyasındaki `CLOUD_URL` değerini Supabase Dashboard > Project Settings > Data API altında gördüğünüz **Project URL** ile karşılaştırın. Publishable key tanımlıdır. **Secret/service_role anahtarı asla yüklemeyin.**
4. ZIP içindeki dosyaları GitHub Pages deponuzun kök dizinine yükleyin. `supabase-setup.sql` dosyasının GitHub'a yüklenmesi zorunlu değildir; önce SQL Editor'da çalıştırılması yeterli.
5. Denel ve Ayçelen ile giriş yapıp her biri için ders tamamlayın. Diğer cihazdan aynı hesapla giriş yapıp ilerlemeyi kontrol edin. Excel çalışması oluşturup diğer cihazda açın. Hediyeyi diğer profile gönderip alıcı hesabında açın.

**Önemli:** Önceki V8 sürümünde tarayıcıya kaydedilmiş ilerleme, V9'a **aynı tarayıcı ve aynı profil** ile giriş yapıldığında buluta aktarılır. Önce her profilin eski ilerlemesinin bulunduğu cihazdan giriş yapın. Eski tarayıcı verilerini silmeyin. Excel için yerel/bulut kayıt çakışmasında seçim sorulur. İnternet yokken yerel düzenleme yapılabilir ama senkronizasyon garanti edilmez. Başka cihazda eşzamanlı düzenleme çakışabilir. Bu, gerçek zamanlı ortak Excel editörü değildir.

**Güvenlik:** Publishable key halka açıktır; veri erişimini RLS kısıtlar. Kullanıcı adı tek başına oturum açmaz, şifre gerekir. Kullanıcılar Supabase Auth'ta oluşturulmalıdır. Gerçek e-posta gerekmiyor, ancak `.invalid` uzantılı adreslere parola sıfırlama e-postası gönderilemez. Şifreleri güvenli saklayın. GitHub Pages yalnızca statik dosya barındırır.
