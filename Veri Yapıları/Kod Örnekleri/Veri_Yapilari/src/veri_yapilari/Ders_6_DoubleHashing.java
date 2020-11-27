/**
 *
 * @author Ahmet
 */

class hash{
    int dizi[] = new int[29];
    
    int hash(int anahtar){
        return anahtar % 29; // Asal bir sayı seçiyoruz ki sonsuz döngüye girmeyelim
    }
    
    int hash_2(int anahtar){
        return ((anahtar%7)*3) % 29;
    }
    
    void Ekle(int sayi){
        int indis = hash(sayi);
        int newIndis = indis;
        int katSayi = 0;
        while(dizi[newIndis] != 0){
            newIndis = (indis + katSayi*hash_2(sayi)) % 11;
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
            while(dizi[newIndis] != 0){
                newIndis = (indis + katSayi *hash_2(eleman)) % 11;
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
            dizi[indis] = -1; // Eğer -1 değilde 0 yaparsak kod patlıyor. Dolayısıyla Silinen eleman yerine 0 dan farklı bir değer vermek lazım.
        }
        else{
            System.out.println(eleman+" sayısı hash tabloda bulunmuyor");
        }
    }
    
    void listele(){
        for (int i = 0; i < dizi.length; i++) {
            System.out.println(i+"=> "+dizi[i]);
        }
    }
}


public class Ders6 {
    public static void main(String[] args) {
        hash hashcik = new hash();
        hashcik.Ekle(1);
        hashcik.Ekle(11);
        hashcik.Ekle(21);
        hashcik.Ekle(31);
        hashcik.Ekle(41);
        hashcik.Ekle(51);
        hashcik.Ekle(61);
        hashcik.Sil(1);
        hashcik.listele();
        hashcik.Sil(1);
        hashcik.listele();
        
    }
}
