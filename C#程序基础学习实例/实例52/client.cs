using System;
using System.IO;
using System.Net;
using System.Text;
using System.Net.Sockets;

public class client 
{
    public static void Main() 
    {
        try 
        {
            // �½��ͻ����׽���
			TcpClient tcpclnt = new TcpClient();
			Console.WriteLine("����.....");
			
            // ���ӷ�����
			tcpclnt.Connect("127.0.0.1",8001);
			Console.WriteLine("������");
			Console.Write("������Ҫ������ַ��� : ");
			
            // �����ַ���
			String str=Console.ReadLine();

            // �õ��ͻ��˵���
			Stream stm = tcpclnt.GetStream();
			
            // �����ַ���
			ASCIIEncoding asen= new ASCIIEncoding();
			byte[] ba=asen.GetBytes(str);
			Console.WriteLine("������.....");			
			stm.Write(ba,0,ba.Length);
			
            // ���մӷ��������ص���Ϣ
			byte[] bb=new byte[100];
			int k=stm.Read(bb,0,100);
			
            // ���������������Ϣ
            for (int i=0;i<k;i++)
            {
                Console.Write(Convert.ToChar(bb[i]));
            }
			
            // �رտͻ�������
			tcpclnt.Close();
		}		
		catch (Exception e) 
        {
			Console.WriteLine("Error..... " + e.StackTrace);
		}
	}
}