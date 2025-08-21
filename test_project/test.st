
public struct B
{

    // public A theA;
    public int numBalls = 1203;

    public B() {}

    public static int Main()
    {
    

        return 10;
    }
}

public struct A
{
    public int numJaws = 10;
    public B theB;

    public static int Main()
    {
        return 0;
    }

    public A(int jaws) {
        numJaws = jaws;
        theB = new B();
        // return new A();
    }

    public void InstanceMethodA() {
        InstanceMethodB();
    }

    public void InstanceMethodB() {
        numJaws = 12003;
    }



}


