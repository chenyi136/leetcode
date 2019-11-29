/**
 * @ClassNameDevideIntegers
 * @Author jianwen
 * @Date 19-10-20 下午8:47
 * @Version V1.0
 */
public class DevideIntegers {
    public static void main(String[] args) {
        System.out.println(divide(28,3));
    }
    public static int divide(int dividend, int divisor) {
        if(dividend==0 || divisor == 0)
            return 0;
        boolean flag = (dividend<0 && divisor>0)||(dividend>0 && divisor<0);
        long a = Math.abs((long)dividend);//注意要转换成long型
        long b = Math.abs((long)divisor);
        int result = 0;
        if(a<b)
            return 0;
        long sum=0;
        long pow=0;
        while(a>=b){
            sum = b;
            pow = 1;
            while(sum<<1<=a){
                sum=sum<<1;
                pow=pow<<1;
            }
            a-=sum;
            result+=pow;
        }
        return flag==true?-result:result;
    }

}
