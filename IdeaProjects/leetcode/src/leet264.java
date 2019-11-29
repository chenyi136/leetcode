public class leet264 {
    public int nthUglyNumber(int n) {
        int ugly[]=new int[n];
        int i2=0,i3=0,i5=0;
        int next_2=2;
        int next_3=3;
        int next_5=5;

        int next_ugly_no=1;

        ugly[0]=1;

        for(int i=1;i<n;i++){
            next_ugly_no=Math.min(next_2,Math.min(next_3,next_5));

            ugly[i]=next_ugly_no;


            if(next_ugly_no==next_2){
                i2+=1;
                next_2=ugly[i2]*2;
            }

            if(next_ugly_no==next_3){
                i3+=1;
                next_2=ugly[i3]*3;
            }

            if(next_ugly_no==next_5){
                i5+=1;
                next_5=ugly[i5]*5;
            }
        }

        return next_ugly_no;

    }
}
