using System; 
using System.Diagnostics;

public class AllProcess
{ 
    public AllProcess()
    { 
        // 
        // TODO: Add Constructor Logic here 
        // 
    }

    public static int Main(string[] args) 
    { 
        // �����������
        Process[] procList = new Process[100]; 
        
        // �õ����еĽ���
        procList = Process.GetProcesses(); 
        
        // ��ӡǰ20�����̵Ľ������ƺ�ID��
        for ( int i=0; i<20; i++)         
        {         
            string strProcName = procList[i].ProcessName; 
            int iProcID = procList[i].Id;
            Console.WriteLine(strProcName + " : " + iProcID);
        } 

        return 0; 
    } 
} 

