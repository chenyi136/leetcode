import java.util.LinkedList;

public class circlenm {
    public static void main(String[] args) {
        printnumber(7,2);
    }
    public static void printnumber(int n,int m){
        if(n<1||m<1) return ;
        LinkedList<Integer> list=new LinkedList<Integer>();
        for(int i=1;i<=n;i++){
            list.add(i);
        }
        int index=0;
        int start=0;
        while(list.size()>0){
            for(int i=1;i<m;i++){
                index=(index+1)%list.size();
            }

            System.out.println(list.get(index));
            list.remove(index);
        }
        return;
    }
}
