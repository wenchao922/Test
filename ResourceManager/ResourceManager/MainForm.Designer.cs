namespace ResourceManager
{
    partial class MainForm
    {
        /// <summary>
        /// 必需的设计器变量。
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// 清理所有正在使用的资源。
        /// </summary>
        /// <param name="disposing">如果应释放托管资源，为 true；否则为 false。</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows 窗体设计器生成的代码

        /// <summary>
        /// 设计器支持所需的方法 - 不要
        /// 使用代码编辑器修改此方法的内容。
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.Windows.Forms.ListViewGroup listViewGroup1 = new System.Windows.Forms.ListViewGroup("驱动器", System.Windows.Forms.HorizontalAlignment.Left);
            System.Windows.Forms.ListViewGroup listViewGroup2 = new System.Windows.Forms.ListViewGroup("文件夹", System.Windows.Forms.HorizontalAlignment.Left);
            System.Windows.Forms.ListViewGroup listViewGroup3 = new System.Windows.Forms.ListViewGroup("文件", System.Windows.Forms.HorizontalAlignment.Left);
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(MainForm));
            this.lvContents = new System.Windows.Forms.ListView();
            this.contextMenuStrip1 = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.tsmiLarge = new System.Windows.Forms.ToolStripMenuItem();
            this.tsmiSmall = new System.Windows.Forms.ToolStripMenuItem();
            this.tsmiList = new System.Windows.Forms.ToolStripMenuItem();
            this.il32 = new System.Windows.Forms.ImageList(this.components);
            this.il16 = new System.Windows.Forms.ImageList(this.components);
            this.label1 = new System.Windows.Forms.Label();
            this.txtAddress = new System.Windows.Forms.TextBox();
            this.btnBack = new System.Windows.Forms.Button();
            this.btnForward = new System.Windows.Forms.Button();
            this.btnUp = new System.Windows.Forms.Button();
            this.btnGo = new System.Windows.Forms.Button();
            this.lblInfo = new System.Windows.Forms.Label();
            this.tvMenu = new System.Windows.Forms.TreeView();
            this.contextMenuStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // lvContents
            // 
            this.lvContents.ContextMenuStrip = this.contextMenuStrip1;
            listViewGroup1.Header = "驱动器";
            listViewGroup1.Name = "Drives";
            listViewGroup2.Header = "文件夹";
            listViewGroup2.Name = "Folder";
            listViewGroup3.Header = "文件";
            listViewGroup3.Name = "File";
            this.lvContents.Groups.AddRange(new System.Windows.Forms.ListViewGroup[] {
            listViewGroup1,
            listViewGroup2,
            listViewGroup3});
            this.lvContents.LargeImageList = this.il32;
            this.lvContents.Location = new System.Drawing.Point(192, 61);
            this.lvContents.Name = "lvContents";
            this.lvContents.Size = new System.Drawing.Size(480, 416);
            this.lvContents.SmallImageList = this.il16;
            this.lvContents.TabIndex = 1;
            this.lvContents.UseCompatibleStateImageBehavior = false;
            this.lvContents.DoubleClick += new System.EventHandler(this.lvContents_DoubleClick);
            this.lvContents.Click += new System.EventHandler(this.lvContents_Click);
            // 
            // contextMenuStrip1
            // 
            this.contextMenuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.tsmiLarge,
            this.tsmiSmall,
            this.tsmiList});
            this.contextMenuStrip1.Name = "contextMenuStrip1";
            this.contextMenuStrip1.Size = new System.Drawing.Size(107, 70);
            // 
            // tsmiLarge
            // 
            this.tsmiLarge.Name = "tsmiLarge";
            this.tsmiLarge.Size = new System.Drawing.Size(106, 22);
            this.tsmiLarge.Tag = "0";
            this.tsmiLarge.Text = "大图标";
            this.tsmiLarge.Click += new System.EventHandler(this.tsmiListStyle_Click);
            // 
            // tsmiSmall
            // 
            this.tsmiSmall.Name = "tsmiSmall";
            this.tsmiSmall.Size = new System.Drawing.Size(106, 22);
            this.tsmiSmall.Tag = "1";
            this.tsmiSmall.Text = "小图标";
            this.tsmiSmall.Click += new System.EventHandler(this.tsmiListStyle_Click);
            // 
            // tsmiList
            // 
            this.tsmiList.Name = "tsmiList";
            this.tsmiList.Size = new System.Drawing.Size(106, 22);
            this.tsmiList.Tag = "2";
            this.tsmiList.Text = "列表";
            this.tsmiList.Click += new System.EventHandler(this.tsmiListStyle_Click);
            // 
            // il32
            // 
            this.il32.ImageStream = ((System.Windows.Forms.ImageListStreamer)(resources.GetObject("il32.ImageStream")));
            this.il32.TransparentColor = System.Drawing.Color.Transparent;
            this.il32.Images.SetKeyName(0, "CD.ico");
            this.il32.Images.SetKeyName(1, "Folder.ico");
            this.il32.Images.SetKeyName(2, "Drivers.ico");
            this.il32.Images.SetKeyName(3, "Exe.ico");
            // 
            // il16
            // 
            this.il16.ImageStream = ((System.Windows.Forms.ImageListStreamer)(resources.GetObject("il16.ImageStream")));
            this.il16.TransparentColor = System.Drawing.Color.Transparent;
            this.il16.Images.SetKeyName(0, "CD.ico");
            this.il16.Images.SetKeyName(1, "Folder.ico");
            this.il16.Images.SetKeyName(2, "Drivers.ico");
            this.il16.Images.SetKeyName(3, "Exe.ico");
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 9);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(35, 12);
            this.label1.TabIndex = 4;
            this.label1.Text = "路径:";
            // 
            // txtAddress
            // 
            this.txtAddress.Location = new System.Drawing.Point(53, 6);
            this.txtAddress.Name = "txtAddress";
            this.txtAddress.Size = new System.Drawing.Size(538, 21);
            this.txtAddress.TabIndex = 5;
            this.txtAddress.Text = "我的电脑";
            // 
            // btnBack
            // 
            this.btnBack.Enabled = false;
            this.btnBack.Location = new System.Drawing.Point(14, 32);
            this.btnBack.Name = "btnBack";
            this.btnBack.Size = new System.Drawing.Size(75, 23);
            this.btnBack.TabIndex = 6;
            this.btnBack.Text = "后退";
            this.btnBack.UseVisualStyleBackColor = true;
            this.btnBack.Click += new System.EventHandler(this.btnBack_Click);
            // 
            // btnForward
            // 
            this.btnForward.Enabled = false;
            this.btnForward.Location = new System.Drawing.Point(95, 32);
            this.btnForward.Name = "btnForward";
            this.btnForward.Size = new System.Drawing.Size(75, 23);
            this.btnForward.TabIndex = 6;
            this.btnForward.Text = "前进";
            this.btnForward.UseVisualStyleBackColor = true;
            this.btnForward.Click += new System.EventHandler(this.btnForward_Click);
            // 
            // btnUp
            // 
            this.btnUp.Enabled = false;
            this.btnUp.Location = new System.Drawing.Point(176, 32);
            this.btnUp.Name = "btnUp";
            this.btnUp.Size = new System.Drawing.Size(90, 23);
            this.btnUp.TabIndex = 6;
            this.btnUp.Text = "返回上级菜单";
            this.btnUp.UseVisualStyleBackColor = true;
            this.btnUp.Click += new System.EventHandler(this.btnUp_Click);
            // 
            // btnGo
            // 
            this.btnGo.Location = new System.Drawing.Point(597, 4);
            this.btnGo.Name = "btnGo";
            this.btnGo.Size = new System.Drawing.Size(75, 23);
            this.btnGo.TabIndex = 6;
            this.btnGo.Text = "转到";
            this.btnGo.UseVisualStyleBackColor = true;
            this.btnGo.Click += new System.EventHandler(this.btnGo_Click);
            // 
            // lblInfo
            // 
            this.lblInfo.Location = new System.Drawing.Point(14, 311);
            this.lblInfo.Name = "lblInfo";
            this.lblInfo.Size = new System.Drawing.Size(172, 166);
            this.lblInfo.TabIndex = 8;
            this.lblInfo.Text = "文件信息";
            // 
            // tvMenu
            // 
            this.tvMenu.HideSelection = false;
            this.tvMenu.Location = new System.Drawing.Point(12, 61);
            this.tvMenu.Name = "tvMenu";
            this.tvMenu.Size = new System.Drawing.Size(174, 243);
            this.tvMenu.TabIndex = 2;
            // 
            // MainForm
            // 
            this.AcceptButton = this.btnGo;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(684, 489);
            this.Controls.Add(this.lblInfo);
            this.Controls.Add(this.btnUp);
            this.Controls.Add(this.btnGo);
            this.Controls.Add(this.btnForward);
            this.Controls.Add(this.btnBack);
            this.Controls.Add(this.txtAddress);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.tvMenu);
            this.Controls.Add(this.lvContents);
            this.Name = "MainForm";
            this.Text = "资源管理器";
            this.Load += new System.EventHandler(this.MainForm_Load);
            this.contextMenuStrip1.ResumeLayout(false);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ListView lvContents;
        private System.Windows.Forms.ImageList il32;
        private System.Windows.Forms.ImageList il16;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtAddress;
        private System.Windows.Forms.Button btnBack;
        private System.Windows.Forms.Button btnForward;
        private System.Windows.Forms.Button btnUp;
        private System.Windows.Forms.Button btnGo;
        private System.Windows.Forms.Label lblInfo;
        private System.Windows.Forms.ContextMenuStrip contextMenuStrip1;
        private System.Windows.Forms.ToolStripMenuItem tsmiLarge;
        private System.Windows.Forms.ToolStripMenuItem tsmiSmall;
        private System.Windows.Forms.ToolStripMenuItem tsmiList;
        private System.Windows.Forms.TreeView tvMenu;
    }
}

