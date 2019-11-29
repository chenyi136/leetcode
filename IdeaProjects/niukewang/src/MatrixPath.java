public class MatrixPath {
    public boolean hasPath(char[] matrix, int rows, int cols, char[] str)
    {
        boolean[] visited=new boolean[rows*cols];
        if(str==null||str.length==0) return false;
        for(int row=0;row<rows;row++){
            for(int col=0;col<cols;col++){
                if(findpath(matrix,rows,cols,row,col,0,str,visited));
                return true;
            }
        }

        return false;
    }

    boolean findpath(char[] matrix,int rows,int cols,int row,int col,int index,char[]str,boolean[] visited){

        if(index==str.length) return true;
        if(row<0||row>rows||col<0||col>cols||visited[(row-1)*cols+col]==true||matrix[(row-1)*cols+col]!=str[index]) return false;
        visited[(row-1)*cols+col]=true;
        if(findpath(matrix,rows,cols,row+1,col,index+1,str,visited)||findpath(matrix,rows,cols,row-1,col,index+1,str,visited)
                ||findpath(matrix,rows,cols,row,col-1,index+1,str,visited)||findpath(matrix,rows,cols,row,col+1,index+1,str,visited))
            return true;
        visited[(row-1)*col+cols]=false;
        return false;
    }


}
