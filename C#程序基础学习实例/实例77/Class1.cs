using System;

namespace ʵ��77
{
	/// <summary>
	/// Class1 ��ժҪ˵����
	/// </summary>
	public class Sample
	{
		private System.Windows.Forms.ListBox listBox1;

		public Sample(System.Windows.Forms.ListBox a)
		{
			this.listBox1 = a;
		}

		public void work()
		{
			listBox1.Items.Add("Sample��work�߳�������0");
		}
	}

	class Class1
	{
		/// <summary>
		/// Ӧ�ó��������ڵ㡣
		/// </summary>
		[STAThread]
		static void Main(string[] args)
		{
			//
			// TODO: �ڴ˴���Ӵ���������Ӧ�ó���
			//
		}
	}
}
