import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

 class pair{
    int weight;
    int number;
    pair(int a,int b){
        this.weight=a;
        this.number=b;
        }

     public void setWeight(int weight) {
         this.weight = weight;
     }

     public void setNumber(int number) {
         this.number = number;
     }
 }

public class MicBank {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);

        String str=sc.nextLine();
        String[] strs=str.split(" ");

        int[] nums=new int[strs.length+1];

        for(int i=1;i<strs.length;i++){
            nums[i]=Integer.valueOf(strs[i]);
        }
        List<pair> goods=new ArrayList<>(7);

        for(int j=1;j<goods.size();j++){
            goods.get(j).setWeight(j);
            goods.get(j).setNumber(nums[j]);
        }
        System.out.println(helper(goods));
    }

    private static  int helper(List<pair> goods){
        int count=0;
        int m=goods.size();
        int container=6;
        while(container<=0&&Isempty(goods)) {
            container=6;
            count++;
            int min;
            int i;
            for (i = 1; i < goods.size(); i++) {
                if (goods.get(i).number > 0 && i > container)
                    break;

            }
            container -= i;
        }
        return count;



    }

     static boolean Isempty(List<pair> goods){

        for(pair p:goods){
            if(p.number>0) return false;
        }
        return true;
    }
}
