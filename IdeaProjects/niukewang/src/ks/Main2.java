package ks;

import java.util.Scanner;

public class Main2 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        System.out.println(helper(n));
    }

    static int helper(int n) {
        int count = 0;

        int ans = 1;

        for (int i = n; i >= 2; i--) {
            ans *= i;
            while (ans % 10 == 0)        //消除末尾的0
            {
                ans /= 10;


            }

        }

        while (ans % 10 == 0)        //消除末尾的0
        {
            ans /= 10;


        }
        return ans % 10;


    }
}
