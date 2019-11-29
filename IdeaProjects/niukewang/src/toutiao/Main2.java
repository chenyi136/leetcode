package toutiao;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Main2 {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        List<Integer> pos=new ArrayList<>();
        List<Integer> neg=new ArrayList<>();
        String in=sc.nextLine();
        String[] ss = in.split(" ");
        for (int i = 0; i < ss.length; i++) {
            int nextInt = Integer.parseInt(ss[i]);
            if(nextInt>0) pos.add(nextInt);
            else neg.add(nextInt);
        }
        String s="";
        int m=pos.size(),n=neg.size();
        int index1=0,index2=0;
        while(index1<m&&index2<n){

            pos.remove(0);
            s+=neg.get(0)+" ";
            neg.remove(0);
        }
        while(pos.size()>0){
            s+=pos.get(0)+" ";
            pos.remove(0);
        }
        while(neg.size()>0){
            s+=neg.get(0)+" ";
            neg.remove(0);
        }
        s=s.trim();
        System.out.println(s);
    }
}
