using System;
using System.IO;

class SwitchApp 
{
   public static void Main()  
   {
       //��ʾ��ʾ
      Console.WriteLine("����ѡ���ͺ�: 1=(С��, ��3.0) 2=(�б�, ��4.0) 3=(��, ��5.0)"); 
      Console.Write("����ѡ����: "); 

       //�����û�ѡ��
       //���û���ѡ��ֵ������n
      string s = Console.ReadLine(); 
      int n = int.Parse(s);
       
       //�����û���������ʾ������Ϣ
      switch( n ) 
      {
         case 1:
            Console.WriteLine("С�����븶�ѣ�3.0��");
            break;
         case 2:
            Console.WriteLine("�б����븶�ѣ�4.0��");
            break;
         case 3:
            Console.WriteLine("�󱭣��븶�ѣ�5.0��");
            break;
         //ȱʡΪ�б�
          default:
              Console.WriteLine("�б����븶�ѣ�4.0��");
              break;
      }

       //��ʾ����ʹ����ʾ
      Console.WriteLine("ллʹ�ã���ӭ�ٴι��٣�");   
   }
}

