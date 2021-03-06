using System;
using System.Collections;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Windows.Forms;

namespace MaskedTextBox
{
	/// <summary>
	/// Summary description for UserControl1.
	/// </summary>
	public class MaskedTextBox : System.Windows.Forms.TextBox
	{
        private int digitPos=0;

        private int DelimitNumber=0;

		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.Container components = null;

		public MaskedTextBox()
		{
			// This call is required by the Windows.Forms Form Designer.
			InitializeComponent();

			// TODO: Add any initialization after the InitForm call

		}

		/// <summary>
		/// Clean up any resources being used.
		/// </summary>
		protected override void Dispose( bool disposing )
		{
			if( disposing )
			{
				if( components != null )
					components.Dispose();
			}
			base.Dispose( disposing );
		}

		#region Component Designer generated code
		/// <summary>
		/// Required method for Designer support - do not modify 
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
            // 
            // MaskedTextBox
            // 
            this.Name = "MaskedTextBox";
            this.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.MaskedTextBox_KeyPress);

        }
		#endregion

        private void MaskedTextBox_KeyPress(object sender, System.Windows.Forms.KeyPressEventArgs e)
        {
            MaskedTextBox sd = (MaskedTextBox) sender;
 //           if (sd.m_IPAddrOnly)
                sd.MaskIpAddr(e);
/*            if (sd.m_digitOnly)
                sd.MaskDigit(e);
            if(sd.m_ssn)
                sd.MaskPhoneSSN(e, 3, 2);
            if(sd.m_phoneOnly)
                sd.MaskPhoneSSN(e, 3, 3);
            if(sd.m_dateOnly)
                sd.MaskDate(e);
            if(sd.m_decimalOnly)
                sd.MaskDecimal(e);
  */      }

        private void MaskIpAddr(KeyPressEventArgs e)
        {
            int len = this.Text.Length;
            int indx = this.Text.LastIndexOf(".");
            // if test is highlighted reset vars
            if(this.SelectedText == this.Text) 
            {
                indx=-1;
                digitPos=0;
                DelimitNumber=0;
            }
            if(Char.IsDigit(e.KeyChar) || e.KeyChar == '.' || e.KeyChar == 8)
            { // only digit, Backspace and dot are accepted
                string tmp = this.Text;
                if (e.KeyChar != 8)
                {
                    if (e.KeyChar != '.' )
                    {
                        if(indx > 0)
                            digitPos = len-indx;
                        else
                            digitPos++;	
                    }
                    if(digitPos == 3 && e.KeyChar != '.')
                    {
                        string tmp2 = this.Text.Substring(indx+1)+e.KeyChar;
                        if(Int32.Parse(tmp2)> 255) // check validation
                            MessageBox.Show("The number can't be bigger than 255 -> " + tmp2);
                        else
                        {
                            if (DelimitNumber<3)
                            {
                                this.AppendText(e.KeyChar.ToString());
                                this.AppendText(".");
                                DelimitNumber++;
                                e.Handled = true;
                            }
                        }
                    }
                    else if (digitPos == 4 && DelimitNumber<3)
                        this.AppendText(".");
                }
                else
                {
                    e.Handled = false;
                    if((len-indx) == 1)
                    {
                        DelimitNumber--;
                        if (indx > -1 )
                        {
                            digitPos = len-indx;
                        }
                        else
                            digitPos--;
                    }
                    else 
                    {
                        if(indx > -1)
                            digitPos=len-indx-1;
                        else
                            digitPos=len-1;
                    }
                }
            }
            else
                e.Handled = true;
        }
	}
}
