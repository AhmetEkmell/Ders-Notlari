/**
 *
 * @author Ahmet
 */

class Dugum{
    int icerik;
    Dugum ileri;
    
    Dugum(){
    }
    
    Dugum(int icerik){
        this.icerik = icerik;
        ileri = null;
    }
}

class Hash{
    Dugum table[] = new Dugum[10];
    
    int hashFunction(int sayi){
        return sayi % 10;
    }
    
    void Ekle(int sayi){
        Dugum yeni = new Dugum(sayi);
        int indis = hashFunction(sayi);
        if(table[indis]==null){
            table[indis] = yeni;
        }
        else{
            Dugum temp = table[indis];
            while(temp.ileri != null){
                temp = temp.ileri;
            }
            temp.ileri = yeni;
        }
    }
    
    Dugum Ara(int sayi){
        int indis = hashFunction(sayi);
        Dugum temp = table[indis];
        while(temp != null){
            if(temp.icerik == sayi){
                return temp;
            }
            temp = temp.ileri;
        }
        return null;
    }
    
    void Sil(int sayi){
        int indis = hashFunction(sayi);
        if(table[indis].icerik == sayi){
            table[indis] = table[indis].ileri;
        }
        else{
            Dugum temp = table[indis];
            while(temp.ileri != null){
                if(temp.ileri.icerik == sayi){
                    temp.ileri = temp.ileri.ileri;
                }
                temp = temp.ileri;
            }
        }
    }
    
    void listele(){
        for (int i = 0; i < 10; i++) {
            System.out.print("["+i+"] = ");
            Dugum temp = table[i];
            while(temp != null){
                System.out.print(temp.icerik+" ");
                temp = temp.ileri;
            }
            System.out.println();
        }
    }
}


public class Ders6 {
    public static void main(String[] args) {
        Hash h = new Hash();
        h.Ekle(26);
        h.Ekle(28);
        h.Ekle(6);
        h.Ekle(6);
        h.Sil(26);
        h.listele();
    }
}
