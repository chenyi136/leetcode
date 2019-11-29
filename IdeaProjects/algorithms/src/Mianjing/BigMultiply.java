package Mianjing;

import java.util.Scanner;

public class BigMultiply {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        while (sc.hasNextLine()) {
            String s = sc.nextLine();
            String[] sn = s.split(" ");
            System.out.println(multiply(sn[0], sn[1]));
        }
    }


    public static String multiply(String s1, String s2) {
        if (s1.equals("0") || s2.equals("0")) return "0";
        int m = s1.length(), n = s2.length();
        int[] numbers = new int[m + n];
        StringBuilder sb = new StringBuilder();

        /**
         先把字符转倒过来，从前往后乘
         */
        String n1 = new StringBuilder(s1).reverse().toString();
        String n2 = new StringBuilder(s2).reverse().toString();
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                numbers[i + j] += (n1.charAt(i) - '0') * (n2.charAt(j) - '0');
            }
        }
        for (int i = 0; i < numbers.length; i++) {
            int mod = numbers[i] % 10;
            int carry = numbers[i] / 10;
            if (i + 1 < numbers.length) {
                numbers[i + 1] += carry;
            }
            sb.insert(0, mod);

        }
        while (sb.charAt(0) == '0' && sb.length() > 1) {
            sb.deleteCharAt(0);
        }
        return sb.toString();

    }
}
