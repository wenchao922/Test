using System;
using System.Data;   
using System.Data.OleDb;   
namespace ADONETWriteQuery  
{ 
      class Class1 
      {  
            static void Main(string[] args)  
            {  
                  string strDSN = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=mcTest.MDB";  
                  string strSQL = "INSERT INTO Developer(Name, Address ) VALUES('NewNameIInsert', 'NewAddressIInsert')" ;  
                   
                  // ʵ����OleDbCommand����
                  OleDbConnection myConn = new OleDbConnection(strDSN); 

                  // ʵ����OleDbCommand����
                  OleDbCommand myCmd = new OleDbCommand(strSQL, myConn); 

                  // �����ݿ⣬ִ�в���SQL���
                  try  
                  {  
                        myConn.Open();  
                        myCmd.ExecuteNonQuery(); 
                        Console.WriteLine("��������ɹ�!");
                  }  
                  catch (Exception e)  
                  {  
                        Console.WriteLine("�ڲ������ݿ�����з�������:\n{0}", e.Message);  
                  }  
                  finally  
                  {  
                        myConn.Close();  
                  }  
            } 
      }  
} 
