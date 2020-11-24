package veri_yapilari;

class Eleman{
    int icerik;
    Eleman ileri;

    public Eleman(int icerik) {
        this.icerik = icerik;
        ileri = null;
    } 
}

public class Ders_2 {
    
    public static void main(String[] args) {
        
        Eleman elm1 = new Eleman(1);
        Eleman elm2 = new Eleman(2);
        Eleman elm3 = new Eleman(3);
        elm1.ileri = elm2;
        elm2.ileri = elm3;
        
        Eleman tmp = elm1;
        
        while(tmp != null){
            System.out.print(tmp.icerik+" ");
            tmp = tmp.ileri;
        }
    }
}
