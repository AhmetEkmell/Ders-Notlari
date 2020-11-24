package Odev3_Cevabi_Stack_Yigit;

import java.util.Comparator;
import java.util.PriorityQueue;

/**
 *
 * @author Ahmet
 */


public class Ders_5_OncelikliKuyruk {
    public static void main(String[] args) {
        PriorityQueue<String> pq1 = new PriorityQueue<String>();
        PriorityQueue<String> pq2 = new PriorityQueue<String>(10, new Comparator<String>() {
            @Override
            public int compare(String t, String t1) {
                return t1.compareTo(t);
            }
        });
        
        String [] eleman = {"A","H","C","B","E","K","D","I","G","F"};
        
        for(String e: eleman){
            pq1.add(e);
            pq2.add(e);
        }
        
        System.out.print("Artan Öncelikli Kuyruk: ");
        pq1.add("B");
        while(pq1.size() != 0){
            System.out.print(pq1.poll()+" ");
        }
        System.out.println();
        System.out.println();
        System.out.print("Azalan Öncelikli Kuyruk: ");
        while(pq2.size() != 0){
            System.out.print(pq2.poll()+" ");
        }
        System.out.println();
        System.out.println();
    }
}
