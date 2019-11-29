package collection.hash;

import java.util.Random;

public class Prediction {
    private static Random rand=new Random(30);
    private boolean shadow=rand.nextDouble()>0.5;

    public String toString(){
        if(shadow){
            return "Six week winter";
        }else{
            return "Early spring";
        }
    }
}
