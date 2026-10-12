VHDL ve FPGA Geliştirme
Intel Quartus Prime ve QuestaSim kullanılarak geliştirilen sayısal mantık tasarımlarını, RTL mimarilerini ve testbench doğrulama süreçlerini içerir.

1-) 2 Girişli VE Kapısı 
IEEE 1164 kütüphanesi kullanılarak temel lojik seviyeler modelledim. Entity altında in_1 ve in_2 giriş, out_1 çıkış portları tanımlanmış; mimaride eşzamanlı sinyal atamasıyla VE mantığını yaptım. tb_and2 testbench dosyası ile tüm lojik kombinasyonlar  zaman gecikmeleriyle taradım ve QuestaSim üzerinde doğruladım.

2-) 8-Bit Aritmetik Toplama ve Eşik Karşılaştırıcı 
IEEE numeric_std kütüphanesi ve unsigned tip dönüşümleri kullanılarak 8-bitlik iki vektörün toplanmasını modelledim. Duyarlılık listeli process bloğu içinde donanımsal karşılaştırıcı tasarlanarak toplam değerinin 20 eşiğini aştığı durumlarda çıkış lojik 1 seviyesine çekilmiştir. Farklı toplama senaryoları ve sınır durumları tb_packages testbench dosyası ile QuestaSim ortamında simüle ederek doğruladım.
