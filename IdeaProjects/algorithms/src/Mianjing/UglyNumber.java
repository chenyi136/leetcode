package Mianjing;

import java.util.ArrayList;

/**
 * @ClassNameUglyNumber
 * @Author jianwen
 * @Date 19-10-16 下午2:42
 * @Version V1.0
 */
public class UglyNumber {
    public int GetUglyNumber_Solution(int index) {
        if(index<0) return 0;
        ArrayList<Integer> res=new ArrayList<>();
        int t2=0,t3=0,t5=0;
        res.add(1);
        while(res.size()<index){
            int num2=res.get(t2)*2;
            int num3=res.get(t3)*3;
            int num5=res.get(t5)*5;
            int min=Math.min(num2,Math.min(num3,num5));
            res.add(min);
            if(min==num2) t2++;
            if(min==num3) t3++;
            if(min==num5) t5++;
        }
        return res.get(res.size()-1);
    }
}
