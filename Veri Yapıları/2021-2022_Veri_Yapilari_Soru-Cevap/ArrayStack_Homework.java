
package onurHomework;

/**
 *
 * @author Ahmet
 */

public class ArrayStack_Homework{
    
    public int [] dizi;
    public int boyut, ustDeger;

    public ArrayStack_Homework(int boyut) {
        this.boyut = boyut;
        this.dizi = new int[this.boyut];
        this.ustDeger = -1;
    }
    
    public Boolean isFull(){
        return ustDeger == boyut-1;
    }
    
    public Boolean isEmpty(){
        return ustDeger == -1;
    }
    
    public void push(int sayi){
        if(!isFull()){
            ustDeger++;
            dizi[ustDeger] = sayi;
        }
        else{
            System.out.println("Stack/Yığıt dolu!");
        }
    }
    
    public int pop(){
        if(!isEmpty()){
            int tmpSilinen = dizi[ustDeger];
            ustDeger--;
            return tmpSilinen;
        }
        else{
            return -1; // Stack boş ise return -1
        }
    }
    
    public int top(){
        if(!isEmpty()){
            return dizi[ustDeger];
        }
        else {
            return -1;
        }
    }
    
    public void listele(){
        int i = ustDeger;
        if(!isEmpty()){
            while(i != -1){
                System.out.println(dizi[i]);
                i--;
            }
        }
        else{
            System.out.println("Stack/Yığıt boş");
        }
    }
}