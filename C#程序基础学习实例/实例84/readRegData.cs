using System; 
using Microsoft.Win32; 

public class ReadRegData 
{ 
    public ReadRegData()
    { 
        // 
        // TODO: Add Constructor Logic here 
        // 
    }

    public static int Main(string[] args) 
    { 
        // �򿪸�·��
        RegistryKey MYSOFTKEY = RegistryKey.OpenRemoteBaseKey(Microsoft.Win32.RegistryHive.CurrentUser,""); 

        // ��·��
        string subkey = "Software\\��˾��\\�����"; 

        // ����·��
        RegistryKey SUBKEY = MYSOFTKEY.OpenSubKey(subkey); 

        // �������еļ���
        String [] keyNameArray = SUBKEY.GetValueNames();

        // ��ӡ�����м��������Ӧ�ļ�ֵ
        foreach (String keyName in keyNameArray)
        {
            // ��ȡ��ֵ
            string keyValue = (string)SUBKEY.GetValue(keyName);             
            Console.WriteLine(keyName + " = " + keyValue);
        }

        return 0; 
    } 
} 

