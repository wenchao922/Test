using System;
using System.Net;
using System.IO;
using System.Text;
using System.Threading;

/// <summary>
///    ʹ���첽���Ƶ�����
/// </summary>
public class CAsync
{
	const int MAX = 128;

    public static void  showUsage()
	{
		Console.WriteLine("ʹ���첽������ȡ��һ����ҳ");
        Console.WriteLine();
        Console.WriteLine("Usage:");
        Console.WriteLine("GetURLAsync URL");
        Console.WriteLine("Examples:");
        Console.WriteLine("GetURLAsync http://www.microsoft.com");
	}
	
	private static void RespCallback(IAsyncResult ar)
    //private static void RespCallback(AsyncCallback ar)
    { 
		HttpWebRequest req ;
        HttpWebResponse resp ;
        int BytesRead ;
        StreamReader Reader ;
        StringWriter Writer ;

        // ����HttpWebRequest��HttpWebResponseʵ��
        req = ( HttpWebRequest)(Object)ar;
        resp = (HttpWebResponse)req.EndGetResponse(ar);

        BytesRead = 0;
        char[] Buffer=new char[MAX] ;

        // ʵ��������д��
        Reader = new StreamReader(resp.GetResponseStream(), System.Text.Encoding.UTF8);
        Writer = new StringWriter();

        // ��д���ݵ�������
        BytesRead = Reader.Read(Buffer, 0, MAX);
        while (BytesRead != 0 )
		{
            Writer.Write(Buffer, 0, MAX);
            BytesRead = Reader.Read(Buffer, 0, MAX);
        }
        Console.WriteLine("Message = " + Writer.ToString());
    }
	

    public static int Main(string[] args)
    {
		if (args.Length < 1)
		{
			showUsage();
            return 0;
		}

		Uri HttpSite ;
        HttpWebRequest wreq ;
        IAsyncResult r;
        HttpSite = new Uri(args[0]);
        wreq = (HttpWebRequest) WebRequest.Create(HttpSite);
        
        // ��ʼ�첽�������Internet��Դ
        r = (IAsyncResult) wreq.BeginGetResponse(new AsyncCallback(RespCallback), null);
        Thread.Sleep(30000);
        Console.WriteLine("Exiting.");
		return 0;
    }
}
