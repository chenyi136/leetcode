import org.omg.PortableInterceptor.INACTIVE;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Scanner;

/**
 * @ClassNameMain3
 * @Author jianwen
 * @Date 19-9-27 下午8:57
 * @Version V1.0
 */
public class Main3 {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        ArrayList<ArrayList<Integer>> graph=new ArrayList<>();
        String ed=sc.nextLine();
        String[]s =ed.split(" ");
        int size=s.length;

        ArrayList<Integer> temp=new ArrayList<>();
        for(String ts:s){
            temp.add(Integer.valueOf(ts));
        }
        graph.add(temp);
        for(int i=0;i<size-1;i++){
            String e=sc.nextLine();
            String[] is =e.split(" ");

            ArrayList<Integer> tp=new ArrayList<>();
            for(String ts:is){
                tp.add(Integer.valueOf(ts));
            }
            graph.add(tp);
        }

        boolean[] flag=new boolean[graph.size()];
        int[] pre=new int[graph.size()];
        int [] distance=new int[graph.size()];
//        for(int i=0;i<distance.length;i++){
//            distance[i]=Integer.MAX_VALUE;
//        }
        distance[0]=0;
        for(int i=1;i<graph.get(0).size();i++){
            distance[i]=graph.get(0).get(i);
            if(distance[i]!=-1){
                pre[i]=0;
            }

        }
        flag[0]=true;
        int len=graph.size();
        for(int i=1;i<len;i++){
            int temp2=Integer.MAX_VALUE;
            int u=0;
            for(int j=0;j<len;j++){
                if(!flag[j]&&distance[j]<temp2){
                    u=j;
                    temp2=distance[j];
                }
            }
            flag[u]=true;

            for(int j=0;j<len;j++){
                if(!flag[j]&&graph.get(u).get(j)<Integer.MAX_VALUE){
                    if(distance[u]+graph.get(u).get(j)<distance[j]){
                        distance[j]=distance[u]+graph.get(u).get(j);
                        pre[j]=u;
                    }
                }
            }
        }

        for(int i=1;i<len;i++){
            System.out.println(distance[i]);
        }




    }
}
