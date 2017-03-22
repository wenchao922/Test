using System;
using System.Text;
using System.Net;
using System.Net.Sockets;

public class server
{
    public static void Main() 
    {
        try 
        {
            // ��IP��ַת��ΪIPAddress��ʵ��
            IPAddress ipAd = IPAddress.Parse("127.0.0.1");
            
            // ��ʼ���������� �˿�Ϊ8001
            TcpListener myList=new TcpListener(ipAd,8001);
            
            // ��ʼ�����������˿�
            myList.Start();

            // ���������������Ϣ
            Console.WriteLine("��8001�˿���������...");	
            Console.WriteLine("���ؽڵ�Ϊ:" + myList.LocalEndpoint );
            Console.WriteLine("�ȴ�����.....");
            
            // �ȴ����������������
            // �½������������׽���s��ʾ
            Socket s=myList.AcceptSocket();
            Console.WriteLine("�������� "+s.RemoteEndPoint);
            
            // ���տͻ�����Ϣ
            byte[] b=new byte[100];
            int k=s.Receive(b);
            Console.WriteLine("�ѽ���...");
            for (int i=0;i<k;i++)
            {
                Console.Write(Convert.ToChar(b[i]));
            }
            
            // ����ͻ������󣬸��ͻ��˻�Ӧ
            ASCIIEncoding asen=new ASCIIEncoding();
            s.Send(asen.GetBytes("The string was recieved by the server."));
            Console.WriteLine("\n�ѷ��ͻ�Ӧ��Ϣ");
            
            // �ƺ������ͷ���Դ
            s.Close();
            myList.Stop();
        }
        catch (Exception e)
        {
            Console.WriteLine("Error..... " + e.StackTrace);
        }	
    }
}

