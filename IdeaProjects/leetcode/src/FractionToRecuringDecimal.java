import java.util.HashMap;
import java.util.Map;

/**
 * @ClassNameFractionToRecuringDecimal
 * @Author jianwen
 * @Date 19-11-2 下午8:55
 * @Version V1.0
 */
public class FractionToRecuringDecimal {
    public String fractionToDecimal(int numerator, int denominator){
        if(numerator==0) return "0";

        StringBuilder builder=new StringBuilder();
        if((numerator<0)^(numerator<0)){
            builder.append("-");

        }

        long n=Math.abs((long)numerator);
        long d=Math.abs((long)denominator);

        builder.append((n/d));
        if((n%d==0)) return builder.toString();
        builder.append(".");

        Map<Long,Integer> numerators=new HashMap<>();

        while(!numerators.containsKey(n)){
            numerators.put(n,builder.length());
            n*=10;
            builder.append(n/d);
            if((n%d)==0) return builder.toString();
        }
        return builder.insert(numerators.get(n),"(").append(")").toString();
    }
}
