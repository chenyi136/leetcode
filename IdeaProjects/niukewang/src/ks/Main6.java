package ks;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Scanner;

/**
 * @ClassNameMain6
 * @Author jianwen
 * @Date 19-9-16 下午9:27
 * @Version V1.0
 */
public class Main6 {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        String s=sc.nextLine();
        HashMap<Integer,String[]> map=new HashMap<>();
        String[] str={"a","b","c"};
        map.put(2,str);
        map.put(3,new String[]{"d","e","f"});
        map.put(4,new String[]{"g","h","i"});
        map.put(5,new String[]{"j","k","l"});
        map.put(6,new String[]{"m","n","o"});
        map.put(7,new String[]{"p","q","r","s"});
        map.put(8,new String[]{"t","u","v"});
        map.put(7,new String[]{"w","x","y","z"});

        ArrayList<String> res=new ArrayList<>();
        StringBuilder sb=new StringBuilder();
        helper(s,sb,0,map,res);
        System.out.println(res);





    }
    public static void helper(String s,StringBuilder sb,int index,HashMap<Integer,String[]> map,ArrayList<String>list){
        if(index==s.length()){
            list.add(sb.toString());
            return;
        }
        int temp=s.charAt(index)-'0';
        String[] str1=map.get(temp);
        for(int j=0;j<str1.length;j++){
            sb.append(str1[j]);
            helper(s,sb,index+1,map,list);
            sb.deleteCharAt(sb.length()-1);
        }
    }
}
