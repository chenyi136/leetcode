import java.util.Scanner;

/**
 * @ClassNameTest
 * @Author jianwen
 * @Date 19-9-25 下午2:05
 * @Version V1.0
 */
import java.util.Scanner;

public class Test {

        public static void main(String[] args) {
            Scanner scan=new Scanner(System.in);
            System.out.println("请输入割圆次数：");
            int n=scan.nextInt();
            cut(n);

        }
        static void cut(int n){
            double y=1.0;
            int i;
            double t=1.0;
            for( i=0;i<n;i++){
                t=3*Math.pow(2, i)*y;

                y=Math.sqrt(2-Math.sqrt(4-y*y));

            }

            System.out.println(t);

        }
    }


