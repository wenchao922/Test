using System;

public class MatrixMultiply
{
    public static void Main()
    {
        // ����һ��2��3�е���ά���飬���ڴ�ž���A
        int[,] matrixA = new int[2,3];

        // ����һ��3��4�е���ά���飬���ڴ�ž���B
        // ��ʼ������B
        int[,] matrixB = new int[3,4]{ {4,2,1,7}, {3,6,1,0}, {5,3,2,4} };

        // ����һ��2��4�е���ά���飬���ڴ�ž���A�;���B�ĳ˻�
        int[,] matrixC = new int[2,4];

        // ��ʼ������A
        for(int i = 0; i < 2; i++)
        {
            for(int j = 0; j < 3; j++)
            {
                matrixA[i,j] = (i + 2) * (j + 2) + 1;
            }
        }

        // �������A�;���B�ĳ˻�
        for(int i = 0; i < 2; i++)
        {
            for(int j = 0; j < 4; j++)
            {
                // ��ʼ������C
                matrixC[i,j] = 0;

                // �������A�;���B�ĳ˻�������ֵ����ھ���C��
                for(int k = 0; k < 3; k++)
                {
                    matrixC[i,j] += matrixA[i,k] * matrixB[k,j];
                }
            }
        }

        // ��ӡ����A
        Console.WriteLine("\n********����A********");
        outputMatrix(matrixA, 2, 3);

        // ��ӡ����B
        Console.WriteLine("\n********����B********");
        outputMatrix(matrixB, 3, 4);

        // ��ӡ����C
        Console.WriteLine("\n********����A X ����B********");
        outputMatrix(matrixC, 2, 4);
    }

    // ���ܣ� �������
    // ������ 
    //        matrixX       : ����ӡ�ľ���
    //        rowCount      : ���������
    //        columnCount   : ���������
    private static void outputMatrix(int[,] matrixX, int rowCount, int columnCount)
    {
        // ��������������򲻴�ӡ����
        if(matrixX.Length != rowCount * columnCount)
        {
            Console.WriteLine("����������!");
            return ;
        }
        
        // ��ӡ����
        for(int i = 0; i < rowCount; i++)
        {
            // ��һ��ӡ����������Ԫ��
            for(int j = 0; j < columnCount; j++)
            {
                Console.Write(matrixX[i,j] + "\t");
            }

            // ����
            Console.WriteLine();
        }
    }
}
