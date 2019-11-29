package collection.hash;

public class Groundhog2 extends Groundhog {

    public Groundhog2(int n) {
        super(n);
    }
    public int hashCode(){
        return number;
    }

    @Override
    public boolean equals(Object obj) {
        return obj instanceof Groundhog2&&(number==((Groundhog2) obj).number);
    }
}
