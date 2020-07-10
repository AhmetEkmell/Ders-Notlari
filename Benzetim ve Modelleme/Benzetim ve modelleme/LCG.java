/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lcg;

/**
 *
 * @author Mert
 */
public class LCG {

        double[] lcg(int m, int a, int c, double r, int adet){
            double[] rand=new double[adet];
            
            for (int i = 0; i < adet; i++) {
                r=((a*r)+1)%m;
                rand[i]=r;
            }
            return rand;
            
        }
        
        int obeb(int a,int b){
            if (b==0)
                return a;
            else
                return obeb(b, a%b);
            
        }
        
        boolean periyot(int m, int a, int c){
            boolean ikiTabanindaUsselMi=false;
            int i=1;
            while(i<m){
                i=i*2;
                if (i==m){
                    ikiTabanindaUsselMi=true;
                }
                
            }
            
            boolean asalMi=false;
            if(obeb(c,m)==1){
                asalMi=true;
            }
            
            if( (a-1)%4==0 && asalMi==true && ikiTabanindaUsselMi==true ){
                return true;
            }
            else{
                return false;
            }
            
        }
        ///////////////////////////////////////////////////////////////////
        
        
    public static void main(String[] args) {
        
    }
    
}
