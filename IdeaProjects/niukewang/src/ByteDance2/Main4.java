package ByteDance2;

import java.util.Scanner;

/**
 * @ClassNameMain4
 * @Author jianwen
 * @Date 19-9-29 下午8:42
 * @Version V1.0
 */
public class Main4 {
    public static void main(String[] args) {

//
//        Scanner sc = new Scanner(System.in);
//        while (sc.hasNext()) {
//            int n = sc.nextInt();
//            boolean[] prime = new boolean[10000000];
//            int count = 0;
//            for (int i = 2; i < n; i++) {
//                if (prime[i] == false) {
//                    count++;
//                    for (int j = i; j * i < n; j++) {
//                        prime[j * i] = true;
//                    }
//                }
//            }
//            System.out.println(count);
//        }
////    }
//        Scanner sc = new Scanner(System.in);
//        int n = sc.nextInt();
//        int m = (int) (Math.sqrt(n));
//        int count = 0;
//        if (n <= 1) {
//            count = 0;
//        } else if (n == 2) {
//            count = 1;
//        } else if (n == 3) {
//            count = 2;
//        }
//        else if (n == 3)
//        {
//            count = 2;
//        }
//        else
//        {
//            for (int i = 2; i < n; i++)
//            {
//                boolean flag = true;
//                for (int j = 2; j <= (int) (Math.sqrt(i)); j++)
//                {
//                    if (i % j == 0)
//                    {
//                        flag = false;
//                        break;
//                    }
//                   // break;
//                }
//                if (flag)
//                {
//                    count++;
//                }
//            }
//        }
//    }


//
//                Scanner sc=new Scanner(System.in);
//                boolean[] flag = new boolean[10000000];
//                flag[0] = true;
//                flag[1] = true;
//                for (int i = 2; i <= 3163; i++) {
//                    if(flag[i]) continue;
//                    int j = 2;
//                    while(true){
//                        int index = j*i;
//                        if(index>=flag.length) break;
//                        flag[index] = true;
//                        j++;
//                    }
//
//                }
//                int sum = 0;
//                int[] bp = new int[10000000];
//                for (int i = 0; i < flag.length; i++) {
//                    if(!flag[i]){
//                        sum++;
//                    }
//                    bp[i] = sum;
//                }
//                while(sc.hasNext()){
//                    int n = sc.nextInt();
//                    System.out.println(bp[n]);
//                }
//            }
//        }





     Scanner sc=new Scanner(System.in);
            boolean[] flag = new boolean[10000000];
            flag[0] = true;
            flag[1] = true;
            for (int i = 2; i <= 3163; i++) {
                if (flag[i]) continue;
                int j = 2;
                while (true) {
                    int index = j * i;
                    if (index >= flag.length) break;
                    flag[index] = true;
                    j++;
                }

            }
            int sum = 0;
            int[] bp = new int[10000000];
            for (int i = 0; i < flag.length; i++) {
                if (!flag[i]) {
                    sum++;
                }
                bp[i] = sum;
            }
            while (sc.hasNext()) {
                int n = sc.nextInt();
                System.out.println(bp[n - 1]);
            }
        }

}