import java.util.ArrayList;
import java.util.List;

/**
 * @ClassNameSpiralMatrix2
 * @Author jianwen
 * @Date 19-10-8 下午9:13
 * @Version V1.0
 */
public class SpiralMatrix2 {
    public List<Integer> spiralOrder(int[][] matrix){
        List<Integer> res=new ArrayList<>();
        if(matrix==null||matrix.length==0) return  res;
        int rowNum=matrix.length,colNum=matrix[0].length;
        int rowStart=0,rowEnd=rowNum-1,colStart=0,colEnd=colNum-1;

        while(rowStart<=rowEnd&&colStart<=colEnd){
            for(int i=colStart;i<=colEnd;i++){
                res.add(matrix[rowStart][i]);
            }
            rowStart++;
            for(int i=rowStart;i<=rowEnd;i++){
                res.add(matrix[i][colEnd]);
            }
            colEnd--;
            if(rowStart<=rowEnd){
                for(int i=colEnd;i>=colStart;i--){
                    res.add(matrix[rowEnd][i]);
                }
            }
            rowEnd--;
            if(colStart<=colEnd){
                for(int i=rowEnd;i>=rowStart;i--){
                    res.add(matrix[i][colStart]);
                }
            }
            colStart++;
        }
        return res;
    }


}
