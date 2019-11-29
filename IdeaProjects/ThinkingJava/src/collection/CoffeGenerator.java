package collection;

import java.util.Iterator;
import java.util.Random;

public class CoffeGenerator implements Generate<Coffe>,Iterable<Coffe> {
    private Class[] types={Latte.class,Mocha.class,Cappucino.class,Americano.class,Breve.class};
    private static Random rand=new Random(30);

    public CoffeGenerator(){}

    //FOr iteration:
    private int size=0;
    public CoffeGenerator(int sz){
        size=sz;
    }
    @Override
    public Coffe next() {
        try {
            return (Coffe) types[rand.nextInt(types.length)].newInstance();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

    class  CoffeeIterator implements  Iterator{

        int count=size;

        @Override
        public boolean hasNext() {
            return count>0;
        }

        @Override
        public Object next() {
           count--;
           return CoffeGenerator.this.next();
        }

        @Override
        public void remove() {

        }
    }
    @Override
    public Iterator<Coffe> iterator() {
        return new CoffeeIterator();
    }

    public static void main(String[] args) {
        CoffeGenerator gen=new CoffeGenerator();
      for(int i=0;i<5;i++){
            System.out.println(gen.next());
        }
        for(Coffe c:new CoffeGenerator(5)){
            System.out.println(c);
        }
    }
}
