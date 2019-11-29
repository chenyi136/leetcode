public class oddevents {
    public static void main(String[] args) {
        int[] array={1,2,3,4,5};
        reOrderArray(array);
        for(int i:array) {
            System.out.println(i);
        }
    }
    public static void reOrderArray(int [] array) {
        if(array==null||array.length==0) return;
        int i=0,j=array.length-1;
        while(i<j){
            while(i<j&&array[i]%2==1)i++;
            while(i<j&&array[j]%2==0)j--;
            swap(array,i,j);
        }
    }

    public static  void swap(int[] array,int i,int j){
        int temp=array[i];
        array[i]=array[j];
        array[j]=temp;
    }
}
