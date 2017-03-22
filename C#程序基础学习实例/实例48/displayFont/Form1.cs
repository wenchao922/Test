/*
������ʾ�������ʾwindowsϵͳ�ϵ��������塣
�õ������¼����ࣺ
InstalledFontCollection
FontFamily
Font

ʵ����InstalledFontCollection�࣬������Families���Եõ����е�������Ϣ�������е�������Ϣ�����FontFamily[]�����У�
FontFamily[] ffs = ifc.Families; 

����foreachѭ�������е�������Ϣд��richtextbox�У�ע�⣬ÿ��д��ʱ��ѡ�����塣

 */
using System;
using System.Drawing;
using System.Drawing.Text;
using System.Windows.Forms;

namespace DisplayFonts
{ 

    /// <summary>
    /// Summary description for Form1.
    /// </summary> 

    public class DisplayFonts : System.Windows.Forms.Form
    {
        private System.Windows.Forms.RichTextBox richTextBox1;
        private System.Windows.Forms.Button b_DisplayFonts;
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.Container components = null;
        public DisplayFonts()
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
            this.b_DisplayFonts = new System.Windows.Forms.Button();
            this.richTextBox1 = new System.Windows.Forms.RichTextBox();
            this.SuspendLayout();
            // 
            // b_DisplayFonts
            // 
            this.b_DisplayFonts.Location = new System.Drawing.Point(154, 268);
            this.b_DisplayFonts.Name = "b_DisplayFonts";
            this.b_DisplayFonts.Size = new System.Drawing.Size(163, 28);
            this.b_DisplayFonts.TabIndex = 2;
            this.b_DisplayFonts.Text = "��ʾϵͳ��������";
            this.b_DisplayFonts.Click += new System.EventHandler(this.DisplayFonts_Click);
            // 
            // richTextBox1
            // 
            this.richTextBox1.Name = "richTextBox1";
            this.richTextBox1.Size = new System.Drawing.Size(471, 259);
            this.richTextBox1.TabIndex = 0;
            this.richTextBox1.Text = "";
            // 
            // DisplayFonts
            // 
            this.AutoScaleBaseSize = new System.Drawing.Size(6, 14);
            this.ClientSize = new System.Drawing.Size(471, 301);
            this.Controls.AddRange(new System.Windows.Forms.Control[] {
                                                                          this.b_DisplayFonts,
                                                                          this.richTextBox1});
            this.Name = "DisplayFonts";
            this.Text = "��ʾ����";
            this.ResumeLayout(false);

        }
           #endregion 

        /// <summary>
        /// The main entry point for the application.
        /// </summary> 

        [STAThread] 

        static void Main () 
        {
            Application.Run(new DisplayFonts());
        } 

        //
        // ��ʾ��������
        //
        private void DisplayFonts_Click(object sender, System.EventArgs e)
        {
            InstalledFontCollection ifc = new InstalledFontCollection();
            FontFamily[] ffs = ifc.Families;
            Font f;
            richTextBox1.Clear();
            foreach(FontFamily ff in ffs)
            {
                // ���ô�д�����ֵ�����
                if (ff.IsStyleAvailable(System.Drawing.FontStyle.Regular))  
                    f = new Font(ff.GetName(1),12,System.Drawing.FontStyle.Regular); 

                else if(ff.IsStyleAvailable(System.Drawing.FontStyle.Bold)) 

                    f = new Font(ff.GetName(1),12, System.Drawing.FontStyle.Bold);
                else if (ff.IsStyleAvailable(System.Drawing.FontStyle.Italic))
                    f = new Font(ff.GetName(1),12, System.Drawing.FontStyle.Italic);
                else
                    f = new Font(ff.GetName(1),12, System.Drawing.FontStyle.Underline);
                
                // ע�⣺ÿ��AppendText֮ǰ����������
                richTextBox1.SelectionFont=f;
                richTextBox1.AppendText(ff.GetName(1)+"\r\n");
                richTextBox1.SelectionFont=f;
                richTextBox1.AppendText("abcdefghijklmnopqrstuvwxyz\r\n");
                richTextBox1.SelectionFont=f;
                richTextBox1.AppendText("ABCDEFGHIJKLMNOPQRSTUVWXYZ\r\n");
                
                richTextBox1.AppendText("===================================================\r\n"); 

            } 

            MessageBox.Show("�Ѱ�����������ʾ���ı�����","�ɹ�", MessageBoxButtons.OK, MessageBoxIcon.Exclamation); 

        } 

    } 

}


