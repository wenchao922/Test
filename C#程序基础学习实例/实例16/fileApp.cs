using System; 
using System.IO;

public class FileApp 
{ 
	public static void Main() 
	{ 
	    // �ڵ�ǰĿ¼����һ���ļ�myfile.txt���Ը��ļ����ж�дȨ��
		FileStream fsMyfile = new FileStream("myfile.txt" , FileMode.Create, FileAccess.ReadWrite); 		
		
		// ����һ��������д�������ʹ򿪵��ļ�����
		StreamWriter swMyfile = new StreamWriter(fsMyfile);
		
        // ���ı���ʽдһ���ļ�
		swMyfile.WriteLine("Hello, World"); 
		swMyfile.WriteLine("abcdefghijklmnopqrstuvwxyz"); 
        swMyfile.WriteLine("ABCDEFGHIJKLMNOPQRSTUVWXYZ");
        swMyfile.WriteLine("0123456789"); 

        // ��ˢ����(����������д���ļ���ȥ)
        // ע�͸þ����Կ������򽫱���
		swMyfile.Flush();
		
        // ���ı���ʽ���ļ�
		// ����һ�����������������ʹ򿪵��ļ�����
		StreamReader srMyfile= new StreamReader(fsMyfile); 

        // ���ļ�ָ�����¶�λ���ļ��Ŀ�ʼ
		srMyfile.BaseStream.Seek(0, SeekOrigin.Begin); 
		
        // ��ӡ��ʾ��Ϣ
		Console.WriteLine("****************���ı���ʽ���ļ�*********************");
        
        // ��ӡ�ļ��ı�����
        string s1;
        while((s1 = srMyfile.ReadLine())!=null)
        {
            Console.WriteLine(s1);
        }
		Console.WriteLine();
		// ���ı���ʽ���ļ�����


		// �Զ����Ʒ�ʽ���ļ�
        // ����һ�����������������������ʹ򿪵��ļ�����
		BinaryReader brMyfile= new BinaryReader (fsMyfile);

        // ���ļ�ָ�����¶�λ���ļ��Ŀ�ʼ
		brMyfile.BaseStream.Seek(0, SeekOrigin.Begin); 
		
        // ��ӡ��ʾ��Ϣ
		Console.WriteLine("****************�Զ����Ʒ�ʽ���ļ�*********************");
        
        // ��ӡ�ļ��ı�����
        Byte b1;
		while(brMyfile.PeekChar()>-1)
		{
			b1=brMyfile.ReadByte();
            // 13Ϊ"\n"����ʾ�س���10Ϊ"\r"����ʾ����
            if(b1 != 13 && b1 != 10)
            {
                Console.Write("{0}",b1.ToString());
                Console.Write(".");	
            }
            else
            {
                Console.WriteLine();
            }
		}
        Console.WriteLine("\n");
        // �Զ����Ʒ�ʽ���ļ�����

        // �ر�����new�ĸ�������
		brMyfile.Close();			
		swMyfile.Close();
		srMyfile.Close();		
		fsMyfile.Close();

		// ��ȡ�ļ�����
        // ��ӡ��ʾ��Ϣ
		Console.WriteLine("****************��ȡ�ļ�����*********************");

		FileInfo fiMyfile=new FileInfo("myfile.txt");
		Console.WriteLine("�ļ���          : {0}",fiMyfile.Name);
		Console.WriteLine("�ļ���(��·��)  : {0}",fiMyfile.FullName);
		Console.WriteLine("�ļ���С(bytes) : {0}",fiMyfile.Length);
		Console.WriteLine("�ļ�����ʱ��    : {0}",fiMyfile.CreationTime);
	} 
} 

