import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

public class LastRemaining {
    public static void main(String[] args) {
        System.out.println(LastRemaining_Solution(7,2));
    }
    public static int LastRemaining_Solution(int n, int m) {
        List<Integer> list=new LinkedList<Integer>();
        for(int i=0;i<n;i++){list.add(i);}
        // 要删除元素的位置
        int idx = 0;
        // 开始计数的位置
        int start = 0;
        while(list.size()>1){
            // 只要移动m-1次就可以移动到下一个要删除的元素上
            for(int i=1;i<m-1;i++){
                idx=(idx+1)%n;

            }
            list.remove(idx);
        }
        return ((LinkedList<Integer>) list).getFirst();
    }
}
