package Mianjing;

public class ThreeColor {
    public int[]sortColors(int[] a){
        int n=a.length;
        int left=-1,right=n;
        int i=0;
        while(i<n){
            if(a[i]==0){
                swap(a,i,++left);
                i++;
            }else if(a[i]==2){
                swap(a,i,--right);
            }else{
                i++;
            }
        }
        return a;

    }
    public  void swap(int[] a, int i, int j) {
        if(i!=j){
            int temp=a[i];
            a[i]=a[j];
            a[j]=temp;
        }
    }



}
