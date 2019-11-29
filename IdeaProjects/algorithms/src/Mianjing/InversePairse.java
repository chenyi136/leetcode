package Mianjing;

/**
 * @ClassNameInversePairse
 * @Author jianwen
 * @Date 19-10-16 下午3:19
 * @Version V1.0
 */
public class InversePairse {
    public int inverseCount(int[] array){
        int res=0;
        if(array==null||array.length==0){
            return 0;
        }
        int[] copy=new int[array.length];
        for(int i=0;i<array.length;i++){
            copy[i]=array[i];
        }
        res=InversePairsCore(array,copy,0,array.length-1);
        return res;
    }
    public int InversePairsCore(int[] array,int[] copy,int start,int end){
        if(start==end){
            copy[start]=array[start];
            return 0;
        }
        int mid=start+(end-start)>>1;
        int left=InversePairsCore(array,copy,start,mid);
        int right=InversePairsCore(array,copy,mid+1,end);
        int count=0;
        int i=start,j=mid+1,k=0;
        while(i<=mid&&j<=end){
            if(array[i]<array[j]){
                copy[k++]=array[i++];
            }else{
                copy[k++]=array[j++];

                count+=(mid-i+1);

            }
        }
        while(i<=mid){
            copy[k++]=array[i++];
        }
        while(j<=end){
            copy[k++]=array[j++];
        }
        for(int index=start;i<end;i++){
            array[index]=copy[index];
        }
        return left+right+count;
    }


}
