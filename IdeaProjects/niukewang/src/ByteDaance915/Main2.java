package ByteDaance915;

import java.util.Iterator;
import java.util.Map;
import java.util.Scanner;
import java.util.TreeMap;

/**
 * @ClassNameMain2
 * @Author jianwen
 * @Date 19-9-15 下午4:39
 * @Version V1.0
 */
public class Main2 {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        long n=sc.nextInt();
        TreeMap<Long,Long> map=new TreeMap<>();
        for(int i=0;i<n;i++){
            long t=sc.nextLong();
            long c=sc.nextLong();
            map.put(t,c);
        }
        long time=0,max=Long.MAX_VALUE,num=0;
        Iterator it=map.entrySet().iterator();
        Map.Entry<Integer,Integer> entry=(Map.Entry<Integer, Integer>) it.next();
        time=entry.getKey();
        num=entry.getValue();
        max=num;
        while(it.hasNext()){
            Map.Entry<Integer,Integer> ent=(Map.Entry<Integer, Integer>) it.next();
            long t=ent.getKey();
            long cha=t-time;
            if(num-cha>=0){
                num=num-cha+ent.getValue();
                max=Math.max(max,num);
            }else num=0;

            time=t;

        }
        long result=time+num;
        System.out.println(result+" "+max);
    }

}
