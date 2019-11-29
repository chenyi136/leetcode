package sort;



public class Merge {
    private static int aux[];

    Merge(int len){
        aux = new int[len];
    }
    /**
     * 归并的方法
     * 原地归并：以第一个元素为基数，使用两个指针p,q
     * 	从左向右。左侧没有了加右侧，右侧没有了加左侧，左右侧都存在的时候谁有加谁
     * 将 low...mid 和 mid+1...high 进行归并
     * */
    private static void merge(int a[],int low,int mid,int high){
        int p = low,q = mid+1;
        for(int i = low; i <= high;i++)// 复制数组
            aux[i] = a[i];
        for(int index = low; index <= high; index++){
            if(p > mid) a[index] = aux[q++];//左侧没有了
            else if(q > high) a[index] = aux[p++];//右侧没有了
            else if(aux[p] < aux[q]) a[index] = aux[p++]; //左侧比右侧小
            else a[index] = aux[q++];//右侧比左侧小
        }
    }


    /**
     * 归并排序：先给左边排序，然后给右边排序最后归并起来
     * **/
    private static void sort(int a[],int low,int high){
        if(high <= low) return;
        int mid = low + (high-low)/2;
        sort(a,low,mid);
        sort(a,mid+1,high);
        merge(a,low,mid,high);
    }

    public static void main(String[] args) {
        int arr[] = {0,2,4,6,8,10,1,3,5,7,9};
        System.out.println("sorece arr:");
        show(arr);
        System.out.println("test merge： ");
        aux = new int[arr.length];
        merge(arr,0,arr.length/2,arr.length-1);
        show(arr);
        System.out.println("test sort:");
        int arr2[] = {31,312,4,123,21,4521,321,3,125,123,1,5,5,31,25,2,
                23,666,7,4,1,8,777,9887,876,657,8,65,4,651,87987,76,5,76};
        aux = new int[arr2.length];//第二次的时候需要将辅助数组重新初始化(定义长度)
        sort(arr2,0,arr2.length-1);
        show(arr2);
    }
    /**数组遍历*/
    private static void show(int[] arr) {
        for(int x:arr){
            System.out.print(x + " ");
        }
        System.out.println();
    }

}
