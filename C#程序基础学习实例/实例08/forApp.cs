using System;

class ForApp 
{
    public static void Main()  
    {
        //��ӡ��ͷ
        Console.WriteLine("�žų˷���");
        
        //��ӡ�žű�
        for(int i = 1; i <= 9; i++)
        {
            //���㲢��ʽ������žű������
            for(int j = 1; j <= i; j++)
            {
                Console.Write("{0}x{1}={2}\t", i, j, i*j);
            }

            //����
            Console.WriteLine();
        }
    }
}


            