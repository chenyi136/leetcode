package huawei2;

import java.util.Scanner;

public class Main2 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String s = sc.nextLine();
        String res = fun(s, 0, s.length());
        StringBuilder sb = new StringBuilder(res);
        StringBuilder reverse = sb.reverse();
        System.out.println(reverse);
    }


    public static String fun(String s, int i, int length) {
        if (i >= length) return "";
        int j = i;
        if (s.charAt(i) > '0' && s.charAt(i) < '9') {
            for (j = i; j < length; j++) {
                if (s.charAt(j) >= '0' && s.charAt(j) <= '9') {
                    continue;
                }else break;
            }
        }
        int num;
        if (j == i) num = 1;
        else num = Integer.parseInt(s.substring(i, j));

        int k;

        for (k = j; k < length; k++) {
            if (s.charAt(k) >= 'a' && s.charAt(k) <= 'z') {
                continue;
            } else break;
        }
        if (k != j) {
            String temp = s.substring(j, k);
            String res = "";
            for (int l = 0; l < num; l++) {
                res += temp;
            }
            return res + fun(s, k, length);
        }
        char c = ' ';

        for (int l = j; l < length; l++) {
            if ('(' == s.charAt(l)) {
                c = ')';
                break;
            }
            if ('[' == s.charAt(l)) {
                c = ']';
                break;
            }
            if ('{' == s.charAt(l)) {
                c = '}';
                break;
            }

        }
        int m;
        for (m = length - 1; m > j; m--) {
            if (c == s.charAt(m)) break;
        }
        String res = "";
        String tmp=fun(s,j+1,m+1);
        for(int l=0;l<num;l++){
            res+=tmp;
        }
        res += fun(s, m + 1, length);
        return res;
    }
}



