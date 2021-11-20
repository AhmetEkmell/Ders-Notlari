
package onurHomework;

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

public class QueueLinked_Homework {
      Dugum bas , son = null;
    int indis = 0;
    
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
        indis++;
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
    
    Stack<Integer> stack = new Stack<Integer>();
    
    public void kuyrukTersCevir(){
        while(!isEmpty()){
            stack.push(pop());
        }
        
        while(!stack.isEmpty()){
            push(stack.pop());
        }
    }
    
    public void N_KadarKuyrukTersCevir(int N){
        for (int i = 0; i < N; i++) {
            stack.push(pop());
        }
        
        while(!stack.isEmpty()){
            push(stack.pop());
        }
        
        for (int i = 0; i < ElemanSayisi()-N; i++) {
            push(pop());
        }
    }
    
    public int ElemanSayisi(){
        Dugum temp = bas;
        int sayac = 0;
        while(temp != null){
            sayac++;
            temp = temp.ileri;
        }
        return sayac;
    }
}
