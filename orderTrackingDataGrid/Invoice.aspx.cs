using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.OleDb;
using System.Data;
using System.Data.SqlClient;
using System.IO;  

public partial class Invoice : System.Web.UI.Page
{
    public static DataView CurrentView;
    public static DataSet CurrentSet;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            OleDbConnection conn = new OleDbConnection(GetConnectionString());
          
           
            OleDbCommand populate1 = new OleDbCommand("SELECT  transactionNumber AS 'InvoiceNumberList',DATEADD(dd, DATEDIFF(dd, 0, transactiondate),0) as 'invoicedate' FROM [CourierComplete].[dbo].[AROpenTransactions] where accountnumber in (select distinct subaccountid from [Rogue].[dbo].[EDIUserAccess]  where userno=?)    order by transactionnumber desc", conn);

            populate1.Parameters.Add("@p1", OleDbType.VarChar).Value = currentUser.getUserAccountMaping;

            OleDbDataReader ddlValues;
            populate1.Connection.Open();
            ddlValues = populate1.ExecuteReader();
            int count = 0;
             while (ddlValues.Read())
             {
                 
                 txtDropDown1.Items.Insert(count, ddlValues["InvoiceNumberList"].ToString() + " (" +  Convert.ToDateTime(ddlValues["invoicedate"]).ToString("MM/dd/yyyy")+")");
                 count = count + 1;
            }
            populate1.Connection.Close();
            populate1.Connection.Dispose();
        }
        
        if (currentUser.getValidation == 0)
           {
            Response.Redirect("~/Login.aspx");
           }

    }
    protected void Grid_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        

        MyDataGrid.CurrentPageIndex = e.NewPageIndex;
        MyDataGrid.Columns[0].FooterText = "Display Page " + (e.NewPageIndex + 1) + " of" + " " + MyDataGrid.PageCount;
        
        if (((e.NewPageIndex) * 20 + 20) > CurrentView.Count)
        {
            MyDataGrid.Columns[1].FooterText = "Display Record " + ((e.NewPageIndex) * 20 + 1) + " to " + CurrentView.Count + " of" + " " + CurrentView.Count;

        }
        else
        {
            MyDataGrid.Columns[1].FooterText = "Display Record " + ((e.NewPageIndex) * 20 + 1) + " to " + ((e.NewPageIndex) * 20 + 20) + " of" + " " + CurrentView.Count;
        }
        bindData();
    }
    public string GetConnectionString()
    {
        //sets the connection string from your web config file "ConnString" is the name of your Connection String
        return System.Configuration.ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
    }


    protected void magic_Click(object sender, EventArgs e)

    {

        Button1.Visible = true;
        OleDbConnection conn = new OleDbConnection(GetConnectionString());

        string sql = "exec [Rogue].[dbo].[getdataforgeneralinvoiceweb] @InvoiceNO=?,@UserNo=?";

        OleDbDataAdapter myCommand = new OleDbDataAdapter(sql, conn);
        myCommand.SelectCommand.CommandTimeout = 3000;
        if (txtDropDown1.SelectedValue != String.Empty)
        {
            myCommand.SelectCommand.Parameters.Add("@p1", OleDbType.VarChar).Value =txtDropDown1.SelectedValue.Substring(0,txtDropDown1.SelectedValue.IndexOf('(')-1);
        }
        if (txtDropDown1.SelectedValue == String.Empty)
        {
            myCommand.SelectCommand.Parameters.Add("@p1", OleDbType.VarChar).Value = DBNull.Value;
        }
        myCommand.SelectCommand.Parameters.Add("@p2", OleDbType.VarChar).Value = currentUser.getUserAccountMaping;




        DataSet ds = new DataSet();
        myCommand.Fill(ds);


        conn.Open();
        myCommand.SelectCommand.CommandType = CommandType.Text;
        myCommand.SelectCommand.ExecuteNonQuery();


        DataView source = new DataView(ds.Tables[0]);
        CurrentView = source;
        CurrentSet = ds;

        MyDataGrid.CurrentPageIndex = 0;

        MyDataGrid.DataSource = source;
        MyDataGrid.Columns[0].FooterText = "Display Page 1 of " + Math.Ceiling((double)(CurrentView.Count)/20);
      
        if (CurrentView.Count > 20)
        {
            MyDataGrid.Columns[1].FooterText = "Display Record 1 " + " to " + "20 " + " of" + " " + CurrentView.Count;
        }
        else
        {
            MyDataGrid.Columns[1].FooterText = "Display Record 1 " + " to " + CurrentView.Count + " of" + " " + CurrentView.Count;
        }

        MyDataGrid.DataBind();
        conn.Close();
    }

    protected void bindData()
    {


        try
        {

            MyDataGrid.DataSource = CurrentView;
            MyDataGrid.DataBind();

        }
        catch
        {
            if (MyDataGrid.CurrentPageIndex >= MyDataGrid.PageCount)
            {
                MyDataGrid.CurrentPageIndex = MyDataGrid.PageCount - 1;
                MyDataGrid.DataSource = CurrentView;
                MyDataGrid.DataBind();

            }
        }


  }
    protected void Item_Bound(Object sender, DataGridItemEventArgs e)
    {

        try
        {
            string reference = ((LinkButton)e.Item.Cells[0].Controls[1]).Text.ToString();
            string accountName = e.Item.Cells[1].Text;
            string orderNo = e.Item.Cells[2].Text;
            string invoiceNumber = e.Item.Cells[3].Text;
            string serviceType = e.Item.Cells[4].Text;
            string status = e.Item.Cells[5].Text;
            string pickupTime = e.Item.Cells[6].Text;
            string pickupCompany = e.Item.Cells[7].Text;
            string pickupStreet = e.Item.Cells[8].Text;
            string pickupCity = e.Item.Cells[9].Text;
            string pickupProvince = e.Item.Cells[10].Text;
            string pickupPostalCode = e.Item.Cells[11].Text;
            string deliverTime = e.Item.Cells[12].Text;
            string deliveryCompany = e.Item.Cells[13].Text;
            string deliveryStreet = e.Item.Cells[14].Text;
            string deliveryCity = e.Item.Cells[15].Text;
            string deliveryProvince = e.Item.Cells[16].Text;
            string deliveryPostalCode = e.Item.Cells[17].Text;
            string billedWeight = e.Item.Cells[18].Text;
            string freightCharge = e.Item.Cells[19].Text;
            string fuel = e.Item.Cells[20].Text;
            string accessorialsFee = e.Item.Cells[21].Text;
            string waitingTime = e.Item.Cells[22].Text;
            string afterHours = e.Item.Cells[23].Text;
            string insurance = e.Item.Cells[24].Text;
            string freightSubtotal = e.Item.Cells[25].Text;
            String taxName = e.Item.Cells[26].Text;

            string taxSubtotal = e.Item.Cells[27].Text;
            string clientCharge = e.Item.Cells[28].Text;
            e.Item.Attributes.Add("Onmouseover", "this.originalstyle=this.style.backgroundColor;this.style.backgroundColor='#EEFFAA'");
            e.Item.Attributes.Add("onmouseout", "this.style.backgroundColor=this.originalstyle;");
            e.Item.Attributes.Add("onclick", "showMyDialog('?reference=" + reference + "&accountName=" + accountName + "&orderNo=" + orderNo + "&invoiceNumber=" + invoiceNumber + "&serviceType=" + serviceType + "&status=" + status +
                    "&pickupTime=" + pickupTime + "&pickupCompany=" + pickupCompany + "&pickupStreet=" + pickupStreet + "&pickupcity=" + pickupCity + "&pickupProvince=" + pickupProvince + "&pickuppostalcode=" + pickupPostalCode +
                   "&deliverTime= " + deliverTime + "&deliveryCompany= " + deliveryCompany + " &deliveryStreet= " + deliveryStreet + " &deliveryCity= " + deliveryCity + "&deliveryProvince= " + deliveryProvince + "&deliverypostalcode= " + deliveryPostalCode + "&billedweight=" + billedWeight +
                   "&freightcharge= " + freightCharge + "&fuel= " + fuel + "&accessorialsFee= " + accessorialsFee + "&waitingTime= " + waitingTime +
                   "&afterHours= " + afterHours + "&insurance= " + insurance + "&freightSubtotal= " + freightSubtotal +
                   "&taxName= " + taxName + "&taxSubtotal= " + taxSubtotal + " &clientCharge= " + clientCharge + "');");
             
        }
        catch
        {

        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        ExportGridToExcel();
    }

    private void ExportGridToExcel()
    {

        MyDataGrid.AllowPaging = false;
        bindData();
        Response.Clear();
        Response.Buffer = true;
        Response.ContentType = "application/vnd.ms-excel";
        Response.Charset = "";
        this.EnableViewState = false;
        System.IO.StringWriter oStringWriter = new System.IO.StringWriter();
        System.Web.UI.HtmlTextWriter oHtmlTextWriter = new System.Web.UI.HtmlTextWriter(oStringWriter);
        this.ClearControls(MyDataGrid);
        MyDataGrid.RenderControl(oHtmlTextWriter);
        Response.Write(oStringWriter.ToString());
        Response.End();


    }
    private void ClearControls(Control control)
    {
        for (int i = control.Controls.Count - 1; i >= 0; i--)
        {
            ClearControls(control.Controls[i]);
        }
        if (!(control is TableCell))
        {
            if (control.GetType().GetProperty("SelectedItem") != null)
            {
                LiteralControl literal = new LiteralControl();
                control.Parent.Controls.Add(literal);
                try
                {
                    literal.Text = (string)control.GetType().GetProperty("SelectedItem").GetValue(control, null);
                }
                catch
                {
                }
                control.Parent.Controls.Remove(control);
            }
            else
                if (control.GetType().GetProperty("Text") != null)
                {
                    LiteralControl literal = new LiteralControl();
                    control.Parent.Controls.Add(literal);
                    literal.Text = (string)control.GetType().GetProperty("Text").GetValue(control, null);
                    control.Parent.Controls.Remove(control);
                }
        }
        return;
    }




    protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
    {
        currentUser.getValidation = 0;
    }
    protected void logout_Click(object sender, EventArgs e)
    {
        currentUser.getValidation = 0;
        Response.Redirect("~/login.aspx");
    }
    protected void ItemsGrid_Command(object sender, DataGridCommandEventArgs e)
    {
        
        if (e.CommandName == "Select")
        {
            try
            {
                string reference = ((LinkButton)e.Item.Cells[0].Controls[1]).Text.ToString();
                string accountName = e.Item.Cells[1].Text;
                string orderNo = e.Item.Cells[2].Text;
                string invoiceNumber = e.Item.Cells[3].Text;
                string serviceType = e.Item.Cells[4].Text;
                string status = e.Item.Cells[5].Text;
                string pickupTime = e.Item.Cells[6].Text;
                string pickupCompany = e.Item.Cells[7].Text;
                string pickupStreet = e.Item.Cells[8].Text;
                string pickupCity = e.Item.Cells[9].Text;
                string pickupProvince = e.Item.Cells[10].Text;
                string pickupPostalCode = e.Item.Cells[11].Text;
                string deliverTime = e.Item.Cells[12].Text;
                string deliveryCompany = e.Item.Cells[13].Text;
                string deliveryStreet = e.Item.Cells[14].Text;
                string deliveryCity = e.Item.Cells[15].Text;
                string deliveryProvince = e.Item.Cells[16].Text;
                string deliveryPostalCode = e.Item.Cells[17].Text;
                string billedWeight = e.Item.Cells[18].Text;
                string freightCharge = e.Item.Cells[19].Text;
                string fuel = e.Item.Cells[20].Text;
                string accessorialsFee = e.Item.Cells[21].Text;
                string waitingTime = e.Item.Cells[22].Text;
                string afterHours = e.Item.Cells[23].Text;
                string insurance = e.Item.Cells[24].Text;
                string freightSubtotal = e.Item.Cells[25].Text;
                String taxName = e.Item.Cells[26].Text;

                string taxSubtotal = e.Item.Cells[27].Text;
                string clientCharge = e.Item.Cells[28].Text;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "showMyDialog('?reference=" + reference + "&accountName=" + accountName + "&orderNo=" + orderNo + "&invoiceNumber=" + invoiceNumber + "&serviceType=" + serviceType + "&status=" + status +
                    "&pickupTime=" + pickupTime + "&pickupCompany=" + pickupCompany + "&pickupStreet=" + pickupStreet + "&pickupcity=" + pickupCity + "&pickupProvince=" + pickupProvince + "&pickuppostalcode=" + pickupPostalCode +
                   "&deliverTime= " + deliverTime + "&deliveryCompany= " + deliveryCompany + " &deliveryStreet= " + deliveryStreet + " &deliveryCity= " + deliveryCity + "&deliveryProvince= " + deliveryProvince + "&deliverypostalcode= " + deliveryPostalCode + "&billedweight=" + billedWeight +
                   "&freightcharge= " + freightCharge + "&fuel= " + fuel + "&accessorialsFee= " + accessorialsFee + "&waitingTime= " + waitingTime +
                   "&afterHours= " + afterHours + "&insurance= " + insurance + "&freightSubtotal= " + freightSubtotal +
                   "&taxName= " + taxName + "&taxSubtotal= " + taxSubtotal + " &clientCharge= " + clientCharge + "');", true);
            }
            catch
            {

            }
        }
        if (e.CommandName == "filter1")
        {
            string filtervalue = ((TextBox)e.Item.Cells[0].Controls[0].FindControl("filterInvoice1")).Text.ToString();
            //CurrentView.RowFilter = "Convert(orderno, 'System.String')= '" + orderNo.Text.ToString() + "'";
            if (filtervalue.ToString() != String.Empty)
            {
                CurrentView.RowFilter = "Reference='" + filtervalue + "'";
                if (CurrentView.Count > 20)
                {

                    MyDataGrid.Columns[1].FooterText = "Display Record 1 " + " to " + "20 " + " of" + " " + CurrentView.Count;
                }
                else
                {

                    MyDataGrid.Columns[1].FooterText = "Display Record 1 " + " to " + CurrentView.Count + " of" + " " + CurrentView.Count;
                }
                MyDataGrid.Columns[0].FooterText = "Display Page 1 of " + Math.Ceiling((double)(CurrentView.Count) / 20);
               
                bindData();
                
        

            }
            else
            {
                CurrentView.RowFilter = "";
                MyDataGrid.Columns[0].FooterText = "Display Page 1 of " + Math.Ceiling((double)(CurrentView.Count) / 20);

                if (CurrentView.Count > 20)
                {
                    MyDataGrid.Columns[1].FooterText = "Display Record 1 " + " to " + "20 " + " of" + " " + CurrentView.Count;
                }
                else
                {
                    MyDataGrid.Columns[1].FooterText = "Display Record 1 " + " to " + CurrentView.Count + " of" + " " + CurrentView.Count;
                }

                bindData();


            }

            
            
            
        }
    }
 
    
}