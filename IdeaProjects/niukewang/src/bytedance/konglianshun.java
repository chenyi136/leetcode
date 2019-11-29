package bytedance;


import java.util.Scanner;

/**
 * @ClassNamekonglianshun
 * @Author jianwen
 * @Date 19-9-14 下午8:59
 * @Version V1.0
 */
public class konglianshun {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int N = sc.nextInt();
        int D = sc.nextInt();
        int[] node = new int[N];
        for (int i = 0; i < N; ++i) {
            node[i] = sc.nextInt();
        }

        long dp = 0;
        int l = 0;
        int r = 2;
        while (l <= r && r < N) {
            if (node[r] - node[l] > D) ++l;
            else if (r - l < 2) ++r;
            else {
                int len = r - l + 1;
                dp += (long) (len - 1) * (long) (len - 2) / 2;
                ++r;
            }
        }

        System.out.println(dp % 99997867);

    }
}
