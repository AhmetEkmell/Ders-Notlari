package LabKodlari;

/**
 *
 * @author Ahmet
 */
class Ogrenci{
    int no;
    String ad;
    String soyad;
    int vize;
    int genel;
    Ogrenci ileri; // Bir sonraki öğrencinin adresini göster.

    public Ogrenci(int no, String ad, String soyad, int vize, int genel) {
        this.no = no;
        this.ad = ad;
        this.soyad = soyad;
        this.vize = vize;
        this.genel = genel;
        this.ileri = null;
    }
    
    
}

public class Liste {
    // Tek yönlü Bagli Liste
    
    Ogrenci ilk , son = null;
    
    public void BasaEkle(int no, String ad, String soyad, int vize, int genel){
        Ogrenci ogr =new Ogrenci(no, ad, soyad, vize, genel);
        if(son == null){
            ilk = ogr;
            son = ogr;
        }
        else{
            ogr.ileri = ilk;
            ilk = ogr;
        }
    }
    
    public void SonaEkle(int no, String ad, String soyad, int vize, int genel){
        Ogrenci ogr = new Ogrenci(no, ad, soyad, vize, genel);
        if(ilk == null){
            ilk = ogr;
            son = ogr;
        }
        else{
            son.ileri = ogr;
            son = ogr;
        }
    }
    
    public void ArayaEkle(int no, String ad, String soyad, int vize, int genel, int index){
        Ogrenci ogr = new Ogrenci(no, ad, soyad, vize, genel);
        int ogr_sayisi = OgrenciSayisi();
        int j=1;
        Ogrenci tmp = ilk;
        
        if(index <= ogr_sayisi){
            while(tmp != null){
                if(j == index){
                    // Eşitse indexde ki ogr den sonrasına ekle
                    ogr.ileri = tmp.ileri;
                    tmp.ileri = ogr;
                }
                tmp = tmp.ileri;
                j++;
            }
            
        }
        else{
            System.out.println("Belirtilen öğrenci listede yok.");
        }
    }
    
    public void Listele(){
        Ogrenci tmp = ilk;
        while(tmp != null){
            System.out.println("No: = "  + tmp.no +
                               " | Adı: "   + tmp.ad +
                               " | Soyadı: "+ tmp.soyad +
                               " | Vize: "  + tmp.vize + 
                               " | Final: " + tmp.genel
                              );
            tmp = tmp.ileri;
        }
    }
    
    public void ListeBasindanSil(){
        ilk = ilk.ileri;
        if(ilk == null){
            son = null;
        }
    }
    
    public void ListeSonundanSil(){
        Ogrenci tmp = ilk;
        Ogrenci onceki_ogr = null;
        while(tmp != null){
            onceki_ogr = tmp;
            tmp = tmp.ileri;
        }
        // Son Eleman bulundu ise aşağıdaki satırlar işler.
        if(onceki_ogr == null){
            ilk = null; 
            son = null;
        }
        else{
            onceki_ogr.ileri = null;
            son = onceki_ogr;
        }
    }
    
    public void NumaradanSil(int no){
        //numarası girilen öğrenciye ait öğrenci bulundu ve listeden çıkarıldı.
        Ogrenci tmp, onceki_ogr;
        tmp = ilk;
        onceki_ogr = null;
        
        while(tmp.no != no){
            onceki_ogr = tmp;
            tmp = tmp.ileri;
        }
        onceki_ogr.ileri = tmp.ileri;
    }
    
    public void OgrenciBilgileri(int no){
        Ogrenci tmp = ilk;
        while(tmp != null){
            if(tmp.no==no){
                System.out.println("No: = "  + tmp.no +
                                   " | Adı: "   + tmp.ad +
                                   " | Soyadı: "+ tmp.soyad +
                                   " | Vize: "  + tmp.vize + 
                                   " | Final: " + tmp.genel
                                  );
                break;
            }
            else{
                tmp = tmp.ileri;
            }
        }
    }
    
    public void TekCift_Nolu_Ogrenciler(){
        Liste tek = new Liste();
        Liste cift = new Liste();
        
        Ogrenci tmp = ilk;
        while(tmp != null){
            if(tmp.no % 2 != 0){
                tek.SonaEkle(tmp.no, tmp.ad, tmp.soyad, tmp.vize, tmp.genel);
            }
            else{
                cift.SonaEkle(tmp.no, tmp.ad, tmp.soyad, tmp.vize, tmp.genel);
            }
            tmp = tmp.ileri;
        }
        System.out.println("Tek numaralı öğrencilerin listesi: ");
        tek.Listele();
        System.out.println("Cift numaralı öğrencilerin listesi: ");
        cift.Listele();
    }
    
    public void OrtalamaBul(){
        double ortalama = 0.0;
        Ogrenci tmp = ilk;
        while(tmp != null){
            ortalama = tmp.vize*0.4 + tmp.genel*0.6;
            System.out.println("Öğrenci No: "+tmp.no + " Ortalama notu: "+ortalama);
            tmp = tmp.ileri;
        }
    }
    
    public void DusukGenelNot(){
        int not = ilk.genel;
        Ogrenci tmp = ilk;
        Ogrenci tmp2 = null;
        while(tmp != null){
            if(tmp.genel < not){
                not = tmp.genel;
                tmp2 = tmp;
            }
            tmp = tmp.ileri;
        }
        System.out.println("En düşük genel sınav notuna sahip öğrenci:");
        System.out.println("No: = "  + tmp2.no +
                           " | Adı: "   + tmp2.ad +
                           " | Soyadı: "+ tmp2.soyad +
                           " | Vize: "  + tmp2.vize + 
                           " | Final: " + tmp2.genel
                           );
    }
    
    public int OgrenciSayisi(){
        int ogreci_sayisi = 0;
        Ogrenci tmp = ilk;
        while (tmp != null){
            tmp = tmp.ileri;
            ogreci_sayisi++;
        }
        
        return ogreci_sayisi;
        
    }

}
