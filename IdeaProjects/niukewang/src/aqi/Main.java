package aqi;

import java.util.Arrays;
import java.util.Scanner;

/**
 * @ClassNameMain
 * @Author jianwen
 * @Date 19-9-11 下午2:25
 * @Version V1.0
 */
public class Main {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        String input=sc.nextLine();

        int index1=input.indexOf('=');
        int index2=input.indexOf(',');

       String s=(input.substring(index1+2,index2));
       int p=Integer.valueOf(s);

        int index3=input.indexOf('[');
        int index4=input.indexOf(']');
        String s1=input.substring(index3+1,index4);
        String[] v= s1.split(",");
        int[] nums=new int[v.length];
        for(int i=0;i<v.length;i++){
            nums[i]=Integer.valueOf(v[i]);
        }

        Arrays.sort(nums);
        int count=0;
        int max=0;
        int i=0,j=nums.length-1;
        while(i<=j){
            if(p>=nums[i]){
                count++;
                p-=nums[i++];
                max=Math.max(count,max);

            }else if(count>0){
                count--;
                p+=nums[j--];
            }else{
                break;
            }
        }
        System.out.println(max);
    }
}
