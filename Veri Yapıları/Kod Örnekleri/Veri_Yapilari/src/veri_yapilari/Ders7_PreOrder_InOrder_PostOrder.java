package Odev4_Cevabi_RoundRobin;

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
    
    public void Gezinti_PreOrder(){
        Dugum tempKok = kok;
        Stack<Dugum> stack = new Stack<Dugum>();
        
        if(tempKok == null){
            return;
        }
        
        stack.push(tempKok);
        System.out.print("PreOrder => ");
        while(!stack.isEmpty()){
            tempKok = stack.pop();
            System.out.print(tempKok.icerik+" ");
            
            if(tempKok.sag != null){
                stack.push(tempKok.sag);
            }
            if(tempKok.sol != null){
                stack.push(tempKok.sol);
            }
        }
        System.out.println();
    }

    
    public void Gezinti_InOrder(){
        Dugum Temp_Kok = kok;
        Stack<Dugum> stack = new Stack<Dugum>();
        if(Temp_Kok==null){
            return;
        }
        System.out.print("InOrder => ");
        while(Temp_Kok!=null || !stack.isEmpty()){
            while(Temp_Kok!=null){
                stack.push(Temp_Kok);
                Temp_Kok = Temp_Kok.sol;
            }
            
            Temp_Kok= stack.pop();
            System.out.print(Temp_Kok.icerik+" ");
            Temp_Kok = Temp_Kok.sag;
        }
        System.out.println();
    }
    
    public void Gezinti_PostOrder(){
        Dugum tempKok = kok;
         Stack<Dugum> stack = new Stack<Dugum>();
         Stack<Dugum> stack_2 = new Stack<Dugum>();
         
         if(tempKok == null){
             return;
         }
         
         stack.push(tempKok);
         
         while(!stack.isEmpty()){
             tempKok = stack.pop();
             stack_2.push(tempKok);
             
             if(tempKok.sol != null){
                 stack.push(tempKok.sol);
             }
             if(tempKok.sag != null){
                 stack.push(tempKok.sag);
             }
         }
         System.out.print("PostOrder => ");
         while(!stack_2.isEmpty()){
             System.out.print(stack_2.pop().icerik+" ");
         }
         
         System.out.println();
    }
    
}


public class Ders7 {
    public static void main(String[] args) {
        Agac agac = new Agac();
        agac.Ekleme(50);
        agac.Ekleme(30);
        agac.Ekleme(70);
        agac.Ekleme(20);
        agac.Ekleme(40);
        agac.Ekleme(80);
        agac.Ekleme(60);
        agac.Gezinti_PreOrder();
        agac.Gezinti_InOrder();
        agac.Gezinti_PostOrder();
    }
}
