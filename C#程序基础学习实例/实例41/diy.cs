using System;
using System.ComponentModel;
using System.Windows.Forms;
using System.Drawing;

public class DIY : Form
{
    private Button btncont = new Button();
    private TextBox TBox = new TextBox();
    private int count = 0; //���ڼ�����ȫ�ֱ���
    
    //
    // ���캯��
    //
    DIY()
    {
        InitializeComponent(); 
    }
    
    //
    // ��ʼ�������
    //
    private void InitializeComponent() 
    { 
        //
        // btncont
        //
        btncont.Text = "��㿴";
        EventHandler handler = new EventHandler(btncontClick);
        btncont.Click += handler;

        //
        // TBox
        //        
        TBox.Location = new Point(0, 80);
        TBox.Size = new Size(150, 50);
        TBox.TabIndex = 1;
       
        // 
        // Form1
        // 
        this.ClientSize = new System.Drawing.Size(230, 170);
        this.Name = "Form1";
        this.Text = "Do It Yourself";
        this.ResumeLayout(false);
        this.Controls.Add(btncont);
        this.Controls.Add(TBox);
    }
    
    //
    // ��ť��click�¼�
    //
    private void btncontClick (object sender, EventArgs e)
    {
        count++;
        TBox.Text = "���Ѿ������" + count + "�ΰ�ť";
        this.BackColor = Color.IndianRed;
        TBox.BackColor=Color.Cyan;    
    }
    
    //
    // ������
    //
    public static void Main(string[] args) 
    {
        Application.Run(new DIY());
    }
}

