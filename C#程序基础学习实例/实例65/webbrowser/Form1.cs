using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using System.Data;
using System.Net;
using System.IO;

namespace webbrowser
{
	/// <summary>
	/// Summary description for Form1.
	/// </summary>
	public class Form1 : System.Windows.Forms.Form
	{
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Button btnbrowse;
        private System.Windows.Forms.RadioButton rddownload;
        private System.Windows.Forms.RadioButton rdupload;
        private System.Windows.Forms.RadioButton rddataload;
        private System.Windows.Forms.Button btn;
        private System.Windows.Forms.Button btnres;
        private System.Windows.Forms.TextBox txtbrowse;
        private System.Windows.Forms.TextBox textbox1;

        private System.Windows.Forms.SaveFileDialog savefile = new SaveFileDialog();
        private WebClient client=new WebClient();
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
            this.btnbrowse = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.rdupload = new System.Windows.Forms.RadioButton();
            this.savefile = new System.Windows.Forms.SaveFileDialog();
            this.btnres = new System.Windows.Forms.Button();
            this.btn = new System.Windows.Forms.Button();
            this.rddataload = new System.Windows.Forms.RadioButton();
            this.txtbrowse = new System.Windows.Forms.TextBox();
            this.textbox1 = new System.Windows.Forms.TextBox();
            this.rddownload = new System.Windows.Forms.RadioButton();
            this.SuspendLayout();
            // 
            // btnbrowse
            // 
            this.btnbrowse.Location = new System.Drawing.Point(280, 136);
            this.btnbrowse.Name = "btnbrowse";
            this.btnbrowse.TabIndex = 4;
            this.btnbrowse.Text = "���...";
            this.btnbrowse.Click += new System.EventHandler(this.btnbrowse_Click);
            // 
            // label1
            // 
            this.label1.Location = new System.Drawing.Point(40, 32);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(40, 23);
            this.label1.TabIndex = 0;
            this.label1.Text = "��ַ";
            // 
            // label2
            // 
            this.label2.Location = new System.Drawing.Point(40, 136);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(48, 23);
            this.label2.TabIndex = 2;
            this.label2.Text = "��Ϊ��";
            // 
            // rdupload
            // 
            this.rdupload.Location = new System.Drawing.Point(280, 56);
            this.rdupload.Name = "rdupload";
            this.rdupload.TabIndex = 5;
            this.rdupload.Text = "����";
            this.rdupload.Click += new System.EventHandler(this.rd_Click);
            // 
            // savefile
            // 
            this.savefile.FileName = "doc1";
            // 
            // btnres
            // 
            this.btnres.Location = new System.Drawing.Point(168, 72);
            this.btnres.Name = "btnres";
            this.btnres.TabIndex = 4;
            this.btnres.Text = "��ʼ��";
            this.btnres.Click += new System.EventHandler(this.btnres_Click);
            // 
            // btn
            // 
            this.btn.Enabled = false;
            this.btn.Location = new System.Drawing.Point(88, 72);
            this.btn.Name = "btn";
            this.btn.TabIndex = 4;
            this.btn.Text = "��ʼ����";
            this.btn.Click += new System.EventHandler(this.btn_Click);
            // 
            // rddataload
            // 
            this.rddataload.Location = new System.Drawing.Point(280, 80);
            this.rddataload.Name = "rddataload";
            this.rddataload.TabIndex = 5;
            this.rddataload.Text = "��������";
            this.rddataload.Click += new System.EventHandler(this.rd_Click);
            // 
            // txtbrowse
            // 
            this.txtbrowse.Location = new System.Drawing.Point(80, 136);
            this.txtbrowse.Name = "txtbrowse";
            this.txtbrowse.Size = new System.Drawing.Size(192, 21);
            this.txtbrowse.TabIndex = 3;
            this.txtbrowse.Text = "";
            // 
            // textbox1
            // 
            this.textbox1.Location = new System.Drawing.Point(80, 32);
            this.textbox1.Name = "textbox1";
            this.textbox1.Size = new System.Drawing.Size(192, 21);
            this.textbox1.TabIndex = 1;
            this.textbox1.Text = "http://";
            // 
            // rddownload
            // 
            this.rddownload.Location = new System.Drawing.Point(280, 32);
            this.rddownload.Name = "rddownload";
            this.rddownload.TabIndex = 5;
            this.rddownload.Text = "����";
            this.rddownload.Click += new System.EventHandler(this.rd_Click);
            // 
            // Form1
            // 
            this.AutoScaleBaseSize = new System.Drawing.Size(6, 14);
            this.ClientSize = new System.Drawing.Size(416, 205);
            this.Controls.AddRange(new System.Windows.Forms.Control[] {
                                                                          this.rddataload,
                                                                          this.rdupload,
                                                                          this.rddownload,
                                                                          this.btnbrowse,
                                                                          this.btnres,
                                                                          this.btn,
                                                                          this.txtbrowse,
                                                                          this.label2,
                                                                          this.textbox1,
                                                                          this.label1});
            this.Name = "Form1";
            this.Text = "��/������ҳ";
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

