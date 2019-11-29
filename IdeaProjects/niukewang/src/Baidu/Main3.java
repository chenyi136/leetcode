package Baidu;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Scanner;
import java.util.Stack;

/**
 * @ClassNameMain3
 * @Author jianwen
 * @Date 19-9-19 下午5:08
 * @Version V1.0
 */
public class Main3 {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        HashSet<Integer>res=new HashSet<Integer>();
        Stack<Integer> st=new Stack();
        int n=sc.nextInt();
        int m=sc.nextInt();
        ArrayList<Integer>[] eds=new ArrayList[n+1];
        for(int i=0;i<m;i++){
            int n1=sc.nextInt();
            int n2=sc.nextInt();
            eds[n1].add(n2);
        }
//        int start=sc.nextInt();
//        int  end=sc.nextInt();
//        for(int i=0;i<eds[start].size();i++){
//            int index=eds[start].get(i);
//            helperPer(eds,index,end,res);
//        }



    }
//    public static void helperPer(  ArrayList<Integer>[] eds,int index,int end, HashSet<Integer> res){
//        if(index==end) {res.add(index); return}
//        while(index!=end){
//            index=des[]
//            for()
//        }
//    }
}
