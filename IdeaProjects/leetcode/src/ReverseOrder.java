public class ReverseOrder {

    public static  int InversePairs(int [] array) {
        int[] aux=new int[array.length];
        for(int i=0;i<array.length;i++){
            aux[i]=array[i];
        }
        int count=0;
        return sort(array,0,array.length-1,aux);
    }
    public static int sort(int[] array,int low,int high,int[] aux){
        int count=0;
        int mid=low+(high-low)>>1;
        sort(array,low,mid,aux);
        sort(array,mid+1,high,aux);

        count= MergeAndCount(array,low,mid,high,aux);
        return count;
    }
    public static int MergeAndCount(int[] array,int low,int mid,int high ,int[]aux){

        int count=0;
        int p=low,q=mid+1;

        for(int k=0;k<=high;k++){
            if(p>mid) array[k++]=aux[q++];
            else if (q>high) array[k++]=aux[p++];
            else if(aux[p]<aux[q]) array[k++]=aux[p++];
            else {
                array[k++]=aux[q++];
                count+=mid-p+1;
            }
        }
        return count;

    }

    public static void main(String[] args) {
        int[]a={1,2,3,4,5,6,7,0};
        System.out.println(InversePairs(a));
    }
}
