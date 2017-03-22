using System;

class IfApp
{
    public static int Main(string[] args)
    {
        //��������в���С��һ��������ʾ������ȷ�÷����˳�����
        if(args.Length < 1)
        {
            Console.WriteLine("Usage: ifApp char");
            return 1;
        }

        //��õ�һ�������в�����һ����ĸ
        //�Ѹ���ĸ��������chLetter
        char chLetter = args[0][0];
        
        //�����ĸ���ڵ����ַ�'A'
        if(chLetter >= 'A')
        {
            //ͬʱ����ĸС���ַ�'Z'
            //�����ĸΪ��д��ĸ
            if(chLetter <= 'Z')
            {
                Console.WriteLine("{0} �Ǹ���д��ĸ", chLetter);
                return 0;
            }
        }

        //�����ĸ�����ַ�'a'��'z'֮��
        //�����ĸΪСд��ĸ
        if(chLetter >= 'a' && chLetter <= 'z')
        {
            Console.WriteLine("{0} �Ǹ�Сд��ĸ", chLetter);
            return 0;
        }

        //�����ĸΪ����
        if(Char.IsDigit(chLetter))
        {
            Console.WriteLine("{0} �Ǹ�����", chLetter);
            return 0;
        }

        //ȱʡ��(����������������)�������ĸΪ�����ַ�
        Console.WriteLine("{0} �Ǹ������ַ�", chLetter);
        return 1;
    }
}


