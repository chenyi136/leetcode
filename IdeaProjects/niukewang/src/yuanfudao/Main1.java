package yuanfudao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Scanner;

/**
 * @ClassNameMain1
 * @Author jianwen
 * @Date 19-8-24 下午4:29
 * @Version V1.0
 */
public class Main1 {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        int n=sc.nextInt();
        int m=sc.nextInt();
        int [] nums=new int[n];
        for(int i=0;i<n;i++){
            nums[i]=sc.nextInt();
        }
        HashMap<Integer,Integer> count=new HashMap<>();
        ArrayList<Integer> re=new ArrayList<>();
        for(int temp:nums){
            count.put(temp,count.getOrDefault(temp,0)+1);
        }
        String result="";
        for(int i=0;i<n;i++){
            if(count.get(nums[i])<=m){
               re.add(nums[i]);
            }
        }
        for(int i=0;i<re.size()-1;i++){
            result=result+re.get(i)+" ";
        }
        result=result+re.get(re.size()-1);
        System.out.println(result);




    }

}
