using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using System.Data;

namespace addCtrlAtRuntimeApp
{
	/// <summary>
	/// Summary description for Form1.
	/// </summary>
	public class Form1 : System.Windows.Forms.Form
	{
        private System.Windows.Forms.Button btn_addButtons;
        private System.Windows.Forms.TextBox txt_msg; 
        private int count;//���ڼ���������˶��ٸ���ť
		
        /// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.Container components = null;

		public Form1()
		{
			//
			// Required for Windows Form Designer support
			//
			InitializeComponent();

			//
			// TODO: Add any constructor code after InitializeComponent call
			//
		}

		/// <summary>
		/// Clean up any resources being used.
		/// </summary>
		protected override void Dispose( bool disposing )
		{
			if( disposing )
			{
				if (components != null) 
				{
					components.Dispose();
				}
			}
			base.Dispose( disposing );
		}

		#region Windows Form Designer generated code
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
            this.btn_addButtons = new System.Windows.Forms.Button();
            this.txt_msg = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // btn_addButtons
            // 
            this.btn_addButtons.Name = "btn_addButtons";
            this.btn_addButtons.TabIndex = 0;
            this.btn_addButtons.Text = "��Ӱ�ť";
            this.btn_addButtons.Click += new System.EventHandler(this.btn_addButtons_Click);
            // 
            // txt_msg
            // 
            this.txt_msg.Location = new System.Drawing.Point(80, 0);
            this.txt_msg.Name = "txt_msg";
            this.txt_msg.Size = new System.Drawing.Size(144, 21);
            this.txt_msg.TabIndex = 1;
            this.txt_msg.Text = "";
            // 
            // Form1
            // 
            this.AutoScaleBaseSize = new System.Drawing.Size(6, 14);
            this.ClientSize = new System.Drawing.Size(292, 273);
            this.Controls.AddRange(new System.Windows.Forms.Control[] {
                                                                          this.txt_msg,
                                                                          this.btn_addButtons});
            this.Name = "Form1";
            this.Text = "��̬��ӿؼ�";
            this.ResumeLayout(false);

        }
		#endregion

		/// <summary>
		/// The main entry point for the application.
		/// </summary>
		[STAThread]
		static void Main() 
		{
			Application.Run(new Form1());
		}

        private void btn_addButtons_Click(object sender, System.EventArgs e)
        {
            // ����������Ŀǰ����ӵļ�����ť
            count++;

            // �������Ӱ�ť��λ��
            int localY = this.btn_addButtons.Height * count;
            int localX = 10 * count;

            Button toAddButton = new Button();

            // ���ô���Ӱ�ť������
            toAddButton.Name="Button " + count;
            toAddButton.Text=" ��ť" + count + " ";
            toAddButton.Location= new Point(localX, localY); 

            // ���ô���Ӱ�ť���¼�
            toAddButton.MouseEnter += new System.EventHandler(this.btn_MouseEnter);
            toAddButton.MouseLeave += new System.EventHandler(this.btn_MouseLeave);
            toAddButton.Click += new System.EventHandler(this.btn_Click);

            // �ѿؼ���ӵ�������
            this.Controls.Add(toAddButton);
        }

        private void btn_MouseEnter(object sender, System.EventArgs e)
        {
            // unboxing
            Button currentButton = (Button)sender;

            // �������ı�����ɫ
            currentButton.BackColor = Color.Blue;;
        } 

        private void btn_MouseLeave(object sender, System.EventArgs e)
        {
            //unboxing
            Button currentButton = (Button)sender;

            // �������ı�����ɫ
            currentButton.BackColor = System.Windows.Forms.Control.DefaultBackColor;
        }

        private void btn_Click(object sender, System.EventArgs e)
        {
            // unboxing
            Button currentButton = (Button)sender;

            // ��ʾ������ĸ���ť
            txt_msg.Text = "������" + currentButton.Text;
        }
	}
}
