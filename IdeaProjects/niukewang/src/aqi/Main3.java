package aqi;


import java.util.*;


public class Main3 {

    public static void main(String[] args){
        Scanner in = new Scanner(System.in);
        String[] A = in.nextLine().split(" ");
        String[] B = in.nextLine().split(" ");
        int target = in.nextInt();
        int[] sons = new int[A.length];
        int[] parents = new int[B.length];
        for (int i=0;i<A.length;i++){
            sons[i] = Integer.valueOf(A[i]);
            parents[i] = Integer.valueOf(B[i]);
        }
        Queue<Integer> queue = new LinkedList<>();
        queue.offer(target);
        int sum = 0;
        while (!queue.isEmpty()){
            int par = queue.poll();
            for (int i=0;i<parents.length;i++){
                if (parents[i] == par){
                    queue.offer(sons[i]);
                    sum++;
                }
            }
        }
        if (sum == 0) {
            for (int i=0;i<sons.length;i++){
                if (sons[i] == target){
                    sum++;
                }
            }
            System.out.println(sum);
        } else {
            System.out.println(sum + 1);
        }
    }

}
