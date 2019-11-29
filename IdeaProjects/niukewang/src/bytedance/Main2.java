package bytedance;

import java.util.*;
import java.util.Map.Entry;

public class Main2 {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        int n=sc.nextInt();
        for (int i = 0; i < n; i++) {
            fun();
        }
    }

    private static void fun() {
        Scanner sc=new Scanner(System.in);
        int m=sc.nextInt();
        Map<String,Integer> map=new HashMap<>();
        Map<String,Integer> curmap=new HashMap<>();
        for (int i = 0; i < m; i++) {
            int num=sc.nextInt();
            Map<String,Integer> newmap=new HashMap<>();
            for (int j = 0; j < num; j++) {
                String s=sc.nextInt()+","+sc.nextInt();
                if(curmap.containsKey(s)){
                    newmap.put(s, curmap.get(s)+1);
                    if(map.containsKey(s)){
                        if(map.get(s)<newmap.get(s)){
                            map.put(s, newmap.get(s));
                        }
                    }else{
                        map.put(s, newmap.get(s));
                    }
                }else{
                    newmap.put(s, 1);
                    if(map.containsKey(s)){
                        if(map.get(s)<newmap.get(s)){
                            map.put(s, newmap.get(s));
                        }
                    }else{
                        map.put(s, newmap.get(s));
                    }
                }
                curmap=newmap;
            }
        }
        int res=1;
        for (Entry<String, Integer> ent : map.entrySet()) {
            res=Math.max(res, ent.getValue());
        }
        System.out.println(res);
    }
}