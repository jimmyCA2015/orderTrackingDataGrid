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

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    public string GetConnectionString()
    {
      
        return System.Configuration.ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
    }

    protected void Login_Click(object sender, EventArgs e)
    {
        OleDbConnection conn = new OleDbConnection(GetConnectionString());
        conn.Open();
        string sql = "SELECT  UserID,UserPwd,UserNo FROM  [Rogue].[dbo].[EDIUsers] ;";
        OleDbCommand cmd = new OleDbCommand(sql, conn);
        bool validated = false;
        using (OleDbDataReader oReader = cmd.ExecuteReader())
        {
            while (oReader.Read())
            {
                if (username.Text == oReader["UserID"].ToString() && password.Text == oReader["UserPwd"].ToString())
                {
                    currentUser.getValidation = 1;
                    validated = true;
                    currentUser.getUserAccountMaping = oReader["UserNo"].ToString();
                    if (username.Text != "Johnson&Johnson")
                    {
                        currentUser.getUser = username.Text;
                    }
                    else
                    {
                        currentUser.getUser = "Johnson";
                    }

                }
            }

        }
        conn.Close();

        if (validated)
        {

            



                Response.Redirect("~/Home.aspx");
            
           


        }



        if (!validated)
        {



            lblLoginError.Text = "Invalid Login";

            lblLoginError.Attributes["style"] = "color:red; font-weight:bold;";



        }


    }
    protected void btQuickSearch_Click(object sender, EventArgs e)
    {

    }
}