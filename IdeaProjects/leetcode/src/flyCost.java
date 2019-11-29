import java.util.Arrays;

/**
 * @ClassNameflyCost
 * @Author jianwen
 * @Date 19-9-13 下午8:47
 * @Version V1.0
 */
public class flyCost {
    public static void main(String[] args) {
        int[][] costs={{10,20},{30,200},{400,50}};
        System.out.println(twoCitySchedCost(costs));
    }
    public static int twoCitySchedCost(int[][] costs) {
        // sorting based on the difference of flying cost to A and B.
        //　飞往b 城的花费减去飞往　a城的花费，越大(正的越多)飞往a 城划算，越小（负的越多）飞往　ｂ城越划算
        Arrays.sort(costs, (a, b) ->{
            return (a[1] - a[0]) - (b[1] - b[0]);
        });

        int totalCost = 0, len = costs.length, mid = len/2;

        for(int i=0; i<len; i++){

            if(i < mid){

                totalCost += costs[i][1];
            }
            else{

                totalCost += costs[i][0];
            }
        }

        return totalCost;
    }
}
