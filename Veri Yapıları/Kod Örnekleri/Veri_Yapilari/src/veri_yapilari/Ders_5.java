package Odev3_Cevabi_Stack_Yigit;

import java.util.Stack;

/**
 *
 * @author Ahmet
 */

class Dugum{
    Dugum ileri;
    int icerik;
    Dugum(int icerik){
        this.icerik = icerik;
        ileri = null;
    }
}

class Kuyruk{
    Dugum bas , son = null;
    
    Boolean isEmpty(){
        return bas == null;
    }
    
    public void push(int sayi){
        Dugum eleman = new Dugum(sayi);
        if(!isEmpty()){
            son.ileri = eleman;
            son = eleman;
        }
        else{
            bas = eleman;
            son = eleman;
        }
    }
    
    public int pop(){
        Dugum cikanEleman = bas;
        if(!isEmpty()){
            bas = cikanEleman.ileri;
            if(bas == null){
                son = null;
            }
        }
        return cikanEleman.icerik;
    }
    
    public void kuyrukGoster(){
        Dugum tmp = bas;
        while(tmp!=null){
            System.out.print(tmp.icerik+" ");
            tmp = tmp.ileri;
        }
    }
    
    public void kuyrukTersCevir(){
        Stack<Integer> stack = new Stack<Integer>();
        while(!isEmpty()){
            stack.push(pop());
        }
        
        while(!stack.isEmpty()){
            push(stack.pop());
        }
    }
}

public class Ders_4 {
    public static void main(String[] args) {
        Kuyruk kuyruk = new Kuyruk();
        for (int i = 1; i < 10; i++) {
                kuyruk.push(i);
        }
        kuyruk.kuyrukGoster();
        System.out.println();
        kuyruk.kuyrukTersCevir();
        kuyruk.kuyrukGoster();
        System.out.println();
    }
}
