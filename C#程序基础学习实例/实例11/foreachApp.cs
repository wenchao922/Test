using System;
using System.Collections;

class ForeachApp
{
    public static void Main()
    {
        // �ѻ������������е�ֵȡ�������ŵ�����environment��
        IDictionary environment = Environment.GetEnvironmentVariables();
        
        // ��ӡ��ͷ
        Console.WriteLine("����������\t=\t��������ֵ");

        // ����environment�����м�ֵ
        foreach (string environmentKey in environment.Keys)
        {
            // ��ӡ�����л������������ƺ�ֵ
            Console.WriteLine("{0}\t=\t{1}", environmentKey, environment[environmentKey].ToString());
        }
    }
}
