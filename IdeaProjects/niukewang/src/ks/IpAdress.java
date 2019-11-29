package ks;

import java.util.Scanner;

/**
 * @ClassNameIpAdress
 * @Author jianwen
 * @Date 19-9-16 下午8:55
 * @Version V1.0
 */
public class IpAdress {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        String ip=sc.nextLine();
        System.out.println(validIpAddress(ip));
    }

    public static String validIpAddress(String ip){
        if(ip==null||ip.length()<=0){
            return "Neither";
        }
        if(isIpV4(ip)){
            return "Ipv4";
        }
        if(isIpv6(ip)){
            return "Ipv6";
        }
        return "Neither";
    }
    public static boolean isIpV4(String ip){
        if(ip.charAt(ip.length()-1)=='.'){
            return false;
        }
        String[] nums=ip.split("\\.");
        if(nums.length!=4){
            return false;
        }
        if(ip.charAt(0)=='-') return false;
        for(String val:nums){
            if("".equals(val)||val.length()>3||(val.length()>1&&val.charAt(0)=='0')){
                return false;
            }
            for(int i=0;i<val.length();i++){
                if(!(val.charAt(i)>='0'&&val.charAt(i)<='9')){
                    return false;
                }
            }
            if(Integer.parseInt(val)>255){
                return false;
            }
        }
        return true;
    }
    public static boolean isIpv6(String ip){
        if(ip.charAt(ip.length()-1)==':'){
            return false;
        }
        String[] nums=ip.toLowerCase().split("\\:");
        if(nums.length!=8){
            return false;
        }
        for(String val:nums){
            if(val.length()<=0||val.length()>4){
                return false;
            }
            for(int i=0;i<val.length();i++){
                char c=val.charAt(i);
                if(!(c>='0'&&c<='9')&&!(c>='a'&&c<='f')&&!(c>='A'&&c<='F')){
                    return false;
                }
            }
        }
        return true;

    }
}
