using System;
using System.Net;
using System.Net.Sockets;
using System.IO;
using System.Threading;

class IrcBot
{
	// �����ӵ�IRC�����������ﶨ��������ݵ�IRC������ 
	public static string SERVER = "irc.wz163.net";
	
	// IRC�������ķ���˿� (6667��IRC��������ȱʡ�˿�)
	private static int PORT = 6667;

	// �����͵���Ϣ(��RFC2812�ж���)
	private static string USER = "USER liping 8 * :I'm a C# irc bot";
	
	// �Լ����ǳ�
	private static string NICK = "Rose";

	// �������Ƶ������
	private static string CHANNEL = "#my_channel";

	// ����һ��StreamWriter���������û���Ϣ
	public static StreamWriter writer;
	
    // ������
	static void Main (string[] args)
	{	
		NetworkStream stream;
		TcpClient irc;
		string inputLine;
		StreamReader reader;
		string nickname;
		
		try
		{
			irc = new TcpClient (SERVER, PORT);
			stream = irc.GetStream ();
			reader = new StreamReader (stream);
			writer = new StreamWriter (stream);
			
			// ��ʼPingSender����
			PingSender ping = new PingSender ();
			ping.Start ();
			
            // ����Ƶ��
			writer.WriteLine (USER);
			writer.Flush ();
			writer.WriteLine ("NICK " + NICK);
			writer.Flush ();
			writer.WriteLine ("JOIN " + CHANNEL);
			writer.Flush ();

			while (true)
			{			
				while ( (inputLine = reader.ReadLine () ) != null )
				{
					
          				if (inputLine.EndsWith ("JOIN :" + CHANNEL) )
          				{
          					// ��ȡƵ�����������ѵ��ǳ�
          					nickname = inputLine.Substring(1, inputLine.IndexOf ("!") - 1);
          					
          					// ��Ƶ�������е����Ѵ��к�
        					writer.WriteLine ("NOTICE " + nickname + " :Hi " + nickname + 
        					" and welcome to " + CHANNEL + " channel!");
            					writer.Flush ();
            					
            					// Sleep�Է�ֹ��������
            					Thread.Sleep (2000);
          				}
				}
				
				// �ر����е���
				writer.Close ();
				reader.Close ();
				irc.Close ();
			}
		}
		catch (Exception e)
		{
			// ��ʾ����sleep������������IRC������
			Console.WriteLine (e.ToString () );
			Thread.Sleep (5000);
			string[] argv = { };
			Main (argv);
		}
	}
}

    /*
     *  ÿ��15���IRC����������һ��PING��
     */
class PingSender
{
    static string PING = "PING :";
    private Thread pingSender;
	
    // ���캯������������ʵ��
    public PingSender () 
    {
        pingSender = new Thread (new ThreadStart (this.Run) ); 
    }

    // ��ʼ����
    public void Start () 
    { 
        pingSender.Start (); 
    }

    // ÿ��15���IRC����������PING��
    public void Run ()
    {
        while (true)
        {
            IrcBot.writer.WriteLine (PING + IrcBot.SERVER);
            IrcBot.writer.Flush ();
            Thread.Sleep (15000);
        }
    }
}
