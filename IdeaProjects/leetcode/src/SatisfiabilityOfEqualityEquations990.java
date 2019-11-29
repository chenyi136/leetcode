import java.util.Scanner;

/**
 * @ClassNameSatisfiabilityOfEqualityEquations
 * @Author jianwen
 * @Date 19-9-23 下午4:32
 * @Version V1.0
 */
public class SatisfiabilityOfEqualityEquations990 {
    public static boolean equationsPossible(String[] equations) {
        int[] root=new int[26];
        for(int i=0;i<26;i++){
            root[i]=i;
        }
        for(String s:equations){
            char[] chars=s.toCharArray();
            if(chars[1]=='='){
                union(root,chars[0]-'a',chars[3]-'a');
            }
        }
        for(String s:equations){
            char[] chars=s.toCharArray();
            if(chars[1]=='!'){
                int a=find(root,chars[0]-'a');
                int b=find(root,chars[3]-'a');
                if(a==b) {
                    return false;

                }
            }
        }
        return true;
    }

    public static int find(int[] root,int index){
        if(index==root[index]) return index;

        return  find(root,root[index]);
    }

    public static void union(int[]root,int a,int b){
        int ra=find(root,a);
        int rb=find(root,b);
        ra=root[rb];
    }

    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        String input=sc.nextLine();
        String[] inputs=input.split(",");
        System.out.println(equationsPossible(inputs));
    }
}
