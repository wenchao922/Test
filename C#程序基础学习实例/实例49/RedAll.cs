/*
��Ϸ����ÿ��һ����ť����ı��Լ��Լ���Χ�ĸ���ť����ɫ
��Ϸʤ�������а�ť���
˼·���ڴ����ϲ��ð�ť��ʱ�������飬���ֲ��ô������£��������ҵ�ԭ�򣬰����а�ť���������Ρ��ѵ�������λ���Լ��������Ұ�ť����ţ��������ʱ������ϸ����ⲿ�֡�

*/

using System;
using System.Windows.Forms;
using System.Drawing;
using System.IO;

class MainForm : Form
{
	private const int BUTTON_COUNT=25; //��ť����(ƽ���� 16,25,36,49,...)
	private int SQUARE_ROOT=Convert.ToInt32(Math.Sqrt(BUTTON_COUNT)); //��ť������ƽ����
	private int PART_COUNT=2*Convert.ToInt32(Math.Sqrt(BUTTON_COUNT))+1;
	private Button[] btn=new Button[BUTTON_COUNT]; //��ť����
	private Label lblAim; 
	
	private int count = 0;
	private string step = "";
	
	public MainForm()
	{
		//
		// ���ô�������
		//
		this.Left=0;
		this.Top=0;
		this.MaximizeBox=false;
		this.FormBorderStyle=FormBorderStyle.Fixed3D;
		this.Text = "���ú�";
		
		//
		// �����а�ť���õ�������
		//
		for (int i=0;i<BUTTON_COUNT;i++)
		{
			btn[i]=new Button();
			btn[i].Width=this.ClientSize.Width/PART_COUNT;
			btn[i].Height=this.ClientSize.Height/PART_COUNT;
			btn[i].Left=this.ClientSize.Width/PART_COUNT+2*(i%SQUARE_ROOT)*this.ClientSize.Width/PART_COUNT;
			btn[i].Top=this.ClientSize.Height/PART_COUNT+2*(i/SQUARE_ROOT)*this.ClientSize.Height/PART_COUNT;
			btn[i].BackColor=Color.SeaGreen;
			btn[i].Text=Convert.ToString(i+1);
			btn[i].Click+=new EventHandler(btn_Click); //����ť����¼�		
			btn[i].Tag=0;
			this.Controls.Add(btn[i]);
		}
		
		//
		// Label
		//
		lblAim=new Label();
		lblAim.Width=this.ClientSize.Width;
		lblAim.Text="������а�ť���!  Ҫ��Ŷ!";
		this.Controls.Add(lblAim);
	}
	
	//
	// ���а�ť��click�¼�
	// ���ܣ��ı���Χ�ĸ���ť����ɫ
	//
	public void btn_Click(object sender, EventArgs eArgs)
	{
		int i=Convert.ToInt32(((Button)sender).Text)-1;
		ChangeButtonState(i); //������İ�ť
		ChangeButtonState((i/SQUARE_ROOT)*SQUARE_ROOT+(i+1)%SQUARE_ROOT); //�ұ߰�ť
		ChangeButtonState((i/SQUARE_ROOT)*SQUARE_ROOT+(i+SQUARE_ROOT-1)%SQUARE_ROOT); //��߰�ť
		ChangeButtonState((i+SQUARE_ROOT)%BUTTON_COUNT); //�±߰�ť
		ChangeButtonState((i-SQUARE_ROOT+BUTTON_COUNT)%BUTTON_COUNT); //�ϱ߰�ť
		
		count++;
		step += (i+1).ToString() + " ";
		
		//����Ƿ����а�ť����ɫ���Ѿ������
		if (CheckForWin()==true) 
		{
		    WonTheGame(); 
		}
	}
	
	//
	// �ı䰴ť״̬
	//
	private void ChangeButtonState(int i)
	{
		if (Convert.ToInt32(btn[i].Tag)==0)
		{
			btn[i].Tag=1;
			btn[i].BackColor=Color.Red;
		}
		else
		{
			btn[i].Tag=0;
			btn[i].BackColor=Color.SeaGreen;
		}					
	}
	
	//
	// ����Ƿ����еİ�ť��ɫ�����
	//
	private bool CheckForWin()
	{
		for (int i=0;i<BUTTON_COUNT;i++)
		{
			if (Convert.ToInt32(btn[i].Tag)==0) 
			{
				return false;
			}
		}
		return true;		
	}
	
	//
	// Ӯ����Ϸ����ϲ
	//
	private void WonTheGame()
	{
		MessageBox.Show("��ϲ,��Ӯ��!�����!\n������" + count.ToString() + "��\n����Ϊ" + step, "��ϲ!!!", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
		for (int i=0;i<BUTTON_COUNT;i++)
		{
			btn[i].Click-=new EventHandler(btn_Click);
		}
		
        // д�ļ�
        FileStream outputfile = null;
        outputfile = new FileStream("step.txt",FileMode.Create, FileAccess.Write);
        StreamWriter writer = new StreamWriter(outputfile);
        writer.BaseStream.Seek(0, SeekOrigin.End);
        writer.WriteLine(step);
        writer.Flush();
        writer.Close();
	}
	
	public static void Main(string[] args)
	{
		Application.Run(new MainForm());
	}
}
