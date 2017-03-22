using System;
 
class MyClass
{
    public static void Main()
    {
        int varA = 10; //������Ϊ 00001010
        int varB = 20; //������Ϊ 00010100

        // ���롱����
        int andResult = varA & varB;
        Console.WriteLine("10 & 20 = {0}", andResult);

        // ��������
        int orResult = varA | varB;
        Console.WriteLine("10 | 20 = {0}", orResult);

        // ���������
        int notorResult = varA ^ varB;
        Console.WriteLine("10 ^ 20 = {0}", orResult);

        // ���󲹡�����
        Console.WriteLine("~ {0:x8}  = {1:x8}", varA, ~varA);

        // ��λ����
        Console.WriteLine("{0:x8} >> 3 = {1}", varA, varA >> 3);

        // ��λ����
        Console.WriteLine("{0:x8} << 3 = {1}", varA, varA << 3);
    }
}

