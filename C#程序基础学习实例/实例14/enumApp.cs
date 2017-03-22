using System;

class EnumApp
{
    // ����һ��ö������Weekday������Ϊint�����ʷ�ΧΪpublic
    public enum Weekday
    {
        Sun, Mon, Tue, Wed, Thu, Fri, Sat
    }
    
    public static void Main()
    {
        // ��ö������Weekday��������������ֵ
        Weekday wd1 = Weekday.Mon;
        Console.WriteLine("ÿ�ܵĹ����մ�{0}��ʼ",wd1);
        Weekday wd2=Weekday.Fri;
        Console.WriteLine("��{0}����",wd2);
        
        // ö�����ͱ������ڼ���
        Console.WriteLine("ÿ����{0}��������", wd2-wd1);
        Console.WriteLine();

        // ö�����ͱ�����Ϊ�����Ĳ���
        Console.WriteLine("Mon֮����{0}",NextDay(Weekday.Mon));
        Console.WriteLine();
        
        // ʹ��ö�����͵�GetNames()����
        foreach(string s1 in Weekday.GetNames(typeof(Weekday)))
        {
            Console.Write(s1+" ");
        }
        Console.WriteLine("\n");
        
        // �������ж�ȡö�����ͱ�����ֵ
        Console.Write("���������ڼ�? ");
        Weekday wd3=(Weekday)Weekday.Parse(typeof(Weekday),Console.ReadLine());
        Console.WriteLine("������{0}",NextDay(wd3));
        Console.WriteLine();
        
        // �Ƚ�ö�����͵�ֵ
        Console.Write("�����������ڼ�? ");
        wd1=(Weekday)Weekday.Parse(typeof(Weekday),Console.ReadLine());
        Console.Write("�������������ڼ�? ");
        wd2=(Weekday)Weekday.Parse(typeof(Weekday),Console.ReadLine());
        if(wd1.CompareTo(wd2) == 0)
        {
            Console.WriteLine("��⣬��ͬһ�졣");
        }
        else
        {
            Console.WriteLine("û�£�����ͬһ��");
        }
    }
    
    // ���ܣ� �õ�ĳ�յ���һ��(���ڼ�)
    // ������
    //        wd : ö������Weekday
    // ����ֵ�� ö������Weekday
    public static Weekday NextDay(Weekday wd)
    {
        Weekday wdnext;
        if (wd == Weekday.Sat)
        {
            wdnext=Weekday.Sun;
        }
        else
        {
            wdnext=wd+1;
        }

        return wdnext;
    }
}

