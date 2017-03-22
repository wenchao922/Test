using System;
using System.Net;
using System.Net.Sockets;
using System.Text; 

class MyClient
{
    public static void Main(string[] args)
    {
        if(args.Length != 1)
        {
            usage();
            return;
        }
        
        try
        {
            string hostname = args[0];

            // ����Web������������������IP��ַ
            IPHostEntry IPHost = Dns.Resolve(hostname);
            Console.WriteLine(IPHost.HostName);
            string []aliases = IPHost.Aliases; 

            IPAddress[] addr = IPHost.AddressList;
            Console.WriteLine(addr[0]);
            EndPoint ep = new IPEndPoint(addr[0],80); 

            // ����tcp���׽���
            Socket sock = new Socket(AddressFamily.InterNetwork,SocketType.Stream,ProtocolType.Tcp);

            // ����web������
            sock.Connect(ep);
            if(sock.Connected)
            {
                Console.WriteLine("OK");
            }

            // ������������
            Encoding ASCII = Encoding.ASCII;
            string Get = "GET / HTTP/1.1\r\nHost: " + hostname + "\r\nConnection: Close\r\n\r\n";
            Byte[] ByteGet = ASCII.GetBytes(Get);
            Byte[] RecvBytes = new Byte[256];

            // ��������ҳ�������
            sock.Send(ByteGet, ByteGet.Length, 0);

            // ���շ�������Ӧ�������Ӧ
            Int32 bytes = sock.Receive(RecvBytes, RecvBytes.Length, 0);
            Console.WriteLine(bytes);
            String strRetPage = null;
            strRetPage = strRetPage + ASCII.GetString(RecvBytes, 0, bytes);
            while (bytes > 0)
            {
                bytes = sock.Receive(RecvBytes, RecvBytes.Length, 0);
                strRetPage = strRetPage + ASCII.GetString(RecvBytes, 0, bytes);
                Console.WriteLine(strRetPage );
            }

            // �Ͽ�����
            sock.Shutdown(SocketShutdown.Both);
            sock.Close();
        }
        catch(Exception e)
        {
            Console.WriteLine(e.ToString());
        }
    }

    private static void usage()
    {
        Console.WriteLine("Usage: GetDefaultPage hostname");
    }
}

