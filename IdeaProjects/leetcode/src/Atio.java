/**
 * @ClassNameAtio
 * @Author jianwen
 * @Date 19-10-20 下午8:59
 * @Version V1.0
 */
public class Atio {
    public int myAtio(String str){
        if(str==null){
            return 0;
        }
        String s=str.trim();
        if("".equals(s)){
            return 0;
        }
        char[] arr=s.toCharArray();
        //第一个字符为字母
        if ((arr[0] >= 'a' && arr[0] <= 'z') || arr[0] >='A' && arr[0] <= 'Z')
        {
            return 0;
        }
        //如果只有一个正号或负号
        if (arr.length == 1 && (arr[0] == '+' || arr[0] == '-'))
        {
            return 0;
        }
        long ret = 0;
        int i = (arr[0] == '+' || arr[0] == '-')?1:0;
        while (arr[i] >= '0' && arr[i] <= '9')
        {
            ret = ret * 10 + (arr[i]-'0');
            i++;
            //如果i值大于数组长度或者ret大于整形最大值，退出循环
            if (i == arr.length || ret >= Integer.MAX_VALUE)
            {
                break;
            }
        }

        if (arr[0] == '-')
        {
            ret = (-1)*ret;
        }
        if (ret > Integer.MAX_VALUE)
        {
            return Integer.MAX_VALUE;
        }
        else if (ret < Integer.MIN_VALUE)
        {
            return Integer.MIN_VALUE;
        }
        else
        {
            return (int)ret;
        }


    }
}
