
package onurHomework;

/**
 *
 * @author Ahmet
 */

class Eleman{
    int icerik;
    Eleman ileri;

    public Eleman(int icerik) {
        this.icerik = icerik;
        ileri = null;
    }
}

public class LinkedStack_Homework {
     Eleman ustDeger;
   int indis = 0;
   
   public LinkedStack_Homework(){
       ustDeger = null;
   }
   
   Boolean isEmpty(){
       return ustDeger == null;
   }
   
   public void push(int sayi){
       Eleman elm = new Eleman(sayi);
       elm.ileri = ustDeger;
       ustDeger = elm;
       indis++;
   }
   
   public int pop(){
       Eleman temp = ustDeger;
       if(!isEmpty()){
           ustDeger = ustDeger.ileri;
           indis--;
           return temp.icerik;
       }
       else {
           return temp.icerik;
       }    
   }
   
   public int top(){
        if(!isEmpty()){
            return ustDeger.icerik;
        }
        else {
            return -1;
        }
    }
    
    public void listele(){
        Eleman temp = ustDeger;
        if(!isEmpty()){
            while(temp != null){
                System.out.println(temp.icerik);
                temp = temp.ileri;
            }
        }
        else{
            System.out.println("Stack/Yığıt boş");
        }
    }
}
