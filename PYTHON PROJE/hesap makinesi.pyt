# Toplama işlemi
def toplama(x, y):
    return x + y

# Çıkarma işlemi
def cikarma(x, y):
    return x - y

# Çarpma işlemi
def carpma(x, y):
    return x * y

# Bölme işlemi
def bolme(x, y):
    if y == 0:
        return "Hata: Sıfıra bölme yapılamaz!"
    return x / y

def hesap_makinesi():
    print("Yapmak istediğiniz işlemi seçin:")
    print("1. Toplama")
    print("2. Çıkarma")
    print("3. Çarpma")
    print("4. Bölme")

    # Kullanıcıdan işlem seçimi ve sayıların alınması
    secim = input("Seçiminizi yapın (1/2/3/4): ")

    # Geçersiz işlem seçimini kontrol etme
    if secim not in ['1', '2', '3', '4']:
        print("Hatalı seçim yaptınız. Lütfen tekrar deneyin.")
        return

    sayi1 = float(input("Birinci sayıyı girin: "))
    sayi2 = float(input("İkinci sayıyı girin: "))

    # Seçime göre ilgili işlemi yapma
    if secim == '1':
        print(f"Sonuç: {sayi1} + {sayi2} = {toplama(sayi1, sayi2)}")
    elif secim == '2':
        print(f"Sonuç: {sayi1} - {sayi2} = {cikarma(sayi1, sayi2)}")
    elif secim == '3':
        print(f"Sonuç: {sayi1} * {sayi2} = {carpma(sayi1, sayi2)}")
    elif secim == '4':
        print(f"Sonuç: {sayi1} / {sayi2} = {bolme(sayi1, sayi2)}")

# Hesap makinesini çalıştır
hesap_makinesi()