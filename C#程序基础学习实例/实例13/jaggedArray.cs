using System;

public class JaggedArray 
{
   public static void Main() 
   {
      // ����һ����������飬������������Ԫ��
      int[][] myArray = new int[2][];

      // ���е�һ��Ԫ����һ���������Ԫ�ص�����
      // ��ʼ��myArray[0]
      myArray[0] = new int[5] {1,3,5,7,9};

       
      // ���еڶ���Ԫ����һ������4��Ԫ�ص�����
      // ��ʼ��myArray[1]
      myArray[1] = new int[4] {0, 2, 4, 6};

      // ��һ��ӡ����������������е�Ԫ��
      for (int i=0; i < myArray.Length; i++) 
      {
          Console.Write("��({0})������: ", i);

          // ��ӡһά�����е�Ԫ��
          for (int j=0; j < myArray[i].Length; j++)
          {
              Console.Write("{0} ", myArray[i][j]);
          }

          Console.WriteLine();
      }
   }
}
