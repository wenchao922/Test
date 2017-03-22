using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.IO;
using System.Diagnostics;//导入命名空间
namespace ResourceManager
{

    public partial class MainForm : Form
    {
        public MainForm()
        {
            InitializeComponent();
        }
        //访问记录集合
        List<string> history = new List<string>();
        //当前访问路径在集合里的下标
        int index = -1;
        //输入的路径是文件还是文件夹
        bool isFolder = true;

        /// <summary>
        /// 程序加载时创建两级节点
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void MainForm_Load(object sender, EventArgs e)
        {
            CreateRoot();
            tvMenu.Nodes[0].Expand();
            
            this.tvMenu.AfterExpand += new System.Windows.Forms.TreeViewEventHandler(this.tvMenu_AfterExpand);
        }

        /// <summary>
        /// 窗体加载时加载盘符的方法
        /// </summary>
        private void CreateRoot()
        {
            
            try
            {
                string[] discs = Environment.GetLogicalDrives();
                TreeNode tn;
                ListViewItem item;
                DriveInfo di;
                TreeNode root = new TreeNode("我的电脑");
                root.Tag = "root";

                if (tvMenu.Nodes.Count == 0)
                {
                    tvMenu.Nodes.Add(root);
                }
                else
                {
                    tvMenu.Nodes[0].Nodes.Clear();
                }
                tvMenu.SelectedNode = tvMenu.Nodes[0];

                foreach (string var in discs)
                {
                    tn = new TreeNode(var.Substring(0, 1) + "盘");
                    tn.Tag = var;
                    tn.Name = var;
                    tvMenu.Nodes[0].Nodes.Add(tn);

                    #region 添加ListView盘符
                    item = new ListViewItem(tn.Text);
                    di = new DriveInfo(var.Substring(0, 1));
                    switch (di.DriveType)
                    {
                        case DriveType.CDRom: item.ImageKey = "CD.ico";
                            break;
                        case DriveType.Fixed: item.ImageKey = "Drivers.ico";
                            break;
                        case DriveType.Network:
                            break;
                        case DriveType.NoRootDirectory:
                            break;
                        case DriveType.Ram:
                            break;
                        case DriveType.Removable:
                            break;
                        case DriveType.Unknown:
                            break;
                        default:
                            break;
                    }
                    item.Tag = var;
                    item.Group = lvContents.Groups["Drives"];
                    lvContents.Items.Add(item);
                    #endregion

                    CreateNodes(tn);

            }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        


        //触发节点的深度
        int eLevel = 0;

        /// <summary>
        /// 当展开某个节点后,调用创建节点方法创建两个级别的节点
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void tvMenu_AfterExpand(object sender, TreeViewEventArgs e)
        {
            tvMenu.SelectedNode = e.Node;
            txtAddress.Text = (string)tvMenu.SelectedNode.Tag;
            if ((string)e.Node.Tag == "root")
            {
                lvContents.Items.Clear();
                CreateRoot();
                txtAddress.Text = "我的电脑";
                btnUp.Enabled = false;
                return;
            }
            eLevel = e.Node.Level;
            e.Node.Nodes.Clear();
            CreateNodes(e.Node);

            lvContents.SelectedItems.Clear();
            CreateListView();
            btnUp.Enabled = true;
        }

        //ListView中所选择项的Tag值
        string lvSelectedItemTag = "";

        /// <summary>
        /// 当点击ListView中的项，TreeView的节点跟随展开
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void lvContents_DoubleClick(object sender, EventArgs e)
        {
            //如果是程序，就执行
            if (lvContents.SelectedItems[0].Group == lvContents.Groups["File"])
            {
                isFolder = false;
                Process.Start((string)lvContents.SelectedItems[0].Tag);
                return;
            }
            isFolder = true;

            lvSelectedItemTag = (string)lvContents.SelectedItems[0].Tag;
            txtAddress.Text = lvSelectedItemTag;


            //遍历treeview查找打开的节点
            foreach (TreeNode var in tvMenu.SelectedNode.Nodes)
            {
                if ((string)var.Tag == lvSelectedItemTag)
                {
                    tvMenu.SelectedNode = var;
                    var.Expand();
                    break;
                }
            }
            CreateListView();

            history.Add(txtAddress.Text);
            index++;
            btnBack.Enabled = true;
            btnUp.Enabled = true;
            //SearchNodes(tvMenu.Nodes[0]);
        }

        /// <summary>
        /// 递归搜索Nodes,让ListView中被双击的项与TreeView对应的Node展开
        /// </summary>
        /// <param name="node"></param>
        private void SearchNodes(TreeNode node)
        {
            for (int i = 0; i < node.Nodes.Count; i++)
            {
                if ((string)node.Nodes[i].Tag == lvSelectedItemTag)
                {
                    node.Nodes[i].Expand();
                    return;
                }
                SearchNodes(node.Nodes[i]);
            }
            
        }

        

        private void button1_Click(object sender, EventArgs e)
        {
            for (int i = 0; i < lvContents.SelectedItems.Count; i++)
            {
 MessageBox.Show(lvContents.SelectedItems[i].Text);
            }
           
        }

        private void btnUp_Click(object sender, EventArgs e)
        {
            string mess = "";
            if (ValidateAddress(ref mess))
            {
                
                if (txtAddress.Text.Length == 3||txtAddress.Text.Length==2)
                {
                    tvMenu.SelectedNode = tvMenu.Nodes[0];
                    txtAddress.Text = "我的电脑";
                    lvContents.Items.Clear();
                    string[] discs = Environment.GetLogicalDrives();
                    ListViewItem item;
                    DriveInfo di;

                    foreach (string var in discs)
                    {

                        #region 添加ListView盘符
                        item = new ListViewItem(var.Substring(0, 1) + "盘");
                        di = new DriveInfo(var.Substring(0, 1));
                        switch (di.DriveType)
                        {
                            case DriveType.CDRom: item.ImageKey = "CD.ico";
                                break;
                            case DriveType.Fixed: item.ImageKey = "Drivers.ico";
                                break;
                            case DriveType.Network:
                                break;
                            case DriveType.NoRootDirectory:
                                break;
                            case DriveType.Ram:
                                break;
                            case DriveType.Removable:
                                break;
                            case DriveType.Unknown:
                                break;
                            default:
                                break;
                        }

                        item.Tag = var;
                        item.Group = lvContents.Groups["Drives"];
                        lvContents.Items.Add(item);
                        #endregion
                    }
                    btnUp.Enabled = false;
                }
                else
                {
                    tvMenu.SelectedNode = tvMenu.SelectedNode.Parent;
                    txtAddress.Text = txtAddress.Text.Substring(0, txtAddress.Text.LastIndexOf('\\'));
                    CreateListView();

                }
            }
            else
            {
                MessageBox.Show(mess);
            }

            InsertToHistory();


        }

        private void InsertToHistory()
        {
            history.Insert(index + 1, txtAddress.Text);
            index = index + 1;
            int i = history.Count - index - 1;
            while (i > 0)
            {
                history.RemoveAt(index + 1);
                i--;
            }
        }

        /// <summary>
        /// 验证地址栏的输入是否存在
        /// </summary>
        /// <param name="mess">错误信息</param>
        /// <returns>是否通过验证</returns>
        private bool ValidateAddress(ref string mess)
        {
            if (txtAddress.Text == "我的电脑")
            {
                mess = "地址错误!";
                return false;
            }
            try
            {
                DirectoryInfo info = new DirectoryInfo(@txtAddress.Text);
                info.GetDirectories();
                isFolder = true;
                return true;
            }
            catch (Exception)
            {
                try
                {
                    FileInfo file = new FileInfo(@txtAddress.Text);
                    file.GetType() ;
                    isFolder = false;
                    return true;
                }
                catch (Exception)
                {
                    mess = "地址错误!";
                    return false;
                }
            }


        }


        
        private void CreateListView()
        {
            try
            {
                DirectoryInfo di;
                if (isFolder)
                {
                    di = new DirectoryInfo(@txtAddress.Text + @"\");
                }
                else
                {
                    FileInfo file = new FileInfo(@txtAddress.Text);
                    di = new DirectoryInfo(@file.DirectoryName);
                }
                
                DirectoryInfo[] info = di.GetDirectories();
                ListViewItem item;
                lvContents.Items.Clear();
                foreach (DirectoryInfo var in info)
                {
                    //如果文件属性为隐藏或系统文件或零时文件则不显示
                    if ((var.Attributes & (FileAttributes.Hidden | FileAttributes.System | FileAttributes.Temporary)) != 0)
                    {
                        continue;
                    }
                    item = new ListViewItem(var.Name);
                    item.Tag = var.FullName;
                    item.ImageKey = "Folder.ico";
                    item.Group = lvContents.Groups["Folder"];
                    lvContents.Items.Add(item);
                }

                FileInfo[] files = di.GetFiles();
                foreach (FileInfo file in files)
                {
                    //如果文件属性为隐藏或系统文件或零时文件则不显示
                    if ((file.Attributes & (FileAttributes.Hidden | FileAttributes.System | FileAttributes.Temporary)) != 0)
                    {
                        continue;
                    }
                    item = new ListViewItem(file.Name);
                    item.ImageKey = "Exe.ico";
                    item.Tag = file.FullName;
                    item.Group = lvContents.Groups["File"];
                    lvContents.Items.Add(item);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void CreateNodes(TreeNode node)
        {
            try
            {
                DirectoryInfo di = new DirectoryInfo((string)node.Tag);
                DirectoryInfo[] dis = di.GetDirectories();
                TreeNode tn;
                foreach (DirectoryInfo var in dis)
                {
                    //如果文件属性为隐藏或系统文件或零时文件则不显示
                    if ((var.Attributes & (FileAttributes.Hidden | FileAttributes.System | FileAttributes.Temporary)) != 0)
                    {
                        continue;
                    }
                    tn = new TreeNode(var.Name);
                    tn.Tag = var.FullName;
                    tn.Name = var.FullName;
                    node.Nodes.Add(tn);
                    //如果新添加的节点位于触发节点的二级及上就停止递归
                    if (tn.Level - eLevel > 1)
                    {
                        return;
                    }
                    //否则递归创建下级节点
                    CreateNodes(tn);
                }

            }
            catch (Exception)
            { }
        }

        private void btnGo_Click(object sender, EventArgs e)
        {
            string mess = "";
            if (ValidateAddress(ref mess))
            {
                CreateListView();
                btnUp.Enabled = true;
                btnBack.Enabled = true;
                history.Add(txtAddress.Text);
                index++;
                switch (isFolder)
                {
                    case false:
                        Process.Start(@txtAddress.Text);
                        break;
                }
                
            }
            else
            {
                MessageBox.Show(mess);
            }
        }

        
        private void btnBack_Click(object sender, EventArgs e)
        {
            if (index>0)
            {
               index--;
            txtAddress.Text= history[index];
            CreateListView();
            btnForward.Enabled = true;
            }

            if (index<=0)
            {
                btnBack.Enabled = false;
            }
            
        }

        private void btnForward_Click(object sender, EventArgs e)
        {

            if (index<history.Count-1)
            {
                index++;
            txtAddress.Text = history[index];
            CreateListView();
            btnBack.Enabled = true;
            }

            if (index>history.Count-2)
            {
               btnForward.Enabled = false;
            }
            
            
        }

        private void lvContents_Click(object sender, EventArgs e)
        {
            //判断文件类型
            ListViewItem item = lvContents.SelectedItems[0];
            if (item.Group == lvContents.Groups["File"])
            {
                GetFileInfo(item);
            }
            else if (item.Group == lvContents.Groups["Folder"])
            {
                GetFolderInfo(item);
            }
            else
            {
                GetDriverInfo( item);
            }


        }

        /// <summary>
        /// 获取文件信息
        /// </summary>
        /// <param name="item"></param>
        private void GetFileInfo(ListViewItem item)
        {
            FileInfo info = new FileInfo((string)item.Tag);
            string fullName = info.Name;
            string fileSize =CalcFileSize( info.Length);
           string createTime= info.CreationTime.ToString();
           string modifyTime = info.LastWriteTime.ToString();
           lblInfo.Text = string.Format("文件名:{0}\r\t文件大小:{1}\r\t创建时间:{2}\r\t修改时间:{3}",fullName,fileSize,createTime,modifyTime);
        }

        /// <summary>
        /// 获取文件夹信息
        /// </summary>
        /// <param name="item"></param>
        private void GetFolderInfo(ListViewItem item)
        {
            DirectoryInfo info = new DirectoryInfo((string)item.Tag);
            string fullName = info.Name;
            string createTime = info.CreationTime.ToString();
            string modifyTime = info.LastWriteTime.ToString();
            lblInfo.Text = string.Format("文件夹名:{0}\r\t创建时间:{1}\r\t修改时间:{2}", fullName, createTime, modifyTime);
            
        }

        /// <summary>
        /// 获取驱动器信息
        /// </summary>
        /// <param name="item"></param>
        private void GetDriverInfo(ListViewItem item)
        {
            DriveInfo info = new DriveInfo((string)item.Tag);
            switch (info.DriveType)
            {
                case DriveType.CDRom:
                    string isReady=info.IsReady ? "准备就绪" : "未就绪";
                   string name= item.Text;
                   lblInfo.Text = string.Format("驱动器名:{0}\r\t是否就绪:{1}", name, isReady);
                    break;
                case DriveType.Fixed:
                     name = item.Text;
                     string freeSpace = CalcFileSize(info.AvailableFreeSpace); 
                   string totalSpace = CalcFileSize(info.TotalSize);
                   lblInfo.Text = string.Format("驱动器名:{0}\r\t可用空间:{1}\r\t总空间:{2}", name, freeSpace, totalSpace);
                    break;
                case DriveType.Network:
                    break;
                case DriveType.NoRootDirectory:
                    break;
                case DriveType.Ram:
                    break;
                case DriveType.Removable:
                    break;
                case DriveType.Unknown:
                    break;
                default:
                    break;
            }
        }


        private string CalcFileSize(long size)
        {
            int times = 0;
            decimal convertedSize = 0.00m;
                convertedSize=size;
            while (convertedSize >= 1024)
            {
                convertedSize = convertedSize / 1024;
                times++;
            }
            switch (times)
            {
                case 0: return convertedSize.ToString("0.00") + "字节";
                case 1: return convertedSize.ToString("0.00") + "KB";
                case 2: return convertedSize.ToString("0.00") + "MB";
                case 3: return convertedSize.ToString("0.00") + "G";
                default: return convertedSize.ToString("0.00") + "T";
            }
              
        }

        private void tsmiListStyle_Click(object sender, EventArgs e)
        {
            switch (((string)((ToolStripItem)sender).Tag))
            {
                case "0": lvContents.View= View.LargeIcon; break;
                case "1": lvContents.View = View.SmallIcon; break;
                default: lvContents.View = View.List;
                    break;
            }
        }
    }
}