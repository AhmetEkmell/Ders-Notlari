package TekBagli_Liste;

public class Eleman {
    
    int icerik;
    Eleman ileri;

    public Eleman(int icerik) {
        this.icerik = icerik;
        ileri = null;
    }
    
    
    public static void main(String[] args) {
        
        Eleman e1 = new Eleman(1);
        Eleman e2 = new Eleman(2);
        Eleman e3 = new Eleman(3);
        Eleman e4 = new Eleman(4);
        Eleman e5 = new Eleman(5);
        Eleman e6 = new Eleman(6);
        Eleman e7 = new Eleman(7);
        
        
        Liste liste = new Liste();
        
        liste.Basa_Ekle(e1);
        liste.Basa_Ekle(e2);
        liste.Basa_Ekle(e3);
        liste.Basa_Ekle(e4);
        liste.Basa_Ekle(e5);
        liste.Sona_Ekle(e6);
        liste.Ortasina_Ekle(e7,e1);
//        System.out.println(liste.Indexten_Elemani_Sec(4).icerik);
        liste.listeyi_Goster();
        liste.Sondan_Sil();
        System.out.println();
        liste.listeyi_Goster();
        liste.Basi_Sil();
        System.out.println();
        liste.listeyi_Goster();
        liste.Indexten_Eleman_Sil(e3);
        System.out.println();
        liste.listeyi_Goster();
    }
    
}
