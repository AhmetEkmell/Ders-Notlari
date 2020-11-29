import java.util.Stack;

/**
 *
 * @author Ahmet
 */

class Dugum{
    int icerik;
    Dugum sol ,sag;
    
    public Dugum(int icerik){
        this.icerik = icerik;
        sol = null;
        sag = null;
    }
}

class Agac{
    Dugum kok;
    
    public Agac(){
        kok = null;
    }
    
    public void Ekleme(int sayi){
        Dugum eleman = new Dugum(sayi);
        Dugum EbeveynDugum = null, x = kok;
        
        while(x != null){
            EbeveynDugum = x;
            if(sayi < x.icerik){
                x = x.sol;
            }
            else{
                x = x.sag;
            }
        }
        if(EbeveynDugum == null){
            kok = eleman;
        }
        else if(sayi<EbeveynDugum.icerik)
            EbeveynDugum.sol = eleman;
        else
            EbeveynDugum.sag = eleman;
    }
    
    public void Silme(int eleman){
        kok = Sil(kok,eleman);
    }
    
    private Dugum Sil(Dugum kok, int eleman){
        if(kok == null){
            return null;
        }
        if(eleman < kok.icerik)
            kok.sol = Sil(kok.sol,eleman);
        else if(eleman > kok.icerik)
            kok.sag = Sil(kok.sag,eleman);
        else
        {
            if(kok.sol != null && kok.sag != null){
//                Dugum minSag = EnKucuk(kok.sag);
//                kok.icerik = minSag.icerik;
//                kok.sag = Sil(kok.sag, minSag.icerik);
                Dugum maxSol = EnBuyuk(kok.sol);
                kok.icerik = maxSol.icerik;
                kok.sol = Sil(kok.sol, maxSol.icerik);
            }
            else if(kok.sol != null){
                kok = kok.sol;
            }
            else if(kok.sag != null){
                kok = kok.sag;
            }
            else{
                kok = null;
            }
        }
        return kok;
    }
    
    public Dugum EnBuyuk(Dugum d){
        while(d.sag != null){
            d = d.sag;
        }
        return d;
    }
    
    public Dugum EnKucuk(Dugum d){
        while(d.sol != null){
            d = d.sol;
        }
        return d;
    }
    
    public boolean Arama(int eleman){
        Dugum d = kok;
        
        while(d != null){
            if(d.icerik == eleman)
                return true;
            else
                if(d.icerik > eleman)
                    d = d.sol;
                else
                    d = d.sag;
        }
        return false;
    }
    
    public void Update(int eskiDeger, int yeniDeger){
        Silme(eskiDeger);
        Ekleme(yeniDeger);
    }
    
    public void Gezinti_InOrder(){
        Dugum Temp_Kok = kok;
        Stack<Dugum> stack = new Stack<Dugum>();
        if(Temp_Kok==null){
            return;
        }
        while(Temp_Kok!=null || !stack.isEmpty()){
            while(Temp_Kok!=null){
                System.out.println("Temp_kok: "+Temp_Kok.icerik);
                stack.push(Temp_Kok);
                Temp_Kok = Temp_Kok.sol;
            }
            
            Temp_Kok= stack.pop();
            System.out.println("Pop Kok: "+Temp_Kok.icerik);
            Temp_Kok = Temp_Kok.sag;
        }
        System.out.println();
    }
    
}


public class Ders6 {
    public static void main(String[] args) {
        Agac agac = new Agac();
        agac.Ekleme(50);
        agac.Ekleme(30);
        agac.Ekleme(70);
        agac.Ekleme(20);
        agac.Ekleme(40);
        agac.Ekleme(80);
        agac.Ekleme(60);
        agac.Gezinti_InOrder();
        /*
                     --------------
                    | Ağaç  Yapısı |
                     -------------- 
                          50
                       |      |
                     30        70
                   |    |    |    |
                  20    40  60    80
        */
    }
}
