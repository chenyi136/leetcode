import java.util.Scanner;

public class Main { public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        while(sc.hasNext()) {
            int n = sc.nextInt();

            System.out.println(GetResult(n));
        }

}

    public static String GetResult(int N) {
        if (N <= 0) throw new IllegalArgumentException();
        int line = 1;
        int sum = 0;
        while (sum < N) {
            sum+=line;
            line++;
        }
        line--;
        int position = sum - N;
        if (line % 2 == 0) {
            position = line - position - 1;
        }
        int left = 1 + position;
        int right = line - position;
        return left + "/" + right;
    }

}