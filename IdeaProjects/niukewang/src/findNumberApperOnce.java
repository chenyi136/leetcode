public class findNumberApperOnce {
    int[]findNumber(int[] nums){
        if(nums==null||nums.length<2) return null;
        int res=0;
        for(int i:nums) res^=i;
        int position=findFirst1(res);

        int num1=0;
        int num2=0;
        for(int i:nums){
            if(((i>>position)&1)==0) num1^=i;
            else num2^=i;
        }
        int[] result=new int[2];
        result[0]=num1;
        result[1]=num2;
        return result;


    }

    private int findFirst1(int num) {
        int index=0;
        while((num&1)==0&&index<4*32){

            num=num>>1;
            index++;
        }
        return index;
    }
}
