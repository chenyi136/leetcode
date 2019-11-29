package hw;


import javax.sound.midi.Soundbank;
import java.util.*;

class Pair implements Comparable<Pair>{
    int x;int y;

    public Pair(int x,int y){
        this.x=x;
        this.y=y;
    }

    @Override
    public int compareTo(Pair o) {
        return x==o.x?o.y-y:x-o.x;
    }
}

public class Main {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        int n=sc.nextInt();


        Pair[] arr=new Pair[n];
        for(int i=0;i<n;i++){
            int a=sc.nextInt();
            int b=sc.nextInt();
            arr[i]=new Pair(a,b);
        }
        Arrays.sort(arr);
        List<Pair> res=new ArrayList<>();
        for(int i=0;i<n;i++){
            int j;
            for(j=0;i!=j&&j<n;j++){
                if(arr[i].x<arr[j].x&&arr[i].y<arr[j].y)
                    break;
            }
            if(j==n) res.add(arr[i]);
        }
        res.forEach((Pair o)-> System.out.println(o.x+" "+o.y));
    }
}