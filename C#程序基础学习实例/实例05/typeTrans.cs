using System;
class typeTrans
{
	public static void Main() 
	{
		//ת���ɹ�������
		int intValue1, intValue2;
		long longValue1, longValue2;
		intValue1 = 123;
		longValue1 = 456;
		longValue2 = intValue1;  //��ʽת��
		intValue2 = (int)longValue1;  //��ʾת��
		//longValue1��ֵΪ456����int�����ܴ洢�ķ�Χ�ڣ�ת���ɹ�
		Console.WriteLine("(long){0} = {1}", intValue1, longValue2);
		Console.WriteLine("(int){0} = {1}", longValue1, intValue2);

		//ת��ʧ�ܵ�����
		long longValue3 = 2147483657L;
		int intValue3 = (int) longValue3;  
		//int��ŵ�������Ϊ2147483647���������2147483657��ֵ��������������ˣ�ת��ʧ�ܡ�
		Console.WriteLine("(int){0} = {1}", longValue3, intValue3);		
	}
}
