package InnerClass;

import java.lang.reflect.Constructor;

public class Parcel2 {
    class Contents{
        private int i=11;
        public int value(){return i;}
    }

    class Destination{
        private String lable;
        Destination(String whereto){
            lable=whereto;
        }
        String readLable(){
            return lable;
        }
    }

    //外部类的方法只想内部类的引用
    public Destination to(String s){
        return new Destination(s);
    }

    public Contents  contents(){
        return new Contents();
    }

    public void ship(String des){
        Contents c=contents();
        Destination d=to(des);
        System.out.println(d.readLable());
    }

    public static void main(String[] args) {
        Parcel2 p=new Parcel2();
        p.ship("Tasmania");
        Parcel2 q=new Parcel2();
        Parcel2.Contents c=p.contents();
        Parcel2.Destination d=q.to("Borneo");

    }




}

