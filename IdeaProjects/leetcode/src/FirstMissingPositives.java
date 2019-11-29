/**
 * @ClassNameFirstMissingPositives
 * @Author jianwen
 * @Date 19-11-3 上午12:57
 * @Version V1.0
 */
public class FirstMissingPositives {
    public static void main(String[] args) {
        int[] a={3,4,-1,1};
        System.out.println(firstMissingPositive(a));
    }

    public static  int firstMissingPositive(int[] A) {
        if(A==null || A.length==0)
        {
            return 1;
        }
        for(int i=0;i<A.length;i++)
        {
//            if(A[i]<=A.length && A[i]>0 && A[A[i]-1]!=A[i])
//            {
//                int temp = A[A[i]-1];
//                A[A[i]-1] = A[i];
//                A[i] = temp;
//                i--;
//            }
            while(A[i]>0 && A[i]<=i+1 && A[i] != A[A[i]-1]){
                int temp = A[A[i]-1];
                A[A[i]-1] = A[i];
                A[i] = temp;
                i--;
            }
        }
        for(int i=0;i<A.length;i++)
        {
            if(A[i]!=i+1)
                return i+1;
        }
        return A.length+1;
    }
}
