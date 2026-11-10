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
    # URL'den arama ve sıralama verilerini al
    arama_kelimesi = request.args.get("arama", "").strip()
    siralama = request.args.get("sirala", "kitap_asc")
    
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

        # 1. BÖLÜM: ARAMA FİLTRESİ (Senin çalışan eski yapın)
        if arama_kelimesi:
            sorgu += """ AND (
                K.KitapAdi LIKE ? OR 
                YazarTamAdi LIKE ? OR 
                YayinEviAdi LIKE ? OR 
                KonuAdi LIKE ?
            )"""
            aranacak_deger = f"%{arama_kelimesi}%"
            parametreler.extend([aranacak_deger, aranacak_deger, aranacak_deger, aranacak_deger])
            
        # 2. BÖLÜM: SIRALAMA EKLENTİSİ
        if siralama == "kitap_desc":
            sorgu += " ORDER BY K.KitapAdi DESC"
        elif siralama == "yazar_asc":
            sorgu += " ORDER BY YazarTamAdi ASC"
        elif siralama == "sayfa_asc":
            sorgu += " ORDER BY K.SayfaSayisi ASC"
        elif siralama == "sayfa_desc":
            sorgu += " ORDER BY K.SayfaSayisi DESC"
        else:
            sorgu += " ORDER BY K.KitapAdi ASC"
            
        veriler = db.execute(sorgu, parametreler).fetchall()
        
        # 3. BÖLÜM: İSTATİSTİK VERİLERİ (Alt bilgi kartları için)
        istatistikler = {}
        istatistikler['toplam_kitap'] = db.execute("SELECT COUNT(*) FROM Kutuphane").fetchone()[0]
        istatistikler['toplam_yazar'] = db.execute("SELECT COUNT(*) FROM Yazar").fetchone()[0]
        istatistikler['toplam_sayfa'] = db.execute("SELECT SUM(SayfaSayisi) FROM Kutuphane").fetchone()[0]
        
    return render_template("index.html", kitaplar=veriler, arama_kelimesi=arama_kelimesi, secili_sirala=siralama, istatistik=istatistikler)

if __name__ == "__main__":
    app.run(debug=True)