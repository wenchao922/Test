using System;

class predefinedTypes
{
	public static void Main() 
	{
		string str = "this is a string.";  //����һ���ַ�������
		Console.WriteLine(str);  //��ӡ������str
		string strCopy = string.Copy(str); //��str��ֵ������һ���ַ�������strCopy
		Console.WriteLine(strCopy);  //��ӡ������strCopy
		bool testbool = (str == strCopy);  //�б�str��ֵ�Ƿ��strCopy��ֵ�Ƿ���ȣ����ѽ�������߼�����testbool
		Console.WriteLine(testbool);  //��ӡ��str��strCopy�Ƿ���ȵ��߼����
		testbool = ((object)str == (object)strCopy);  //�б�str��ָ�Ķ����Ƿ��strCopy��ָ�Ķ�����ͬ�����ѽ�������߼�����testbool
		Console.WriteLine(testbool); //��ӡ��str��ָ�����strCopy��ָ�����Ƿ���ͬ���߼����
		//float testfloat = 2323.03;  //����д�Ǵ���ģ���ΪC#��Ĭ�ϵ���ֵ��������Ϊdouble. һ��Ҫ�����ֺ����F���С������͵������͵�ת����Ҫǿ�ƽ��С�
		float testfloat = 2323.03F;  //����д������ȷ�ġ�
		Console.WriteLine(testfloat); //��ӡ��testfloat��ֵ
		double testdouble = 2323.03;  //����һ��double����������ֵ
		//double testdouble = 2323.03D;  //����дҲ�У�������
		Console.WriteLine(testdouble); //��ӡ��testdouble��ֵ
		testbool = ( testfloat == testdouble );  //�б�testfloat��testdouble�Ƿ����
		Console.WriteLine(testbool);  //����Ľ����False��ͬ��2323.03����Ϊ�������Ͳ�ͬ���洢�ĳ���Ҳ��ͬ������ƽ��Ҳ��ͬ���ʲ���ȡ�
	}
}
