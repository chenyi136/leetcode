package enums;


import java.util.EnumMap;
import java.util.Map;

import static enums.AlarmPoints.*;

interface Command{void action();}
public class EnumMaps {
    public static void main(String[] args) {
        EnumMap<AlarmPoints,Command> em=new EnumMap<AlarmPoints, Command>(AlarmPoints.class);
        em.put(KITCHEN, new Command() {
            @Override
            public void action() {
                System.out.println("Kitchen fired");
            }
        });
        em.put(BATHROOM, new Command() {
            @Override
            public void action() {
                System.out.println("Bathroom fired");
            }
        });

        for(Map.Entry<AlarmPoints,Command> e:em.entrySet()){
            System.out.print(e.getKey()+" ");
            e.getValue().action();
        }
        try {
            em.get(UTILITY).action();
        }catch (Exception e){
            System.out.println(e);
        }
    }
}
