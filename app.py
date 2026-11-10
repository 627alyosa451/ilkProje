import os
import shutil
import sqlite3
from flask import Flask, render_template

app = Flask(__name__)
app.secret_key = os.environ.get("SECRET_KEY", "yerel-gelistirme-anahtari")

# Rehberdeki Bilgisayar + Vercel uyumlu veritabanı bağlantı ayarı[cite: 8, 9]
KLASOR = os.path.dirname(os.path.abspath(__file__))
KAYNAK_DB = os.path.join(KLASOR, "veritabani.db")

if os.access(KLASOR, os.W_OK):
    DB_YOLU = KAYNAK_DB  # Bilgisayarınız: dosya olduğu yerde[cite: 8, 9]
else:
    DB_YOLU = "/tmp/veritabani.db"  # Vercel: geçici kopya[cite: 8, 9]
    if not os.path.exists(DB_YOLU):
        shutil.copy(KAYNAK_DB, DB_YOLU)

def baglanti_ac():
    baglanti = sqlite3.connect(DB_YOLU)
    baglanti.row_factory = sqlite3.Row  # Sütunlara ismiyle erişmek için[cite: 9]
    return baglanti

@app.route("/")
def anasayfa():
    with baglanti_ac() as db:
        # Kutuphane ile diğer tabloları birleştiren SQL sorgusu
        sorgu = """
            SELECT 
                K.KitapID, 
                K.KitapAdi, 
                Y.YazarAdi || ' ' || Y.YazarSoyadi AS YazarTamAdi, 
                YE.YayinEvi AS YayinEviAdi, 
                KN.Konu AS KonuAdi, 
                K.SayfaSayisi
            FROM Kutuphane K
            LEFT JOIN Yazar Y ON K.YazarID = Y.YazarID
            LEFT JOIN YayinEvi YE ON K.YayinEviID = YE.YayinEviID
            LEFT JOIN Konu KN ON K.KonuID = KN.KonuID
        """
        veriler = db.execute(sorgu).fetchall()
        
    return render_template("index.html", kitaplar=veriler)

if __name__ == "__main__":
    app.run(debug=True)