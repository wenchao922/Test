using System;

class listArg0
{
	public static void Main(String[] args)
	{
		string strName;  //����һ��string���͵�ֵ����
		strName = args[0];  //�ѵ�һ��������������strName
		Console.WriteLine("This is the first argument: {0}!", strName);  //��ʽ�������һ������
	}
}


