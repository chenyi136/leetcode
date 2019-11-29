package Mianjing;

/**
 * @ClassNameZhishuFenjie
 * @Author jianwen
 * @Date 19-10-10 下午6:52
 * @Version V1.0
 */
public class ZhishuFenjie {
    public static void main(String[] args) {
        System.out.println(zhiyinshu(9));
    }
    public static String zhiyinshu(int n) {
        StringBuilder stringBuilder = new StringBuilder();
        int yuanlai = n;
        for (int i = 2; i <= n; i++) {
            //第一个数能够整除n的数一定是质数
            if (n % i == 0) {
                n /= i;
                stringBuilder.append(i).append(',');
                //有可能这个数是很多个i相乘
                i--;
            }

        }

        return stringBuilder.toString();
    }

}
