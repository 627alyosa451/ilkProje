import os
import shutil
import sqlite3
from flask import Flask, render_template, request

app = Flask(__name__, static_folder="public", static_url_path="")
app.secret_key = os.environ.get("SECRET_KEY", "yerel-gelistirme-anahtari")

KLASOR = os.path.dirname(os.path.abspath(__file__))
KAYNAK_DB = os.path.join(KLASOR, "veritabani.db")

if os.access(KLASOR, os.W_OK):
    DB_YOLU = KAYNAK_DB
else:
    DB_YOLU = "/tmp/veritabani.db"
    if not os.path.exists(DB_YOLU):
        shutil.copy(KAYNAK_DB, DB_YOLU)

def baglanti_ac():
    baglanti = sqlite3.connect(DB_YOLU)
    baglanti.row_factory = sqlite3.Row
    return baglanti

@app.route("/")
def anasayfa():
    # Arama çubuğundan gelen veriyi al
    arama_kelimesi = request.args.get("arama", "").strip()
    
    with baglanti_ac() as db:
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
            WHERE 1=1
        """
        parametreler = []

        # Eğer kullanıcı bir kelime girdiyse SQL sorgusuna filtre ekle
        if arama_kelimesi:
            sorgu += """ AND (
                K.KitapAdi LIKE ? OR 
                YazarTamAdi LIKE ? OR 
                YayinEviAdi LIKE ? OR 
                KonuAdi LIKE ?
            )"""
            aranacak_deger = f"%{arama_kelimesi}%"
            # 4 adet soru işareti (?) için parametreleri çoğalt
            parametreler.extend([aranacak_deger, aranacak_deger, aranacak_deger, aranacak_deger])
            
        sorgu += " ORDER BY K.KitapAdi ASC"
        
        veriler = db.execute(sorgu, parametreler).fetchall()
        
    return render_template("index.html", kitaplar=veriler, arama_kelimesi=arama_kelimesi)

if __name__ == "__main__":
    app.run(debug=True)