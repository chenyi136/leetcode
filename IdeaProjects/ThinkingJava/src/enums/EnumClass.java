package enums;


enum ShrGubbery{GROUND,CRAWING,HANGIN}
public class EnumClass {
    public static void main(String[] args) {
        for(ShrGubbery s:ShrGubbery.values()){
            System.out.println(s+"ordinal"+s.ordinal());
            System.out.print(s.compareTo(ShrGubbery.CRAWING)+" ");
            System.out.print(s.equals(ShrGubbery.CRAWING)+" ");
            System.out.println(s==ShrGubbery.CRAWING);
            System.out.println(s.name());
            System.out.println("--------------");
        }

//        Enum.valueOf()根据给定的名字返回相应的实例
        for(String s:"GROUND,CRAWING,HANGIN".split(",")){
            ShrGubbery sh=Enum.valueOf(ShrGubbery.class,s);
            System.out.println(sh);
        }
    }
}
