using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class orderdetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            HttpRequest q = Request;
            Textbox1.Text = q.QueryString["reference"];
            Textbox2.Text = q.QueryString["orderNo"];
            Textbox3.Text = q.QueryString["invoiceNumber"];
            Textbox4.Text = q.QueryString["serviceType"];
            Textbox5.Text = q.QueryString["status"];
            Textbox6.Text = q.QueryString["pickupTime"];
            Textbox7.Text = q.QueryString["pickupCompany"];
            Textbox8.Text = q.QueryString["pickupStreet"];
            Textbox9.Text = q.QueryString["pickupCity"];
            Textbox10.Text = q.QueryString["pickupProvince"];
            Textbox11.Text = q.QueryString["pickupPostalCode"];
            Textbox12.Text = q.QueryString["deliverTime"];
            Textbox13.Text = q.QueryString["deliveryCompany"];
            Textbox14.Text = q.QueryString["deliveryStreet"];
            Textbox15.Text = q.QueryString["deliveryCity"];
            Textbox16.Text = q.QueryString["deliveryProvince"];
            Textbox17.Text = q.QueryString["deliveryPostalCode"];
            Textbox18.Text = q.QueryString["billedWeight"];
            Textbox19.Text = q.QueryString["freightCharge"];
            Textbox20.Text = q.QueryString["fuel"];
            Textbox21.Text = q.QueryString["accessorialsFee"];
            Textbox22.Text = q.QueryString["waitingTime"];
            Textbox23.Text = q.QueryString["afterHours"];
            
            Textbox24.Text = q.QueryString["freightSubtotal"];
            Textbox25.Text = q.QueryString["taxName"];
            Textbox26.Text = q.QueryString["taxSubtotal"];
            Textbox27.Text = q.QueryString["clientCharge"];
            Textbox28.Text = q.QueryString["insurance"];
            Textbox29.Text = q.QueryString["accountName"];

        }
    }
}