        private void rd_Click(object sender, System.EventArgs e)
        {
            if( rddownload.Checked==true) 
            {
                btn.Text="��ʼ����";
            }
            if ( rdupload.Checked==true) 
            {
                btn.Text="��ʼ����";
            }
            if( rddataload.Checked==true) 
            {
                btn.Text="��ʼ��������";
            }
        }

        private void btnbrowse_Click(object sender, System.EventArgs e)
        {
            btn.Enabled=true;
            savefile.Filter="Html(*.html)|*.html|All Files (*.*)|*.*";
            savefile.Title="���Ϊ";
            if (txtbrowse.Text=="")
            {
                if (savefile.ShowDialog()==DialogResult.OK)
                {
                    txtbrowse.Text=savefile.FileName;
                }
                else
                {
                    MessageBox.Show("δѡ���ļ�....","����");
                }
            }
        }

        private void btnres_Click(object sender, System.EventArgs e)
        {
            string URL=textbox1.Text;
            try
            {
                WebRequest myre=WebRequest.Create(URL);
            }
            catch(WebException exp)
            {
                MessageBox.Show(exp.Message,"����");
            }
        }

        private void btn_Click(object sender, System.EventArgs e)
        {
            string URL=textbox1.Text;
	
            if (rddownload.Checked==true)
            {
                //client.DownloadFile(URL , txtbrowse.Text);
	
                try
                {
                    this.Text=URL+"......������";
                    btn.Text="��ʼ����";
                    client.DownloadFile(URL , txtbrowse.Text);
                    MessageBox.Show("���سɹ�......","�ɹ�");
                    this.Text="D/U Loader";
	  
                }
                catch(WebException exp)
                {
                    MessageBox.Show(exp.Message,"����");
                }
            }
            else if(rdupload.Checked==true)
            {
	
                try
                {
                    client.UploadFile(URL,txtbrowse.Text);
                    this.Text=URL+"......������";
                    this.Text="��/������ҳ";
		
                }
                catch(WebException exp)
                {
                    MessageBox.Show(exp.Message,"����");
                }
            }
            else if(rddataload.Checked==true)
            {
                try
                {
                    this.Text=URL+"......����������";
                    Stream data = client.OpenRead(URL);
                    StreamReader reader = new StreamReader(data);
                    byte[] mybyte=new byte[100000];
                    int allbyte=(int)mybyte.Length;
                    int startbyte=0;
                    while(allbyte>0) 
                    {
                        int n= data.Read(mybyte,startbyte,allbyte);
                        if (n==0)
                        {
                            break;
                        }
                        allbyte-=n;
                        startbyte+=n;
                    }
                    FileStream filestr=new FileStream(txtbrowse.Text,FileMode.OpenOrCreate,FileAccess.Write);
                    filestr.Write(mybyte,0,startbyte);
      
                    data.Close();
                    filestr.Close();	
                    MessageBox.Show("���ؽ���....","�ɹ�");
                    this.Text="��/������ҳ";
                }
                catch(WebException exp)
                {
                    MessageBox.Show(exp.Message,"����");
                }
            }
        }
	}
}
