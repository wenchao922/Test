using System;  //������һ����System�����ռ�

class easyInput  //����������ļ�����ͬҲ����ν
{
	public static void Main()
	{
		string strName;  //����һ��string���͵�ֵ����
		Console.Write("please input your name:");  //���һ�仰����������
		strName = Console.ReadLine();  //�Ӽ��̶����û������룬�س���ʾ�������
		Console.WriteLine("hello, {0}!", strName);  //��ʽ�����hello��Ϣ
	}
}


