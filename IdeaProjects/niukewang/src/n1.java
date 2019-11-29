
public class n1 {
    public static void main(String[] args){
        int[][] a={{1,2,8,9},{2,4,9,12},{4,7,10,13},{6,8,11,15}};

        System.out.println(Find(7,a));
    }
    public static boolean Find(int target, int [][] array) {
        int m=array.length,n=array[0].length;
        if(m==0||n==0) return false;
        int row=0;
        int cow=n-1;
        while(row<m&&cow>=0){
            if(array[row][cow]==target){
                return true;
            }else if(array[row][cow]>target){
                cow--;
            }else{
                row++;
            }
        }
        return false;

    }
}
