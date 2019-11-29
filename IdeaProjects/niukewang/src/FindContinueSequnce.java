import java.util.ArrayList;

public class FindContinueSequnce {
    public static ArrayList<ArrayList<Integer>> findSequnce(int sum) {
        ArrayList<ArrayList<Integer>> result=new ArrayList<>();
       if(sum<3) return result;

       int small=1,big=2;
       int cursum=small+big;
       int mid=(sum+1)/2;
       while(small<mid){
           if(cursum==sum){
               ArrayList<Integer> templist=new ArrayList<Integer>();
               for(int i=small;i<=big;i++){
                   templist.add(i);
               }
               result.add(templist);
               big++;
               cursum+=big;
           }else if(cursum<sum){big++;cursum+=big;}
           else {cursum-=small;small++;}
       }
       return result;
    }

    public static void main(String[] args) {
        ArrayList<ArrayList<Integer>> arrayList=findSequnce(15);
        for (ArrayList list : arrayList) {
            System.out.println(list);
        }
    }
}
