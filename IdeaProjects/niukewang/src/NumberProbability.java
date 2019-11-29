import java.text.DecimalFormat;

public class NumberProbability {
    public static void main(String[] args) {
        printProbability_1(12);

    }

    // 骰子最大点数
    static int g_maxValue = 6;

    /*
     * 方法一：基于递归实现
     * 缺点：时间复杂度过高
     */
    public static void printProbability_1(int number) {
        long start = System.currentTimeMillis();
        if (number < 1)
            return;
        int maxSum = number * g_maxValue;
        // probabilities数组用来存储每个sum出现的次数，范围是从number到maxSum
        int[] probabilities = new int[maxSum - number + 1];
        // 数组初始化
        for (int i = 0; i < maxSum - number + 1; i++) {
            probabilities[i] = 0;
        }

        probability(number, probabilities);
        double total = Math.pow((double) g_maxValue, (double) number);
        // 打印出从number到maxSum每个数字出现的概率
        DecimalFormat df = new DecimalFormat("0.000");
        System.out.print("递归实现：");
        for (int i = 0; i < maxSum - number + 1; i++) {
            System.out.print(df.format(probabilities[i] / total) + " ");
        }
        System.out.println();
        long end = System.currentTimeMillis();
        long result = end - start;
        System.out.println("运行时间：" + result);

    }

    private static void probability(int number, int[] probabilities) {
        for (int i = 1; i <= g_maxValue; i++)
            probability(number, number - 1, i, probabilities);

    }

    // current表示当前处理的是第几个骰子
    private static void probability(int number, int current, int sum, int[] probabilities) {
        // 当current==0，说明所有的骰子处理结束，递归结束
        if (current == 0) {
            probabilities[sum - number]++;
            return;
        }
        for (int i = 1; i <= g_maxValue; i++) {
            probability(number, current - 1, sum + i, probabilities);
        }
    }
    public static void printProbability_2(int number) {
        long start = System.currentTimeMillis();
        if (number < 1)
            return;
        int maxSum=number*g_maxValue;
        int[][] probabilities=new int[2][maxSum+1];
        int flag=0;
        for(int i=1;i<=g_maxValue;i++){
            probabilities[flag][i]=1;

        }
        for(int k=2;k<=number;k++){
            flag=1-flag;
            for(int i=1;i<k;i++){
                probabilities[flag][i]=0;
            }
            for(int i=k;i<=g_maxValue*k;i++){
                int count=1;
                probabilities[flag][i]=0;
                while(i-count>0&&count<=6){
                    probabilities[flag][i]+=probabilities[1-flag][i-count];
                    count++;
                }
            }
        }
    }

}
