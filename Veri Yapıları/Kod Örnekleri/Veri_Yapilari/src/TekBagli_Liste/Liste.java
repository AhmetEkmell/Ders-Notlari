package TekBagli_Liste;

class Liste {
    
    Eleman bas, son;
    
    public Liste(){
        bas = null;
        son = null;
    }
    
    void Basa_Ekle(Eleman yeni){
        
        //Bu ekleme sonucu karmaşıklık analizi O(1)'dir.
        
        if(son == null){ // Hiç eleman olmama durumu.
            son = yeni;
        }
        yeni.ileri = bas;
        bas = yeni;
    }
    
    void Sona_Ekle(Eleman yeni){
        
        //Bu ekleme sonucu karmaşıklık analizi O(1)'dir.
        
        if(bas == null){
            bas = yeni;
        }
        else{
            son.ileri = yeni;
            son = yeni;
        }
    }
    
    void Ortasina_Ekle(Eleman yeni, Eleman once){
        
        //Bu ekleme sonucu karmaşıklık analizi O(1)'dir.
        
        yeni.ileri = once.ileri;
        once.ileri = yeni;
    }  
    
    Eleman Listede_Ara(int deger){
        
        //karmaşıklık analizi O(N)'dir.
        
        Eleman tmp = bas;
        
        while(tmp != null){
            if(tmp.icerik == deger){
                return tmp;
            }
            tmp = tmp.ileri;
        }
        return null;
    }
    
    Eleman Indexten_Elemani_Sec(int i){
        
        //karmaşıklık analizi O(N)'dir.
        
        Eleman tmp = bas;
        int j = 0;
        while(tmp != null && j<i){
            j++;
            tmp = tmp.ileri;
        }
        return tmp;
    }
    
    void listeyi_Goster(){
       
        //karmaşıklık analizi O(N)'dir.
        
        Eleman tmp = bas;
        while(tmp != null){
            System.out.print(tmp.icerik+" ");
            tmp = tmp.ileri;
        }
    }
    
    void Basi_Sil(){
        bas = bas.ileri;
        if(bas == null){
            son = null;
        }
    }
    
    void Sondan_Sil(){
        
        Eleman tmp, once;
        tmp = bas;
        once = null;
        
        while(tmp != son){
            once = tmp;
            tmp = tmp.ileri;
        }
        
        //bu kısımda tmp = son 
        if(once == null){
            bas = null;
        }
        else{
            once.ileri = null;
        }
        son = once;
    }
    
    void Indexten_Eleman_Sil(Eleman s){
        
        Eleman tmp, elemanOnce;
        tmp = bas;
        elemanOnce = null;
        
        while(tmp != s){
            elemanOnce = tmp;
            tmp = tmp.ileri;
        }
        elemanOnce.ileri = s.ileri;
    }
    
    int ElemanSayisi(){
        int sayac = 0;
        Eleman tmp;
        tmp = bas;
        while(tmp != null){
            tmp = tmp.ileri;
            sayac++;
        }
        return sayac;
    }
}
