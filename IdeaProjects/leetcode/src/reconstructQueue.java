import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;

/**
 * @ClassNamereconstructQueue
 * @Author jianwen
 * @Date 19-9-25 上午12:05
 * @Version V1.0
 */

/**
 * 思路：　排序：身高降序，前面比自己高的人数升序
 *        同等身高时，前面比自己高的人数越少则越靠前，所以遍历插入，而低身高的人对高身高的不影响
 */
public class reconstructQueue {
    public int[][] reconstruct(int[][] people){
        int n=people.length;
        Arrays.sort(people,(o1,o2)->{
            return o1[0]==o2[0]?o1[1]-o2[1]:o2[0]-o1[0];
        });
        List<int[]> output=new LinkedList<>();
        for(int[] person:people ){
            // 在指定位置插入元素
            output.add(person[1],person);
        }
        // 记住该写法
        return output.toArray(new int[n][2]);
    }
}
