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


public partial class accessorialdetail : System.Web.UI.Page
{
    public static DataView CurrentView;
    public static DataSet CurrentSet;
    public static String[] AccessorialList = new String[100];
    
    

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            if (currentUser.getValidation == 0)
            {
                Response.Redirect("~/Login.aspx");
            }
            OleDbConnection conn = new OleDbConnection(GetConnectionString());



            OleDbCommand populate1 = new OleDbCommand("SELECT distinct description FROM [CourierComplete].[dbo].[viewAccountUserCharges] where accountnumber in (select distinct subaccountid from [Rogue].[dbo].[EDIUserAccess]  where userno=?)  ", conn);

            populate1.Parameters.Add("@p1", OleDbType.VarChar).Value = currentUser.getUserAccountMaping;

            OleDbDataReader ddlValues;
            populate1.Connection.Open();
            ddlValues = populate1.ExecuteReader();

            int count = 0;
            while (ddlValues.Read())
            {
                AccessorialList[count] = ddlValues["description"].ToString();

                count = count + 1;
            }
            populate1.Connection.Close();
            populate1.Connection.Dispose();
            
        }
        int counter = 0;
        BoundColumn Boundfieldtotal = new BoundColumn();
        Boundfieldtotal.DataField = "total accessorials fee";
        Boundfieldtotal.HeaderText = "Total Accessorials Fee";
        while (AccessorialList[counter] != null)
        {


            BoundColumn Boundfield1 = new BoundColumn();
            Boundfield1.DataField = "" + AccessorialList[counter] + "";
            Boundfield1.HeaderText = "" + AccessorialList[counter] + "";

            MyDataGrid.Columns.Add(Boundfield1);

            counter = counter + 1;


        }
        MyDataGrid.Columns.Add(Boundfieldtotal);

        MyDataGrid.ItemCommand +=
             new DataGridCommandEventHandler(this.ItemsGrid_Command);

       
        
       


        
    }
    protected void UpdateFilter(object sender, EventArgs e)
    {
        //CurrentView.RowFilter = "Convert(orderno, 'System.String')= '" + orderNo.Text.ToString() + "'";
        if(TextBox3.Text.ToString() !=String.Empty)
        {
        CurrentView.RowFilter = "Reference='"+TextBox3.Text+"'";
       
        }
        if (TextBox4.Text.ToString() != String.Empty)
        {
            CurrentView.RowFilter = "Convert(OrderNo,System.String)='" + TextBox4.Text + "'";
            //CurrentSet.Tables[0].Select("Convert(OrderNo,System.String)='" + TextBox4.Text + "'");
            

        }
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
    protected void Grid_PageIndexChanged(object source, DataGridPageChangedEventArgs e)

    {

        MyDataGrid.CurrentPageIndex= e.NewPageIndex;
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
        reference.Visible = true;
        TextBox3.Visible = true;
        orderNo.Visible = true;
        TextBox4.Visible = true;
        filter.Visible = true;
        OleDbConnection conn22 = new OleDbConnection(GetConnectionString());


        string sql = " SELECT  a.orderno,MIN(c.reference)AS 'Reference', MIN(CONVERT(datetime,c.pickeduptime,120))As 'Pickup Time', MIN(CONVERT(datetime,c.deliveredtime,120))As 'Deliver Time'";
        int counter=0;
        while(AccessorialList[counter] !=null)
        {
           

            
            sql += ",MAX(case when b.description= '" + AccessorialList[counter] + "' then a.chargeamount else 0 END) as '" + AccessorialList[counter] + "'";
            counter++;
        }
        sql += ",";
        counter = 0;
        while (AccessorialList[counter] != null)
        {



            sql += "MAX(case when b.description= '" + AccessorialList[counter] + "' then a.chargeamount else 0 END) +";
            counter++;
        }
        sql += " 0 as 'total accessorials fee'";


        sql += "FROM [CourierComplete].[dbo].[viewOrderSurcharges] a  inner join [CourierComplete].[dbo].[UserDefinedSurchargeTypes] b on  b.userdefinedchargeid=a.userchargeid inner join [CourierComplete].[dbo].[viewsearchorders] c on a.orderNo=c.orderno where c.accountnumber in  (select distinct subaccountid from [Rogue].[dbo].[EDIUserAccess]  where userno=?) AND DATEADD(dd, DATEDIFF(dd, 0, c.pickeduptime),0)>=? AND DATEADD(dd, DATEDIFF(dd, 0, c.deliveredtime),0)<=? group by a.orderno";
        
        OleDbDataAdapter myCommand = new OleDbDataAdapter(sql, conn22);
        myCommand.SelectCommand.CommandTimeout = 3000;
        myCommand.SelectCommand.Parameters.Add("@p1", OleDbType.VarChar).Value = currentUser.getUserAccountMaping;
        myCommand.SelectCommand.Parameters.Add("@p2", OleDbType.DBDate).Value = TextBoxG1.Text;
        myCommand.SelectCommand.Parameters.Add("@p3", OleDbType.DBDate).Value = TextBoxG2.Text;

       
       

        DataSet ds = new DataSet();
        myCommand.Fill(ds);


        conn22.Open();
        myCommand.SelectCommand.CommandType = CommandType.Text;
        myCommand.SelectCommand.ExecuteNonQuery();


        DataView source = new DataView(ds.Tables[0]);
        CurrentView = source;
        CurrentSet = ds;

        MyDataGrid.CurrentPageIndex= 0;

        MyDataGrid.DataSource = source;
        MyDataGrid.Columns[0].FooterText = "Display Page 1 ";
        if (CurrentView.Count > 20)
        {

            MyDataGrid.Columns[1].FooterText = "Display Record 1 " + " to " + "20 " + " of" + " " + CurrentView.Count;
        }
        else
        {

            MyDataGrid.Columns[1].FooterText = "Display Record 1 " + " to " + CurrentView.Count + " of" + " " + CurrentView.Count;
        }

        MyDataGrid.DataBind();



        conn22.Close();


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

        e.Item.Attributes.Add("Onmouseover", "this.originalstyle=this.style.backgroundColor;this.style.backgroundColor='#EEFFAA'");
        e.Item.Attributes.Add("onmouseout", "this.style.backgroundColor=this.originalstyle;");



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
        try
        {
            string reference = e.Item.Cells[1].Text;
            string accountName = e.Item.Cells[2].Text;
            string orderNo = e.Item.Cells[3].Text;
            string invoiceNumber = e.Item.Cells[4].Text;
            string serviceType = e.Item.Cells[5].Text;
            string status = e.Item.Cells[6].Text;
            string pickupTime = e.Item.Cells[7].Text;
            string pickupCompany = e.Item.Cells[8].Text;
            string pickupStreet = e.Item.Cells[9].Text;
            string pickupCity = e.Item.Cells[10].Text;
            string pickupProvince = e.Item.Cells[11].Text;
            string pickupPostalCode = e.Item.Cells[12].Text;
            string deliverTime = e.Item.Cells[13].Text;
            string deliveryCompany = e.Item.Cells[14].Text;
            string deliveryStreet = e.Item.Cells[15].Text;
            string deliveryCity = e.Item.Cells[16].Text;
            string deliveryProvince = e.Item.Cells[17].Text;
            string deliveryPostalCode = e.Item.Cells[18].Text;
            string billedWeight = e.Item.Cells[19].Text;
            string freightCharge = e.Item.Cells[20].Text;
            string fuel = e.Item.Cells[21].Text;
            string accessorialsFee = e.Item.Cells[22].Text;
            string waitingTime = e.Item.Cells[23].Text;
            string afterHours = e.Item.Cells[24].Text;
            string insurance = e.Item.Cells[25].Text;
            string freightSubtotal = e.Item.Cells[26].Text;
            string taxName = e.Item.Cells[27].Text;
            string taxSubtotal = e.Item.Cells[28].Text;
            string clientCharge = e.Item.Cells[29].Text;
            ScriptManager.RegisterStartupScript(Page, typeof(Page), "OpenWindow", "window.open('orderdetail.aspx?reference=" + reference + "&accountName=" + accountName + "&orderNo=" + orderNo + "&invoiceNumber=" + invoiceNumber + "&serviceType=" + serviceType + "&status=" + status +
                "&pickupTime=" + pickupTime + "&pickupCompany=" + pickupCompany + "&pickupStreet=" + pickupStreet + "&pickupcity=" + pickupCity + "&pickupProvince=" + pickupProvince + "&pickuppostalcode=" + pickupPostalCode +
               "&deliverTime= " + deliverTime + "&deliveryCompany= " + deliveryCompany + " &deliveryStreet= " + deliveryStreet + " &deliveryCity= " + deliveryCity + "&deliveryProvince= " + deliveryProvince + "&deliverypostalcode= " + deliveryPostalCode + "&billedweight=" + billedWeight +
               "&freightcharge= " + freightCharge + "&fuel= " + fuel + "&accessorialsFee= " + accessorialsFee + "&waitingTime= " + waitingTime + "&afterHours= " + afterHours + "&insurance= " + insurance + "&freightSubtotal= " + freightSubtotal +
               "&taxName= " + taxName + "&taxSubtotal= " + taxSubtotal + " &clientCharge= " + clientCharge + "','edit','resizable=yes,scrollbars=yes,status,left=500,top=50,width=1000,height=800');", true);
        }
        catch
        {

        }
    }
}