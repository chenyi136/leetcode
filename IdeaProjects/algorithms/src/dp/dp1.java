package dp;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class dp1 {
    public static void main(String[] args) {

        int n = 10;
        int[] p = new int[]{0, 1, 5, 8, 9, 10, 17, 17, 20, 24, 30};
        for (int i = 0; i <= 10; i++) {
            System.out.println("当钢条为" + i + ":");

            printExtend(p, i);

        }
    }


    public static int buttomUp(int[] p, int n) {
        int[] r = new int[n + 1];
        r[0] = 0;
        for (int j = 1; j <= n; j++) {
            int q = -1;
            for (int i = 1; i <= j; i++) {
                q = Math.max(q, p[i] + r[j - i]);
            }
            r[j] = q;
        }
        return r[n];
    }

    public static ArrayList<ArrayList> extendButtonUp(int[] p, Integer n) {
        ArrayList<ArrayList> l = new ArrayList<ArrayList>();

        int[] r = new int[n + 1], s = new int[n + 1];
        r[0] = 0;
        for (int j = 1; j < n + 1; j++) {
            int q = -1, i;
            for (i = 1; i <= j; i++) {
                q = Math.max(q, p[i] + r[j - i]);
            }
            r[j] = q;
            s[j] = i;
        }
        ArrayList arrayListl = new ArrayList(Arrays.asList(r));
        ArrayList arrayLists = new ArrayList(Arrays.asList(s));

        l.add(arrayListl);
        l.add(arrayLists);

        return l;
    }


    public static void printExtend(int[] p, int n) {
        List list = extendButtonUp(p, n);
        ArrayList s = (ArrayList) list.get(1);
        int k = n;
        while (k > 0) {
            System.out.println(s.get(k));
            k = k - (int) s.get(k);
        }

    }


}

