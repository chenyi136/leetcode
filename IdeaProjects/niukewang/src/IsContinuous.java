import java.util.Arrays;

public class IsContinuous {
    public boolean continuous(int [] numbers) {
        Arrays.sort(numbers);
        int count=0;
        for(int temp:numbers){
            if(temp==0) count++;
        }
        int space=0;
        if(numbers.length==count+1) return true;
        else {
            for (int i = count + 1; i < numbers.length; i++) {
                space += (numbers[i] - numbers[i - 1] - 1);
            }
            return (count == space);
        }
    }
}
