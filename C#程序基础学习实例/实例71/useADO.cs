using System;
using System.Data;
using System.Data.OleDb;

namespace UseADO
{
    class useAdo
    {
        static void Main(string[] args)
        {
            string strDSN = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=mcTest.MDB";
            string strSQL = "SELECT * FROM Developer" ;

            // ʵ����OleDbConnection����
            OleDbConnection myConn = new OleDbConnection(strDSN);
            
            // ʵ����OleDbCommand����
            OleDbCommand myCmd = new OleDbCommand( strSQL, myConn );
            
            // ʵ����OleDbDataReader����
            OleDbDataReader datareader = null;

            // �������ݿ⣬��ȡ����
            try
            {
                myConn.Open();
                datareader = myCmd.ExecuteReader();
                while (datareader.Read() )
                {
                    Console.WriteLine( "Developer Name:{0}, Address:{1}", datareader["Name"], datareader["Address"]);
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("Oooops. I did it again:\n{0}", e.Message);
            }
            finally
            {
                myConn.Close();
            }
        }
    }
} 