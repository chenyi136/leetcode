/**
 * @ClassNameFriendCircle
 * @Author jianwen
 * @Date 19-9-15 上午12:52
 * @Version V1.0
 */
public class FriendCircle {
    public int numOfCircle(int[][] M) {
        int n = M.length;
        int res = n;
        int[] root = new int[n];
        for (int i = 0; i < n; i++) {
            root[i] = i;
        }
        for (int i = 0; i < n; i++) {
            for (int j = i + 1; j < n; j++) {
                if (M[i][j] == 1) {
                    unio(root, i, j);
                    res--;
                }
            }
        }
        return res;
    }


    //寻找根的过程 find
    int getRoot(int[] root,int i){
        while(i!=root[i]){

            i=root[i];
        }
        return i;
    }
    void unio(int[] root,int i,int j){
        // unio 的过程，可以提出来
        int p1 = getRoot(root, i);
        int p2 = getRoot(root, j);
        if (p1 != p2) root[p2] = p1;
    }
}
