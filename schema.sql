BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "Konu" (
	"KonuID"	INTEGER,
	"Konu"	TEXT,
	PRIMARY KEY("KonuID" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Kutuphane" (
	"KitapID"	INTEGER NOT NULL,
	"YazarID"	INTEGER,
	"KitapAdi"	TEXT,
	"YayinEviID"	INTEGER,
	"SayfaSayisi"	INTEGER,
	"KonuID"	INTEGER,
	PRIMARY KEY("KitapID" AUTOINCREMENT),
	FOREIGN KEY("KonuID") REFERENCES "Konu"("KonuID"),
	FOREIGN KEY("YayinEviID") REFERENCES "YayinEvi"("YayinEviID"),
	FOREIGN KEY("YazarID") REFERENCES "Yazar"("YazarID")
);
CREATE TABLE IF NOT EXISTS "YayinEvi" (
	"YayinEviID"	INTEGER,
	"YayinEvi"	TEXT,
	PRIMARY KEY("YayinEviID" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Yazar" (
	"YazarID"	INTEGER,
	"YazarAdi"	TEXT,
	"YazarSoyadi"	TEXT,
	"DogumTarihi"	TEXT,
	"OlumTarihi"	TEXT,
	"DogumYeri"	TEXT,
	PRIMARY KEY("YazarID" AUTOINCREMENT)
);
INSERT INTO "Konu" VALUES (1,'Psikolojik Roman');
INSERT INTO "Konu" VALUES (2,'Distopya');
INSERT INTO "Konu" VALUES (3,'Toplumsal Gerçekçilik');
INSERT INTO "Konu" VALUES (4,'Tarihi Roman');
INSERT INTO "Konu" VALUES (5,'Felsefi Roman');
INSERT INTO "Konu" VALUES (6,'Modern Klasik');
INSERT INTO "Konu" VALUES (7,'Biyografi & Anı');
INSERT INTO "Konu" VALUES (8,'Aşk & Dram');
INSERT INTO "Kutuphane" VALUES (1,1,'Kürk Mantolu Madonna',1,160,8);
INSERT INTO "Kutuphane" VALUES (2,1,'Kuyucaklı Yusuf',1,221,3);
INSERT INTO "Kutuphane" VALUES (3,1,'İçimizdeki Şeytan',1,268,1);
INSERT INTO "Kutuphane" VALUES (4,1,'Değirmen',1,132,3);
INSERT INTO "Kutuphane" VALUES (5,1,'Kağnı',1,110,3);
INSERT INTO "Kutuphane" VALUES (6,1,'Ses',1,104,3);
INSERT INTO "Kutuphane" VALUES (7,1,'Yeni Dünya',1,120,3);
INSERT INTO "Kutuphane" VALUES (8,1,'Sırça Köşk',1,144,3);
INSERT INTO "Kutuphane" VALUES (9,2,'Suç ve Ceza',5,687,1);
INSERT INTO "Kutuphane" VALUES (10,2,'Karamazov Kardeşler',5,1050,5);
INSERT INTO "Kutuphane" VALUES (11,2,'Beyaz Geceler',5,112,8);
INSERT INTO "Kutuphane" VALUES (12,2,'Yeraltından Notlar',5,140,5);
INSERT INTO "Kutuphane" VALUES (13,2,'Kumarbaz',5,184,1);
INSERT INTO "Kutuphane" VALUES (14,2,'Budala',5,752,1);
INSERT INTO "Kutuphane" VALUES (15,2,'Ecinniler',5,832,5);
INSERT INTO "Kutuphane" VALUES (16,2,'Ölüler Evinden Anılar',5,320,7);
INSERT INTO "Kutuphane" VALUES (17,2,'İnsancıklar',5,168,3);
INSERT INTO "Kutuphane" VALUES (18,2,'Öteki',5,176,1);
INSERT INTO "Kutuphane" VALUES (19,3,'Saatleri Ayarlama Enstitüsü',4,382,3);
INSERT INTO "Kutuphane" VALUES (20,3,'Huzur',4,418,1);
INSERT INTO "Kutuphane" VALUES (21,3,'Sahnenin Dışındakiler',4,368,4);
INSERT INTO "Kutuphane" VALUES (22,3,'Mahur Beste',4,184,4);
INSERT INTO "Kutuphane" VALUES (23,3,'Beş Şehir',4,240,7);
INSERT INTO "Kutuphane" VALUES (24,3,'Aydaki Kadın',4,328,1);
INSERT INTO "Kutuphane" VALUES (25,4,'1984',3,352,2);
INSERT INTO "Kutuphane" VALUES (26,4,'Hayvan Çiftliği',3,152,2);
INSERT INTO "Kutuphane" VALUES (27,4,'Paris ve Londra''da Beş Parasız',3,224,7);
INSERT INTO "Kutuphane" VALUES (28,4,'Wigan İskelesi Yolu',3,240,3);
INSERT INTO "Kutuphane" VALUES (29,4,'Katalonya''ya Selam',3,280,7);
INSERT INTO "Kutuphane" VALUES (30,4,'Boğulmamak İçin',3,256,6);
INSERT INTO "Kutuphane" VALUES (31,4,'Papazın Kızı',3,320,3);
INSERT INTO "Kutuphane" VALUES (32,5,'Sinekli Bakkal',3,496,4);
INSERT INTO "Kutuphane" VALUES (33,5,'Ateşten Gömlek',3,224,4);
INSERT INTO "Kutuphane" VALUES (34,5,'Vurun Kahpeye',3,176,4);
INSERT INTO "Kutuphane" VALUES (35,5,'Handan',3,208,8);
INSERT INTO "Kutuphane" VALUES (36,5,'Mor Salkımlı Ev',3,320,7);
INSERT INTO "Kutuphane" VALUES (37,5,'Türkün Ateşle İmtihanı',3,304,7);
INSERT INTO "Kutuphane" VALUES (38,5,'Tatarcık',3,240,3);
INSERT INTO "Kutuphane" VALUES (39,6,'İnce Memed 1',1,436,3);
INSERT INTO "Kutuphane" VALUES (40,6,'İnce Memed 2',1,464,3);
INSERT INTO "Kutuphane" VALUES (41,6,'İnce Memed 3',1,632,3);
INSERT INTO "Kutuphane" VALUES (42,6,'İnce Memed 4',1,608,3);
INSERT INTO "Kutuphane" VALUES (43,6,'Yer Demir Gök Bakır',1,384,3);
INSERT INTO "Kutuphane" VALUES (44,6,'Ortadirek',1,416,3);
INSERT INTO "Kutuphane" VALUES (45,6,'Ölmez Otu',1,352,3);
INSERT INTO "Kutuphane" VALUES (46,6,'Demirciler Çarşısı Cinayeti',1,544,3);
INSERT INTO "Kutuphane" VALUES (47,6,'Yılanı Öldürseler',1,128,3);
INSERT INTO "Kutuphane" VALUES (48,6,'Kuşlar da Gitti',1,88,3);
INSERT INTO "Kutuphane" VALUES (49,7,'Tutunamayanlar',2,724,6);
INSERT INTO "Kutuphane" VALUES (50,7,'Tehlikeli Oyunlar',2,480,6);
INSERT INTO "Kutuphane" VALUES (51,7,'Bir Bilim Adamının Romanı',2,288,7);
INSERT INTO "Kutuphane" VALUES (52,7,'Korkuyu Beklerken',2,200,1);
INSERT INTO "Kutuphane" VALUES (53,7,'Oyunlarla Yaşayanlar',2,144,6);
INSERT INTO "Kutuphane" VALUES (54,7,'Günlük',2,352,7);
INSERT INTO "Kutuphane" VALUES (55,8,'Dönüşüm',5,104,5);
INSERT INTO "Kutuphane" VALUES (56,8,'Dava',5,248,5);
INSERT INTO "Kutuphane" VALUES (57,8,'Şato',5,384,5);
INSERT INTO "Kutuphane" VALUES (58,8,'Babaya Mektup',5,80,7);
INSERT INTO "Kutuphane" VALUES (59,8,'Ceza Sömürgesi',5,72,5);
INSERT INTO "Kutuphane" VALUES (60,8,'Amerika',5,312,6);
INSERT INTO "Kutuphane" VALUES (61,8,'Aforizmalar',5,96,5);
INSERT INTO "Kutuphane" VALUES (62,9,'Satranç',5,80,1);
INSERT INTO "Kutuphane" VALUES (63,9,'Bilinmeyen Bir Kadının Mektubu',5,64,8);
INSERT INTO "Kutuphane" VALUES (64,9,'Olağanüstü Bir Gece',5,88,1);
INSERT INTO "Kutuphane" VALUES (65,9,'Korku',5,80,1);
INSERT INTO "Kutuphane" VALUES (66,9,'Amok Koşucusu',5,96,1);
INSERT INTO "Kutuphane" VALUES (67,9,'Bir Kadının Yaşamından 24 Saat',5,96,8);
INSERT INTO "Kutuphane" VALUES (68,9,'Mecburiyet',5,64,1);
INSERT INTO "Kutuphane" VALUES (69,9,'Yakıcı Sır',5,104,1);
INSERT INTO "Kutuphane" VALUES (70,9,'Gömülü Şamdan',5,120,4);
INSERT INTO "Kutuphane" VALUES (71,10,'Masumiyet Müzesi',1,592,8);
INSERT INTO "Kutuphane" VALUES (72,10,'Benim Adım Kırmızı',1,544,4);
INSERT INTO "Kutuphane" VALUES (73,10,'Kar',1,464,6);
INSERT INTO "Kutuphane" VALUES (74,10,'Kara Kitap',1,488,6);
INSERT INTO "Kutuphane" VALUES (75,10,'Kırmızı Saçlı Kadın',1,204,8);
INSERT INTO "Kutuphane" VALUES (76,10,'Cevdet Bey ve Oğulları',1,608,4);
INSERT INTO "Kutuphane" VALUES (77,10,'Yeni Hayat',1,280,6);
INSERT INTO "Kutuphane" VALUES (78,11,'Yabancı',3,112,5);
INSERT INTO "Kutuphane" VALUES (79,11,'Veba',3,304,5);
INSERT INTO "Kutuphane" VALUES (80,11,'Düşüş',3,104,5);
INSERT INTO "Kutuphane" VALUES (81,11,'Sisifos Söyleni',3,160,5);
INSERT INTO "Kutuphane" VALUES (82,11,'Başkaldıran İnsan',3,368,5);
INSERT INTO "Kutuphane" VALUES (83,12,'Dokuzuncu Hariciye Koğuşu',7,112,1);
INSERT INTO "Kutuphane" VALUES (84,12,'Fatih-Harbiye',7,136,3);
INSERT INTO "Kutuphane" VALUES (85,12,'Yalnızız',7,384,1);
INSERT INTO "Kutuphane" VALUES (86,12,'Matmazel Noraliya''nın Koltuğu',7,312,1);
INSERT INTO "Kutuphane" VALUES (87,12,'Bir Tereddüdün Romanı',7,208,1);
INSERT INTO "Kutuphane" VALUES (88,12,'Sözde Kızlar',7,224,3);
INSERT INTO "Kutuphane" VALUES (89,13,'Savaş ve Barış',5,1225,4);
INSERT INTO "Kutuphane" VALUES (90,13,'Anna Karenina',5,1064,8);
INSERT INTO "Kutuphane" VALUES (91,13,'İnsan Ne İle Yaşar?',5,96,5);
INSERT INTO "Kutuphane" VALUES (92,13,'İvan İlyiç''in Ölümü',5,88,5);
INSERT INTO "Kutuphane" VALUES (93,13,'Diriliş',5,560,3);
INSERT INTO "Kutuphane" VALUES (94,13,'Hacı Murat',5,160,4);
INSERT INTO "Kutuphane" VALUES (95,13,'Kreutzer Sonat',5,120,1);
INSERT INTO "Kutuphane" VALUES (96,14,'Kendine Ait Bir Oda',8,128,5);
INSERT INTO "Kutuphane" VALUES (97,14,'Mrs. Dalloway',8,216,6);
INSERT INTO "Kutuphane" VALUES (98,14,'Deniz Feneri',8,248,6);
INSERT INTO "Kutuphane" VALUES (99,14,'Orlando',8,296,6);
INSERT INTO "Kutuphane" VALUES (100,14,'Dalgalar',8,264,6);
INSERT INTO "Kutuphane" VALUES (101,15,'Çalıkuşu',6,544,8);
INSERT INTO "Kutuphane" VALUES (102,15,'Acımak',6,160,3);
INSERT INTO "Kutuphane" VALUES (103,15,'Yaprak Dökümü',6,160,3);
INSERT INTO "Kutuphane" VALUES (104,15,'Dudaktan Kalbe',6,352,8);
INSERT INTO "Kutuphane" VALUES (105,15,'Akşam Güneşi',6,288,8);
INSERT INTO "Kutuphane" VALUES (106,15,'Yeşil Gece',6,224,4);
INSERT INTO "YayinEvi" VALUES (1,'Yapı Kredi Yayınları');
INSERT INTO "YayinEvi" VALUES (2,'İletişim Yayınları');
INSERT INTO "YayinEvi" VALUES (3,'Can Yayınları');
INSERT INTO "YayinEvi" VALUES (4,'Dergâh Yayınları');
INSERT INTO "YayinEvi" VALUES (5,'Türkiye İş Bankası Kültür Yayınları');
INSERT INTO "YayinEvi" VALUES (6,'Everest Yayınları');
INSERT INTO "YayinEvi" VALUES (7,'Ötüken Neşriyat');
INSERT INTO "YayinEvi" VALUES (8,'İthaki Yayınları');
INSERT INTO "Yazar" VALUES (1,'Sabahattin','Ali','1907-02-25','1948-04-02','Eğridere');
INSERT INTO "Yazar" VALUES (2,'Fyodor','Dostoyevski','1821-11-11','1881-02-09','Moskova');
INSERT INTO "Yazar" VALUES (3,'Ahmet Hamdi','Tanpınar','1901-06-23','1962-01-24','İstanbul');
INSERT INTO "Yazar" VALUES (4,'George','Orwell','1903-06-25','1950-01-21','Motihari');
INSERT INTO "Yazar" VALUES (5,'Halide Edib','Adıvar','1884-06-11','1964-01-09','İstanbul');
INSERT INTO "Yazar" VALUES (6,'Yaşar','Kemal','1923-10-06','2015-02-28','Osmaniye');
INSERT INTO "Yazar" VALUES (7,'Oğuz','Atay','1934-10-12','1977-12-13','Kastamonu');
INSERT INTO "Yazar" VALUES (8,'Franz','Kafka','1883-07-03','1924-06-03','Prag');
INSERT INTO "Yazar" VALUES (9,'Stefan','Zweig','1881-11-28','1942-02-22','Viyana');
INSERT INTO "Yazar" VALUES (10,'Orhan','Pamuk','1952-06-07',NULL,'İstanbul');
INSERT INTO "Yazar" VALUES (11,'Albert','Camus','1913-11-07','1960-01-04','Dréan');
INSERT INTO "Yazar" VALUES (12,'Peyami','Safa','1899-04-02','1961-06-15','İstanbul');
INSERT INTO "Yazar" VALUES (13,'Lev','Tolstoy','1828-09-09','1910-11-20','Yasnaya Polyana');
INSERT INTO "Yazar" VALUES (14,'Virginia','Woolf','1882-01-25','1941-03-28','Londra');
INSERT INTO "Yazar" VALUES (15,'Reşat Nuri','Güntekin','1889-11-25','1956-12-07','İstanbul');
INSERT INTO "Yazar" VALUES (16,'Sabahattin','Ali','1907-02-25','1948-04-02','Eğridere');
INSERT INTO "Yazar" VALUES (17,'Fyodor','Dostoyevski','1821-11-11','1881-02-09','Moskova');
INSERT INTO "Yazar" VALUES (18,'Ahmet Hamdi','Tanpınar','1901-06-23','1962-01-24','İstanbul');
INSERT INTO "Yazar" VALUES (19,'George','Orwell','1903-06-25','1950-01-21','Motihari');
INSERT INTO "Yazar" VALUES (20,'Halide Edib','Adıvar','1884-06-11','1964-01-09','İstanbul');
INSERT INTO "Yazar" VALUES (21,'Yaşar','Kemal','1923-10-06','2015-02-28','Osmaniye');
INSERT INTO "Yazar" VALUES (22,'Oğuz','Atay','1934-10-12','1977-12-13','Kastamonu');
INSERT INTO "Yazar" VALUES (23,'Franz','Kafka','1883-07-03','1924-06-03','Prag');
INSERT INTO "Yazar" VALUES (24,'Stefan','Zweig','1881-11-28','1942-02-22','Viyana');
INSERT INTO "Yazar" VALUES (25,'Orhan','Pamuk','1952-06-07',NULL,'İstanbul');
INSERT INTO "Yazar" VALUES (26,'Albert','Camus','1913-11-07','1960-01-04','Dréan');
INSERT INTO "Yazar" VALUES (27,'Peyami','Safa','1899-04-02','1961-06-15','İstanbul');
INSERT INTO "Yazar" VALUES (28,'Lev','Tolstoy','1828-09-09','1910-11-20','Yasnaya Polyana');
INSERT INTO "Yazar" VALUES (29,'Virginia','Woolf','1882-01-25','1941-03-28','Londra');
INSERT INTO "Yazar" VALUES (30,'Reşat Nuri','Güntekin','1889-11-25','1956-12-07','İstanbul');
COMMIT;
