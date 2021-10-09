/**
 *
 * @author Ahmet
 */

class hash{
    int dizi[] = new int[10];
    
    int hash(int anahtar){
        return anahtar % 10;
    }
    
    void Ekle(int sayi){
        int indis = hash(sayi);
        int newIndis = indis;
        int katSayi = 0;
        while(dizi[newIndis] != 0){
            newIndis = (indis + katSayi * katSayi) % 10;
            katSayi++;
        }
        dizi[newIndis] = sayi;
    }
    
    int Ara(int eleman){
        int indis = hash(eleman);
        if(eleman == dizi[indis]){
            return indis;
        }
        else{
            int newIndis = indis;
            int katSayi = 1;
            while(dizi[newIndis]!=0){
                newIndis = (indis+ katSayi * katSayi) % 10;
                if(eleman == dizi[newIndis]){
                    return newIndis;
                }
                katSayi++;
            }
        }
        return -1;
    }
    
    void Sil(int eleman){
        int indis = Ara(eleman);
        if(indis != -1 && dizi[indis] != 0){
            System.out.println("dizinin silinen elemanı => "+dizi[indis]);
            dizi[indis] = -1;
        }
        else{
            System.out.println(eleman+" sayısı hash tabloda bulunmuyor");
        }
    }
    
    void listele(){
        for (int i = 0; i < 10; i++) {
            System.out.println(i+"=> "+dizi[i]);
        }
    }
}


public class Hash_Quadratic {
    public static void main(String[] args) {
        hash hashcik = new hash();
        hashcik.Ekle(5);
        hashcik.Ekle(3);
        hashcik.Ekle(8);
        hashcik.Ekle(2);
        hashcik.Ekle(1);
        hashcik.Ekle(7);
        hashcik.Ekle(9);
        hashcik.Ekle(10);
        hashcik.Ekle(10);
        hashcik.Sil(1);
        hashcik.Sil(10);
        hashcik.Sil(10);
        hashcik.Sil(20);
        hashcik.listele();
        
    }
}
