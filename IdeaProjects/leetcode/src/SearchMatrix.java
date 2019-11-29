public class SearchMatrix {
    public boolean search(int[][] matrix, int target) {
        int m=matrix.length,n=matrix[0].length;
        int i=0,j=n-1;
        while(i<m||j>=0){
            if(matrix[i][j]==target) return true;
            else if(matrix[i][j]>target) j--;
            else if(matrix[i][j]<target) i++;

        }
        return false;

    }
}
