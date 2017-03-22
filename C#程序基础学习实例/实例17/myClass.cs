using System;
using System.IO;

public class Person
{
    // ö�����ͣ����ڱ�ʾ�Ա�Ϊ��ʡ�ڴ棬ʹ��byte��
    public enum Sex : byte
    {
        Male = 0, Female
    }

    // ˽�����ԣ��������Ա����䣬��ߣ�����
    private string name;
    private Sex    sex;
    private byte   age;
    private float  height;
    private float  weight;

    // ���캯����ֻ��һ�����ԣ�����
    public Person(string sName)
    {
        name = sName;
    }

    // ���캯��2��֧���������ԣ��������Ա�
    public Person(string sName, Sex cSex)
    {
        name = sName;
        sex  = cSex;
    }

    // ��������
    public void setAge(byte bAge)
    {
        age = bAge;
    }

    // �����Ա𣬲���Ϊö������Sex
    public void setSex(Sex cSex)
    {
        sex = cSex;
    }

    // ���������Ա�ķ���������Ϊbyte
    public void setSex(byte bSex)
    {
        sex = (Sex)bSex;
    }

    // �������
    public void setHeight(float fHeight)
    {
        height = fHeight;
    }

    // ��������
    public void setWeight(float fWeight)
    {
        weight = fWeight;
    }

    // �õ�����
    public string getName()
    {
        return name;
    }

    // �õ�����
    public byte getAge()
    {
        return age;
    }

    // �õ��Ա�
    public Sex getSex()
    {
        return sex;
    }

    // �õ����
    public float getHeight()
    {
        return height;
    }

    // �õ�����
    public float getWeight()
    {
        return weight;
    } 
}

public class MyClass
{
    public static void Main()
    {
        // ʵ����һ���ˣ����ø�������
        Person p1 = new Person("���");
        p1.setSex((byte)1);
        p1.setAge(19);
        p1.setHeight((float)1.68);
        p1.setWeight(45);

        // ʵ������һ���ˣ����ø�������
        Person p2 = new Person("�Ž���", 0);
        p2.setAge(25);
        p2.setHeight((float)1.75);
        p2.setWeight(74);

        // ��ӡ�����˵�����
        Console.WriteLine("{0}\t{1}\t{2}\t{3}\t{4}", p1.getName(), p1.getSex(), p1.getAge(), p1.getHeight(), p1.getWeight());
        Console.WriteLine("{0}\t{1}\t{2}\t{3}\t{4}", p2.getName(), p2.getSex(), p2.getAge(), p2.getHeight(), p2.getWeight());

    }
}
