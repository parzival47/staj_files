-- Öğrenciler tablosunu oluştur
CREATE TABLE Ogrenciler (
    ogrenci_id INT IDENTITY(1,1) PRIMARY KEY, 
    ad VARCHAR(50),
    soyad VARCHAR(50),
    ogrenci_numarasi VARCHAR(9) UNIQUE,
    bolum VARCHAR(100)
);

-- Dersler tablosunu oluştur
CREATE TABLE Dersler (
    ders_id INT IDENTITY(1,1) PRIMARY KEY, 
    ders_adi VARCHAR(100),
    ders_kodu VARCHAR(10) UNIQUE
);

-- Kayıtlar tablosunu oluştur
CREATE TABLE Kayitlar (
    kayit_id INT IDENTITY(1,1) PRIMARY KEY, 
    ogrenci_id INT,
    ders_id INT,
    notlar VARCHAR(2), 
    FOREIGN KEY (ogrenci_id) REFERENCES Ogrenciler(ogrenci_id) ON DELETE CASCADE,
    FOREIGN KEY (ders_id) REFERENCES Dersler(ders_id)
);

-- Öğrenciler tablosuna veri ekle
INSERT INTO Ogrenciler (ad, soyad, ogrenci_numarasi, bolum) VALUES
('Ahmet', 'Yılmaz', '230206001', 'Bilgisayar Mühendisliği'),
('Ayşe', 'Kara', '230206002', 'Elektrik-Elektronik Mühendisliği'),
('Mehmet', 'Aydın', '230206003', 'Makine Mühendisliği'),
('Fatma', 'Ekinci', '230206004', 'İnşaat Mühendisliği'),
('Hasan', 'Şahin', '230206005', 'Endüstri Mühendisliği');

-- Dersler tablosuna veri ekle
INSERT INTO Dersler (ders_adi, ders_kodu) VALUES
('Matematik', 'MAT101'),
('Fizik', 'FZK101'),
('Kimya', 'KMY101'),
('Programlama', 'CSE101'),
('Mühendislik Etiği', 'MÜH101');

-- Kayıtlar tablosuna veri ekle (notlar harfli)
INSERT INTO Kayitlar (ogrenci_id, ders_id, notlar) VALUES
(1, 1, 'B'),
(1, 4, 'A'),
(2, 1, 'C'),
(2, 2, 'B'),
(3, 3, 'C+'),
(4, 2, 'D'),
(5, 5, 'A');

-- Yeni öğrenci ekleme
INSERT INTO Ogrenciler (ad, soyad, ogrenci_numarasi, bolum) VALUES
('Zeynep', 'Aslan', '230206006', 'Mimarlık');

-- Öğrenci numarasına göre veri silme
DELETE FROM Ogrenciler WHERE ogrenci_numarasi = '230206003';


-- Tüm öğrencilerin, derslerin ve notların listesi
SELECT 
    O.ad, 
    O.soyad, 
    O.ogrenci_numarasi, 
    D.ders_adi, 
    D.ders_kodu, 
    K.notlar
FROM 
    Kayitlar K
JOIN 
    Ogrenciler O ON K.ogrenci_id = O.ogrenci_id
JOIN 
    Dersler D ON K.ders_id = D.ders_id;
