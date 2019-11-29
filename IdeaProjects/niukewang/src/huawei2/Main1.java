package huawei2;

import java.util.*;

public class Main1 {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int n=in.nextInt();


        String str1=in.nextLine();

        String[] st=str1.split(" ");


//        for(String s1:st){
//            System.out.println(s1);
//        }
//        String[] st={"abc","123456789"};
//        Arrays.sort(st);
        List<String> result=new ArrayList<String>();

//            @Override
//            public int compare(String o1, String o2) {
//                return o1.charAt(0)-o2.charAt(0);
//            }
//        });
//

        for(int i=0;i<st.length;i++){
            int index=0;
            while(index<st[i].length()) {

                String temp="";

                if (st[i].length()-index < 8) {
                    temp = st[i].substring(index,st[i].length());
                    int zero = 8 - (st[i].length()-index);
                    for (int j= 0; j < zero; j++) {
                        temp += "0";
                    }
                    result.add(temp);
                    index+=st[i].length();
                    break;
                }else {
                    temp = st[i].substring(0, 8);
                    result.add(temp);
                    index += 8;
                }
            }

        }

        Collections.sort(result);
        for(String s:result){
            System.out.print(s+" ");
        }
    }
}
