package Mianjing;

/**
 * @ClassNameOddAndEven
 * @Author jianwen
 * @Date 19-10-16 上午1:12
 * @Version V1.0
 */
public class OddAndEven {
    public void reOrderArray(int [] array) {
        if (array == null || array.length == 0) return;
        int begin = 0, end = 0;
        while (begin < array.length) {
            while (begin < array.length && (array[begin] & 1) == 1) begin++;
            end = begin++;
            while (end < array.length && (array[end] & 1) == 0) end++;
            if (end < array.length) {
                int temp = array[end];
                for (int i = end - 1; i >= begin; i--) {
                    array[i + 1] = array[i];
                }
                array[begin] = temp;
            } else break;
        }
    }

//    public void swap(int[] array,int i,int j){
//        int temp=array[i];
//        array[i]=array[j];
//        array[j]=temp;
//    }
}
