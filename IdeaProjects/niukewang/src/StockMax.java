public class StockMax {
    public static int maxValue(int[] values){
        if(values==null|| values.length==0) return 0;
        int min=values[0];
        int result=values[1]-values[0];
        for(int i=2;i<values.length;i++){
            if(values[i-1]<min) {
                min=values[i-1];

            }
            result=values[i]-min;

        }
        return result;
    }
}
