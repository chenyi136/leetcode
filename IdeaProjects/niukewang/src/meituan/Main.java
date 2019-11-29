package meituan;

import java.util.ArrayList;
import java.util.Scanner;

import java.util.*;

public class Main {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        int n=sc.nextInt();
        int m=sc.nextInt();
        int[][] arr=new int[n][m];
        List<Integer> odds=new ArrayList<>();
        List<Integer> even=new ArrayList<>();
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                arr[i][j]=sc.nextInt();
                if((i+j)%2==0) even.add(arr[i][j]);
                else odds.add(arr[i][j]);
            }
        }
        Collections.sort(odds);
        Collections.sort(even);
        int jiCur=odds.get(0);
        int ouCur=odds.get(0);
        int jiCount=1;
        int ouCount=1;
        List<Myclass> jiEntry=new ArrayList<>();
        List<Myclass> ouEntry=new ArrayList<>();
        for (int i = 1; i < odds.size(); i++) {
            if(odds.get(i)==jiCur){
                jiCount++;
            }else{
                jiEntry.add(new Myclass(jiCur, jiCount));
                jiCur=odds.get(i);
                jiCount=1;
            }
        }
        jiEntry.add(new Myclass(jiCur, jiCount));
        for (int i = 1; i < even.size(); i++) {
            if(even.get(i)==ouCur){
                ouCount++;
            }else{
                ouEntry.add(new Myclass(ouCur, ouCount));
                ouCur=even.get(i);
                ouCount=1;
            }
        }
        ouEntry.add(new Myclass(ouCur, ouCount));
        Comparator<Myclass> c=new Comparator<Myclass>() {
            public int compare(Myclass o1, Myclass o2) {
                return o2.num-o1.num;
            }
        };
        Collections.sort(jiEntry, c);
        Collections.sort(ouEntry, c);
        if(jiEntry.get(0).val!=ouEntry.get(0).val){
            System.out.println(odds.size()-jiEntry.get(0).num+even.size()-ouEntry.get(0).num);
        }else{
            int resji=odds.size()-jiEntry.get(0).num;
            if(ouEntry.size()==1){
                resji+=even.size();
            }else{
                resji+=even.size()-ouEntry.get(1).num;
            }

            int resou=even.size()-ouEntry.get(0).num;
            if(jiEntry.size()==1){
                resou+=odds.size();
            }else{
                resou+=odds.size()-jiEntry.get(1).num;
            }
            System.out.println(Math.min(resji, resou));
        }
    }
}
class Myclass{
    int val;
    int num;
    public Myclass(int val, int num) {
        super();
        this.val = val;
        this.num = num;
    }

}
