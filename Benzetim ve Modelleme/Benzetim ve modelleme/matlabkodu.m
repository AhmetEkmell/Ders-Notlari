function f=obeb(a,b)
            if (b==0)
                f=a;
            else
                f=obeb(b, mod(a,b));
            end

        
function func=periyot(m, a, c)
            ikiTabanindaUsselMi=false;
            i=1;
            while(i<m)
                i=i*2;
                if (i==m)
                    ikiTabanindaUsselMi=true;
                end
                
            end
            
            asalMi=false;
            if(obeb(c,m)==1)
                asalMi=true;
            end
            
            %m= 2'nin ussu ve c ile m aralarinda asal ve a'nin bir eksigi
            %4'un kati ise Periyot=m'dir
            if( mod(a-1,4)==0 && asalMi==true && ikiTabanindaUsselMi==true )
                func=true;
            
            else
                func=false;
            end
            
end