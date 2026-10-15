VHDL ve FPGA Geliştirme
Intel Quartus Prime ve QuestaSim kullanılarak geliştirilen sayısal mantık tasarımlarını, RTL mimarilerini ve testbench doğrulama süreçlerini içerir.

1-) 2 Girişli VE Kapısı 
IEEE 1164 kütüphanesi kullanılarak temel lojik seviyeler modelledim. Entity altında in_1 ve in_2 giriş, out_1 çıkış portları tanımlanmış; mimaride eşzamanlı sinyal atamasıyla VE mantığını yaptım. tb_and2 testbench dosyası ile tüm lojik kombinasyonlar  zaman gecikmeleriyle taradım ve QuestaSim üzerinde doğruladım.

2-) 8-Bit Aritmetik Toplama ve Eşik Karşılaştırıcı 
IEEE numeric_std kütüphanesi ve unsigned tip dönüşümleri kullanılarak 8-bitlik iki vektörün toplanmasını modelledim. Duyarlılık listeli process bloğu içinde donanımsal karşılaştırıcı tasarlanarak toplam değerinin 20 eşiğini aştığı durumlarda çıkış lojik 1 seviyesine çekilmiştir. Farklı toplama senaryoları ve sınır durumları tb_packages testbench dosyası ile QuestaSim ortamında simüle ederek doğruladım.

3-) Modern IEEE Standardı ile 8-Bit Toplayıcı ve Eşik Karşılaştırıcı
İkinci örnekte kullanılan eski Synopsys paketleri (std_logic_arith, std_logic_unsigned yerine endüstri standardı olan IEEE.NUMERIC_STD kütüphanesine geçiş yapılmıştır.

4-) Asenkron Resetli D-Flip Flop
Hassasiyet Listesi : process(clk, rst) kullanılarak bloğun sadece saat veya reset sinyallerindeki değişimlerde tetiklenmesi sağlanmıştır; veri girişi data_in saatten bağımsız olarak çıkışı doğrudan etkilemez.
Asenkron Reset:if (rst = '1') kontrolü en başa konularak, reset aktif olduğunda saat darbesi beklenmeksizin data_out anında lojik 0 seviyesine çekilir.
Senkron Veri Yakalama:Devre normal çalışma modundayken rst = '0', giriş verisi yalnızca saatin yükselen kenarında rising_edge(clk) çıkışa aktarılır ve bir sonraki kenara kadar saklanır.
Testbench Simülasyonu:Testbench içerisinde 50 MHz (20 ns periyot) osilatörü simüle eden bağımsız bir saat üreteci koşturulmuş; resetin ve saat kenarlarının veri aktarımına etkisi simüle edilmiştir.
Simülasyon Dalga Formu
FPGA_EXAMPLE_4_WAVE_PHO.png

5-) Senkron 4-Bit Yukarı Sayaç
Açıklama: numeric_std kütüphanesi ve unsigned veri tipi kullanılarak asenkron sıfırlama rst ve etkinleştirme en girişlerine sahip 4-bit senkron yukarı sayaç tasarlanmıştır.
Aritmetik İşlemler: std_logic_vector üzerinde doğrudan toplama yapılamayacağı için tasarım içinde unsigned(3 downto 0) ara sinyali r_count tanımlanmış ve çıkışta tip dönüşümü std_logic_vector yapılmıştır.
Taşma (Overflow): 4-bit sayacın alabileceği maksimum değer olan 15 1111 aşıldığında sistem taşma üreterek otomatik olarak 0 0000 değerine geri döner.
Simülasyon Dalga Formu
project_05_wave_pho.png

6-) Parametrik Frekans Bolucu
Aciklama: Giris saat frekansini disaridan belirlenen bir bolme oranina gore yavaslatan generic tabanli saat bolucu devresi tasarlanmistir.
Generic yapisi kullanilarak DIVISOR sabiti disaridan degistirilebilir sekilde tanimlanmistir. Asenkron reset sinyali ile saat beklenmeden sayac ve cikis sifirlanabilmektedir.
Simulasyon Dalga Formu
project_06_pho.png

7-) Seri Girisli Paralel Cikisli Kaydirmali Kaydedici
Aciklama: Seri gelen tek bitlik veriyi her saat kenarinda iceriye kaydirip 4-bitlik paralel cikis paketine donusturen SIPO (Serial-In Parallel-Out) kaydirmali kaydedici devresi tasarlanmistir.
Onemli Noktalar ve Mimari Detaylar:
Bit kaydirma islemi VHDL birlestirme operatoru kullanilarak r_shift <= r_shift(2 downto 0) & serial_in seklinde gerceklenmistir.
shift_en girisi ile kaydirma islemi kontrol edilmis, izin verilmediginde son veri register icinde korunmustur.
Asenkron reset hatti ile saat darbesi beklenmeksizin tum register icerigi sifirlanabilmektedir.
Donanim, UART veya SPI gibi seri iletisim protokollerinin alici (RX) temel mantigini olusturmaktadir.
Simulasyon Dalga Formu
project_07_pho.png

8-) Trafik Isigi Sonlu Durum Makinesi - FSM 
Aciklama: Uc durumlu (RED, YELLOW, GREEN) trafik isigi kontrolunu gerceklestiren 2 surecli (two-process) sonlu durum makinesi (Finite State Machine - FSM) devresi tasarlanmistir.
Onemli Noktalar ve Mimari Detaylar:
Senkron surec (state_reg) durum register'ini saat kenarinda guncellerken, kombinezonsal surec (comb_logic) bir sonraki durumu ve cikis LED'lerini belirlemistir.
Asenkron reset hatti test edilerek sistemin calisma esnasinda aninda guvenli baslangic durumu olan RED seviyesine donebildigi dogrulanmistir.
Simulasyon Dalga Formu
project_8_pho.png
