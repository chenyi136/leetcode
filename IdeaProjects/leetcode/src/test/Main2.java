package test;

import org.omg.PortableInterceptor.INACTIVE;
import sun.reflect.generics.tree.Tree;

import java.text.DecimalFormat;
import java.util.*;

/**
 * @ClassNameMain2
 * @Author jianwen
 * @Date 19-9-26 下午7:47
 * @Version V1.0
 */
public class Main2 {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        int n=sc.nextInt();
        Map<Integer,Integer> map = new TreeMap<Integer, Integer>(new Comparator<Integer>(){
            public int compare(Integer obj1,Integer obj2){
                //降序排序
                return obj2.compareTo(obj1);
            }
        });
        for(int i=0;i<n;i++){
           int a=sc.nextInt();
           int t=sc.nextInt();
           map.put(t,a);
        }
        double res=0.0f;
        double v=0.0f;
        for(int temp:map.keySet()){
            res+=(v*temp+0.5*map.get(temp)*temp*temp);
            v+=temp*map.get(temp);
        }

        float b = (float)(Math.round(res*10))/10;


        System.out.println(b);



    }
}
