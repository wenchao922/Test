using System;
using System.Net.Sockets;
using System.IO ;

public class Echoserver
{
	public static void Main()
	{
		// TcpListener�����˿�1234
		TcpListener tcpListener = new TcpListener(1234);
    	tcpListener.Start();      
		Console.WriteLine("Server Started") ;			
		
        // �����µ�����
		Socket socketForClient = tcpListener.AcceptSocket();			
      	
        try
        {
      		if (socketForClient.Connected)
    	  	{
        	 	while(true)
        	  	{
                    // ��StreamWriter��StreamReader������д����
                    // ��������ȡ�ͻ��˷��͵���Ϣ��������ɴ�д��ʽ��Ӧ���ͻ���
                    Console.WriteLine("Client connected");
                    NetworkStream networkStream = new NetworkStream(socketForClient);
                    StreamWriter streamWriter = new StreamWriter(networkStream);
                    StreamReader streamReader = new StreamReader(networkStream);
                    string line = streamReader.ReadLine();
                    Console.WriteLine("Read:" +line);
                    line=line.ToUpper()+ "!";
                    streamWriter.WriteLine(line);
                    Console.WriteLine("Wrote:"+line);
                    streamWriter.Flush() ;        	  		
				 }
    	  	}
            socketForClient.Close();
            Console.WriteLine("Exiting...");
        }
        catch(Exception e)
        {
        	Console.WriteLine(e.ToString()) ;
        }
	}
}
