package ks;

import java.util.Scanner;



    public class Main4 {
        public static void main(String[] args) {
            Scanner in = new Scanner(System.in);
            long n=in.nextLong(), m=n;
            long num2 = get2(n) - get2(n - m);
            long num5 = get5(n) - get5(n - m);
            long num3 = getx(n, 3) - getx(n - m, 3);
            long num7 = getx(n, 7) - getx(n - m, 7);
            long num9 = getx(n, 9) - getx(n - m, 9);
            long res = 1L;
            if (num5 > num2) {
                res = 5;
            } else if (num5 < num2)
            {
                res *= numtable[0][(int) ((num2 - num5) % 4)];
                res %= 10;
            }
            if (res != 5) {
                res *= numtable[1][(int) (num3 % 4)];
                res %= 10;
                res *= numtable[2][(int) (num7 % 4)];
                res %= 10;
                res *= numtable[3][(int) (num9 % 4)];
                res %= 10;
            }
            System.out.println(res);
        }

        static long g(long n, long x) {
            if (n == 0)
                return 0;
            long tmp = (n % 10 >= x) ? 1 : 0;
            return n / 10 + tmp + g(n / 5, x);
        }

        static long getx(long n, long x)
        {
            if (n == 0)
                return 0;
            return getx(n / 2, x) + g(n, x);
        }
        static long get2(long n)
        {
            if(n == 0)return 0;
            return n / 2 + get2(n / 2);
        }
        static long get5(long n)
        {
            if(n == 0)return 0;
            return n / 5 + get5(n / 5);
        }
        static long numtable[][] = { { 6, 2, 4, 8 }, { 1, 3, 9, 7 },
                { 1, 7, 9, 3 }, { 1, 9, 1, 9 } };
    }

