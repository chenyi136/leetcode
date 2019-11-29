package Mianjing;

import java.util.PriorityQueue;
import java.util.Scanner;

import static java.lang.Integer.parseInt;

/**
 * @ClassNameKthNode
 * @Author jianwen
 * @Date 19-10-16 上午12:40
 * @Version V1.0
 */
public class KthNode {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        String[] str=sc.nextLine().replace("[","").replace("]","").split(",");


        int[] data = new int[str.length];
        for (int i = 0; i < data.length; i++) {
            data[i] = parseInt(str[i]);
        }
        System.out.println(findKthNum(data, 3));
//        System.out.println(findKthNum1(data, 3));
    }

    private static int findKthNum(int[] data, int k) {

        if(data==null||data.length==0||k<0||k>data.length) return -1;
        int begin = 0, end = data.length - 1;
//        int pos = 0;
//        while (begin <= end) {
//            pos = partion(data, begin, end);
//            if (pos == k - 1) {
//                return data[pos];
//            } else if (pos > k - 1) {
//                end = pos - 1;
//            } else {
//                begin = pos + 1;
//            }
//        }
//        return -1;
        int index=partion(data,begin,end);
        while(index!=k-1){
            if(index>k-1) {
                end=index-1;
                index=partion(data,begin,end);
            }else{
                begin=index+1;
                index=partion(data,begin,end);
            }
        }

        return data[index];
    }




    private static int partion(int[] data, int begin, int end) {
        int temp = data[begin];
        while (begin < end) {
            while (begin < end && data[end] <= temp) {
                end--;
            }
            swap(data, begin, end);
            while (begin < end && data[begin] > temp) {
                begin++;
            }
            swap(data, begin, end);
        }
        return begin;
    }


    public static void swap(int[] arr, int i, int j) {
        if (arr == null || i >= arr.length || j >= arr.length || i < 0 || j < 0) {
            return;
        }
        int temp = arr[i];
        arr[i] = arr[j];
        arr[j] = temp;
    }



    //方法2，建小顶堆，时间复杂度O(n*logk),空间复杂度O(k)
    public static int findKthNum1(int data[], int k) {
        PriorityQueue<Integer> heap = new PriorityQueue<>();
        for (int item : data) {
            if (heap.size() < k) {
                heap.add(item);
            } else if (item > heap.peek()) {
                heap.poll();
                heap.add(item);
            }
        }
        return heap.poll();
    }
}
