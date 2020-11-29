package LabKodlari;

import java.util.Scanner;

/**
 *
 * @author Ahmet
 */

public class Bagli_Liste {   
    
    static int no,vize,genel,index = 0;
    static String ad,soyad = null;
    
    public void Ogrenci_Verileri_Olustur(){
        
        Scanner klavye2 = new Scanner (System.in);
        System.out.println("Araya Ekleme yapıyor musunuz?(true veya false yazar mısın :) )");
        String kontrol = klavye2.next();
       
        System.out.println("Öğrenci no giriniz: ");
        no = klavye2.nextInt();
        System.out.println("Öğrenci ad giriniz: ");
        ad = klavye2.next();
        System.out.println("Öğrenci soyad giriniz: ");
        soyad = klavye2.next();
        System.out.println("Öğrenci vize notunu giriniz: ");
        vize = klavye2.nextInt();
        System.out.println("Öğrenci final notunu giriniz: ");
        genel = klavye2.nextInt(); 
        if(kontrol.equals("true")){
            System.out.println("Index numarasını giriniz: ");
            index = klavye2.nextInt();
        }
    }
    
    public static void main(String[] args) {
        int secim;
        Scanner klavye = new Scanner (System.in);
        Bagli_Liste bagliListe = new Bagli_Liste();
        Liste ogrenciler = new Liste();
        do{
            System.out.println("1- Öğrenciyi liste başına ekle.");
            System.out.println("2- Öğrenciyi liste sonuna ekle.");
            System.out.println("3- Öğrenciyi listede araya ekle.");
            System.out.println("4- Öğrencileri listele..");
            System.out.println("5- Liste başından öğrenci sil.");
            System.out.println("6- Liste sonundan öğrenci sil.");
            System.out.println("7- Numarası girilen öğrenciyi sil.");
            System.out.println("8- Numarası girilen öğrenci bilgilerini getir.");
            System.out.println("9- Listedeki öğrenci sayısını getir.");
            System.out.println("10- Tek ve çift numaralı öğrencileri listele.");
            System.out.println("11- Öğrencilerin sınav ortalamalarını bul.");
            System.out.println("12- Genel sınav notu en düşük öğrenciyi bul.");
            System.out.println("0- Programdan çıkış yap.");
            
            secim = klavye.nextInt();
            
            switch(secim){
                case 0:
                    System.out.println("Program Sonlandı.");
                    break;
                case 1:
                    bagliListe.Ogrenci_Verileri_Olustur();
                    ogrenciler.BasaEkle(no,ad,soyad,vize,genel);
                    break;
                case 2:
                    bagliListe.Ogrenci_Verileri_Olustur();
                    ogrenciler.SonaEkle(no,ad,soyad,vize,genel);
                    break;
                case 3:
                    bagliListe.Ogrenci_Verileri_Olustur();
                    ogrenciler.ArayaEkle(no,ad,soyad,vize,genel,index);
                    break;
                case 4:
                    ogrenciler.Listele();
                    break;
                case 5:
                    ogrenciler.ListeBasindanSil();
                    break;
                case 6:
                    ogrenciler.ListeSonundanSil();
                    break;
                case 7:
                    System.out.print("Silinmesini istediğiniz öğrenci no giriniz: ");
                    int sil_no = klavye.nextInt();
                    System.out.println();
                    ogrenciler.NumaradanSil(sil_no);
                    break;
                case 8:
                    System.out.print("Gösterilmesini istediğiniz öğrenci no giriniz: ");
                    int ogr_getir = klavye.nextInt();
                    System.out.println();
                    ogrenciler.OgrenciBilgileri(ogr_getir);
                    break;
                case 9:
                    int ogr_sayisi = ogrenciler.OgrenciSayisi();
                    System.out.print("Öğrenci Sayısı: "+ogr_sayisi+"\n");
                    break;
                case 10:
                    ogrenciler.TekCift_Nolu_Ogrenciler();
                    break;
                case 11:
                    ogrenciler.OrtalamaBul();
                    break;
                case 12:
                    ogrenciler.DusukGenelNot();
                    break;
            }
            
        }while(secim != 0);
        
    }
    
}
