package Odev4_Cevabi_RoundRobin;

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
        while(dizi[indis] != 0){
            indis = (indis + 1) % 10;
        }
        dizi[indis] = sayi;
        indis++;
    }
    
    int Ara(int eleman){
        int indis = hash(eleman);
        if(eleman == dizi[indis]){
            return indis;
        }
        else{
            while(dizi[indis]!=0){
                indis = (indis+1) % 10;
                if(eleman == dizi[indis]){
                    return indis;
                }
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
        for (int i = 0; i < 10; i++) {
            System.out.println(i+"=> "+dizi[i]);
        }
    }
}


public class Ders6 {
    public static void main(String[] args) {
        hash hashcik = new hash();
        hashcik.Ekle(5);
        hashcik.Ekle(6);
        hashcik.Ekle(7);
        hashcik.Ekle(3);
        hashcik.Ekle(4);
        hashcik.Ekle(21);
        hashcik.Ekle(22);
        hashcik.listele();
        System.out.println("5 Dizinin "+hashcik.Ara(5)+". indisinde");
        hashcik.Sil(22);
        hashcik.listele();
    }
}
