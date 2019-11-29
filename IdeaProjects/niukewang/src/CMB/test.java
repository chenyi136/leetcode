package CMB;

import java.util.ArrayList;
import java.util.List;

/**
 * @ClassNametest
 * @Author jianwen
 * @Date 19-9-14 上午12:21
 * @Version V1.0
 */
public class test {
    public static void main(String[] args) {
        List<String> list=new ArrayList<String>();
        list.add("王利虎");
        list.add("张三");
        list.add("李四");
        int size=list.size();
        String[] array = (String[])list.toArray(new String[size]);
        for(int i=0;i<array.length;i++){
            System.out.println(array[i]);
        }
    }
}
