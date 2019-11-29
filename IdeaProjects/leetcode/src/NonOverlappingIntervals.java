import java.util.Arrays;

/**
 * @ClassNameNonOverlappingIntervals
 * @Author jianwen
 * @Date 19-9-15 上午12:25
 * @Version V1.0
 */
public class NonOverlappingIntervals {
    public static int eraseOverlapIntervals(int[][] intervals) {

        int count=0,n=intervals.length;
        int last=0;
        for(int i=1;i<n;i++){
            if(intervals[i][0]<intervals[last][1]){
                count++;
                if(intervals[i][1]<intervals[last][i]) last=i;
            }else{
                last=i;
            }
        }
        return count;
    }

    public static void main(String[] args) {
        int[][] num={{1,2},{2,4},{2,3},{3,4}};
        Arrays.sort(num,(a,b)->{
            return a[0]-b[0];
        });
        System.out.println(eraseOverlapIntervals(num));
    }

}
