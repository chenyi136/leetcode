package sort;

public class HeapSort {

    public static void main(String[] args) {
        int[] arr = { 50, 10, 90, 30, 70, 40, 80, 60, 20 };
        System.out.println("排序之前：");
        for (int i = 0; i < arr.length; i++)
            System.out.print(arr[i] + " ");

        // 堆排序
        heapSort(arr);
        System.out.println();
        System.out.println("排序之后：");
        for (int i = 0; i < arr.length; i++)
            System.out.print(arr[i] + " ");
    }

    private static void heapSort(int[]arr){
        // 从最后一个非叶子节点开始，将待排序列构建大顶堆
        for(int i=arr.length/2;i>=0;i--){
            heapAdjust(arr,i,arr.length);
        }
        //　逐步将最大值的根节点与末尾元素交换，并再次调整序列为大顶堆
        for(int i=arr.length-1;i>0;i--){
            swap(arr,0,i);
            heapAdjust(arr,0,i);
        }
    }
    /**
     * 构建堆的过程
     * @param arr 需要排序的数组
     * @param i 需要构建堆的根节点的序号
     * @param n 数组的长度
     */
    private static void heapAdjust(int[] arr,int i,int n){
        int child;
        int father;
        for(father=arr[i];leftChild(i)<n;i=child){
            // 找出孩子节点中值较大的点，并将该较大值与父节点值进行比较
            child=leftChild(i);
            if(child!=n-1&&arr[child]<arr[child+1]){
                child++;
            }
            if(father<arr[child]){
                arr[i]=arr[child];
            }else break;

        }
        arr[i]=father;

    }
    //获取左孩子节点
    private static int leftChild(int i){
        return 2*i+1;
    }


    // 交换元素位置
    private static void swap(int[] arr, int index1, int index2)
    {
        int tmp = arr[index1];
        arr[index1] = arr[index2];
        arr[index2] = tmp;
    }

}
