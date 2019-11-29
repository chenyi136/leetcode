import java.util.HashSet;
import java.util.Set;

public class leet36 {
    public boolean isValidSudoku(char[][] board) {
        // validate rows
        for (int r = 0; r < board.length; r++) {
            Set<Character> set = new HashSet<>();
            for (int c = 0; c < board[0].length; c++) {
                char ch = board[r][c];
                if (ch != '.') {
                    if (set.contains(ch)) return false;
                    else set.add(ch);
                }
            }
        }

        // validate cols
        for (int c = 0; c < board[0].length; c++) {
            Set<Character> set = new HashSet<>();
            for (int r = 0; r < board.length; r++) {
                char ch = board[r][c];
                if (ch != '.') {
                    if (set.contains(ch)) return false;
                    else set.add(ch);
                }
            }
        }

        // validate the nine 3x3 squares
        for (int r = 0; r < board.length; r += 3) {
            for (int c = 0; c < board[0].length; c += 3) {
                Set<Character> set = new HashSet<>();
                for (int r2 = r; r2 < r+3; r2++) {
                    for (int c2 = c; c2 < c+3; c2++) {
                        char ch = board[r2][c2];
                        if (ch != '.') {
                            if (set.contains(ch)) return false;
                            else set.add(ch);
                        }
                    }
                }
            }
        }

        return false;

    }
}
