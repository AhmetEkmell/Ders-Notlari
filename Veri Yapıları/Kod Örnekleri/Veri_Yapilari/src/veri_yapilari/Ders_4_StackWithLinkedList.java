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

class Stack{
   Eleman ustDeger;
   
   public Stack(){
       ustDeger = null;
   }
   
   Boolean isEmpty(){
       return ustDeger == null;
   }
   
   public void push(int sayi){
       Eleman elm = new Eleman(sayi);
       elm.ileri = ustDeger;
       ustDeger = elm;
   }
   
   public int pop(){
       Eleman temp = ustDeger;
       if(!isEmpty()){
           ustDeger = ustDeger.ileri;
           return temp.icerik;
       }
       else
           return temp.icerik;
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

public class Ders_4_StackWithLinkedList {
    
    public static void main(String[] args) {
        Stack s = new Stack();
        s.push(3);
        s.push(5);
        s.push(4);
        s.push(1);
        System.out.println("|Liste|");
        s.listele();
        System.out.println("\n"+"Üst değer => "+s.top()+"\n");
        System.out.println("Çıkarılan eleman => "+s.pop()+"\n");
        System.out.println("|Liste|");
        s.listele();
    }
}
