using System;

class DoWhileApp 
{
    // ����һ��֧�ֵ��û��ķ�����ģ��
    public static void Main()  
    {
        // ��ӡ����Ļ�ӭ��Ϣ
        Console.WriteLine("��ӭʹ��whileApp V0.1");

        // command���ڴ洢�û�������
        string command;

        do
        {
            // ��ӡ���������
            Console.Write(">");

            // �����û�������
            command = Console.ReadLine();
            switch(command)
            {
                // ����get����
                case "get":
                    doGet();
                    break;

                // ����put����
                case "put":
                    doPut();
                    break;

                // ����Ϊexit��ʾ�˳�����
                case "exit":
                    break;

                // ����ȱʡ����
                default:
                    doDefault();
                    break;
            }
        }while(command != "exit");// ����Ϊexit��ʾ�˳�����
    }

    // ����get����
    private static int doGet()
    {
        // ������������get������
        Console.WriteLine("��ȡ�ļ�...ok");

        return 0;
    }

    // ����put����
    private static int doPut()
    {
        // ������������put������
        Console.WriteLine("�����ļ�...ok");

        return 0;
    }

    // ����ȱʡ����
    private static int doDefault()
    {
        // ��ӡ������Ϣ
        Console.WriteLine("�������");

        // ��ʾ��ȷ�÷�
        Console.WriteLine("whileApp V0.1 ֧�ֵ�����У�");
        Console.WriteLine("\tget:\t��ȡ�ļ�");
        Console.WriteLine("\tget:\t�����ļ�");
        Console.WriteLine("\texit:\t�˳�����");

        return 0;
    }
}
