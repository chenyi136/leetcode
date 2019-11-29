import java.util.ArrayList;
import java.util.List;

/**
 * @ClassNameRestoreIpAddresses
 * @Author jianwen
 * @Date 19-11-18 下午4:25
 * @Version V1.0
 */
public class RestoreIpAddresses {
    static ArrayList<String> res=new ArrayList<>();
    public static void main(String[] args) {
        restoreIpAddress("25525511135");
        for(String s:res){
            System.out.println(s);
        }
    }

    public static void restoreIpAddress(String s){

        helper(s,"",0);

    }
     public static void helper(String s,String out,int index){
        if(index==4){
            if(s.isEmpty()) res.add(out);
            return;
        }
        for(int k=1;k<4;k++){
            if(s.length()<k) break;
            int val=Integer.parseInt(s.substring(0,k));
            if(val>255||k!=String.valueOf(val).length()) break;
            helper(s.substring(k),out+s.substring(0,k)+(index==3?"":"."),index+1);
        }
    }

}
