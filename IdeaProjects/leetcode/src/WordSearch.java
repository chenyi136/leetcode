public class WordSearch {
    static boolean[][] visited;
    public static boolean exist(char[][] board, String word) {
        visited = new boolean[board.length][board[0].length];
        int m=board.length;
        int n=board[0].length;
        if(board==null||m==0||n==0) return false;
        for(int i=0;i<m;i++){
            for(int j=0;j<n;j++){
                if(wordContains(board,word,i,j,0)) return true;

            }

        }
        return false;
    }


    public static boolean wordContains(char[][] board,String word,int i,int j,int index){
        if(index == word.length()){
            return true;
        }
        if(i >= board.length || i < 0 || j >= board[i].length || j < 0 || board[i][j] != word.charAt(index) || visited[i][j]){
            return false;
        }

        visited[i][j] = true;
        if(wordContains(board,word,i+1,j,index+1)||
                    wordContains(board,word,i-1,j,index+1)||
                    wordContains(board,word,i,j+1,index+1)||
                    wordContains(board,word,i,j-1,index+1)) return true;


        visited[i][j] = false;

        return false;



        }

    public static void main(String[] args) {
        char[][]chas={{'A','B','C','D'},{'S','F','C','S'},{'A','D','E','E'}};
        System.out.println(exist(chas,"ABCCED"));
    }


}
