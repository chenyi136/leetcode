public class MatrixStr {
    public static boolean hasPath(char[][] matrix,char[] str){
        int rows=matrix.length,cols=matrix[0].length;
        if(rows<1||cols<1||str==null) return false;
        int[][] visited=new int[rows][cols];
        for(int i=0;i<rows;i++){
            for(int j=0;j<cols;j++){
                if(findPath(matrix,str,visited,i,j,0))
                    return true;
            }
        }
        return false;

    }
    public static boolean findPath(char[][] matrix,char[]str ,int[][] visited,int row,int col,int path){
        if(path==str.length) return true;
        boolean hasPath=false;
        if(row>=0 && row< matrix.length&& col>=0 && col<matrix[0].length&&matrix[row][col]==str[path]&&visited[row][col]==0){
            path++;
            visited[row][col]=1;
            hasPath=findPath(matrix,str,visited,row-1,col,path)||findPath(matrix,str,visited,row+1,col,path)||
                    findPath(matrix,str,visited,row,col-1,path)||findPath(matrix,str,visited,row,col+1,path);

            if(!hasPath){
                path--;
                visited[row][col]=0;
            }

        }
        return hasPath;
    }
}
