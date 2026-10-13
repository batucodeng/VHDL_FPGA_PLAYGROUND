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
