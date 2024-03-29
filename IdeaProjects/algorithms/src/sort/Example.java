package sort;

public class Example {
    public static void sort(Comparable[] a){}

    static boolean less(Comparable v, Comparable w){
        return v.compareTo(w)<0;
    }

    public static void exch(Comparable[] a, int i, int j){
        Comparable t=a[i];
        a[i]=a[j];a[j]=t;
    }

    private static void show(Comparable[]a){
        for(Comparable i:a){
            System.out.println(i);
        }
    }

    private static boolean isSorted(Comparable[]a){
        for(int i=1;i<a.length;i++){
            if(less(a[i],a[-1])) return  false;
        }
        return true;
    }

    public static void main(String[] args) {
        String[] a=new String[]{"bed","bag","bug","yes","zoo","all","bad","yet"};
//        sort(a);
        assert isSorted(a);
        show(a);
    }



}
