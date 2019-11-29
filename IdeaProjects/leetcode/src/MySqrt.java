/**
 * @ClassNameMySqrt
 * @Author jianwen
 * @Date 19-10-20 下午9:10
 * @Version V1.0
 */
public class MySqrt {
    public static void main(String[] args) {
        System.out.println(mySqrt(8));
    }
    public static int mySqrt(int x) {
        if(x == 0 || x == 1)    return x;
        int l = 0;
        int r = x;
        while(l <= r){
            int mid = l + (r - l) /2;
            int s = x / mid; //用来判断mid大于目标还是小于目标，或等于目标
            int ss = x / (mid + 1);
            if(x / s == s)  return s; //刚好是他的算术平方根
            if(s > mid && ss < mid + 1) return mid; //例如6 在2的平方以及 3的平方之间  答案为2
            if(s > mid) l = mid + 1; //调整边界
            if(s < mid) r = mid - 1;
        }
        return 0;
    }


}
