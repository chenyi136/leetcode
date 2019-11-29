package runtimeclasstype;

public class RealObject implements Interface {
    @Override
    public void dosomething() {
        System.out.println("do something");
    }

    @Override
    public void somethingElse(String arg) {
        System.out.println("SomethinfElse"+arg);
    }
}
