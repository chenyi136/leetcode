
import java.util.ArrayList;
import java.util.List;
import java.util.Stack;

/**
 * @ClassNameSimplifyPath
 * @Author jianwen
 * @Date 19-11-17 下午5:51
 * @Version V1.0
 */
public class SimplifyPath {
    public String simplyfy(String path){
        Stack<String> s=new Stack<>();
        String[] p=path.split("/");
        for(String t:p){
            if(!s.isEmpty()&&t.equals("..")){
                s.pop();
            }else if(!t.equals(".")&&!t.equals("")&&!t.equals("..")){
                s.pop();
            }
        }
        List<String> list=new ArrayList(s);
        return "/" + String.join("/", list);
    }

}
