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

public partial class Contactus : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(currentUser.getValidation==0)
        {
            Response.Redirect("~/Login.aspx");
        }
    }
   
    protected void smessage_Click(object sender, EventArgs e)
    {
        OleDbConnection conn = new OleDbConnection(GetConnectionString());
        conn.Open();
        string sql = "insert into [Rogue].[dbo].[EDITicket](logDate,companyName,companyEmail,logSubject,logMessage) values (?, ?,?,?,?)";


        OleDbDataAdapter myCommand = new OleDbDataAdapter(sql, conn);

        myCommand.SelectCommand.Parameters.Add("@p1", OleDbType.DBDate).Value = DateTime.Today;
        myCommand.SelectCommand.Parameters.Add("@p2", OleDbType.VarChar).Value = cname.Text;
        myCommand.SelectCommand.Parameters.Add("@p3", OleDbType.VarChar).Value = cemail.Text;
        myCommand.SelectCommand.Parameters.Add("@p4", OleDbType.VarChar).Value = csubject.Text;
        myCommand.SelectCommand.Parameters.Add("@p5", OleDbType.VarChar).Value = cmessage.Text;
     
        myCommand.SelectCommand.CommandType = CommandType.Text;
        myCommand.SelectCommand.ExecuteNonQuery();
        conn.Close();
        sstat.Text = "Send Successfully";

    }
    public string GetConnectionString()
    {
        //sets the connection string from your web config file "ConnString" is the name of your Connection String
        return System.Configuration.ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
    }
 

}