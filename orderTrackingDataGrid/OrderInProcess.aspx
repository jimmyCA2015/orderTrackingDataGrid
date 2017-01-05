<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrderInProcess.aspx.cs" Inherits="OrderInProcess" %>

<!DOCTYPE html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="Scripts/jquery.js" type="text/javascript"></script>
<script src="Scripts/colResizable-1.3.min.js" type="text/javascript"></script>
<script src="Scripts/jquery.cookie.js" type="text/javascript"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css"/>
      <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
      <script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">

   <meta charset='utf-8'/>
   <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
   <meta name="viewport" content="width=device-width, initial-scale=1"/>
   <link rel="stylesheet" href="menustyle.css"/>
    <title></title>
    <script type="text/javascript">
        function PopupPicker(ctl, w, h) {
            var PopupWindow = null;
            settings = 'width=' + w + ',height=' + h + ',left=800px,top=300px,location=no,directories=no, menubar=no,toolbar=no,status=no,scrollbars=no,resizable=no, dependent=no';
            PopupWindow = window.open('DatePicker.aspx?Ctl=' +
               ctl, 'DatePicker', settings);
            PopupWindow.focus();
        }
        function showMyDialog(x) {
            //var open=window.open('orderdetail.aspx'+x+'','edit','resizable=yes,scrollbars=yes,status,left=500,top=50,width=1000,height=800');
            var popup = $('<div><iframe width="1000" height="900" src="' + "orderdetail.aspx" + x + '" frameborder="0"   align="center"></iframe></div>');
            popup.dialog({ modal: true, title: "Order Detail", height: 900, width: 1000, draggable: true, resizable: true, position: { my: "center", at: "center", of: window } });
            return false;

        };
     </script>
    <style>
       .ui-widget-overlay
       {
         opacity: .80 !important; /* Make sure to change both of these, as IE only sees the second one */
        filter: Alpha(Opacity=80) !important;

        background:rgb(50, 50, 50) !important; /* This will make it darker */
       }
         .ui-widget-header,.ui-state-default, .ui-button {
            background:#b9cd6d;
            border: 1px solid #b9cd6d;
            color: #FFFFFF;
            font-weight: bold;
         }
         .ui-widget-content {
             border: 1px solid #dddddd;
            background: #f6f6f6; 
            
            font-weight: bold; 
            color: #0073ea; 


         }
         .ddl
        {
            border:2px solid #7d6754;
            border-radius:5px;
            padding:3px;
            -webkit-appearance: none; 
            background-image:url('Images/Arrowhead-Down-01.png');
            background-position:88px;
            background-repeat:no-repeat;
            text-indent: 0.01px;/*In Firefox*/
            
        }
       </style>

 </head>
    <body>
        <form id="masterform" runat="server" >
             <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

          <div>
        <fieldset id="Fieldset1"  runat="server"> 
    
         <asp:image ID="Image1" ImageUrl="logo.jpg"  runat="server" width="80%" Height="200px"  /><br />
         </fieldset>
      
    <div id='cssmenu'>
     <ul>
      <li><a href='Home.aspx'><span>Home</span></a></li>
      <li><a href='Orders.aspx'><span>Delivered Orders</span></a></li>
      <li><a href='OrderInProcess.aspx'><span>Orders In Progress or Cancelled</span></a></li>
       <li><a href='accessorialdetail.aspx'><span>Accessorials Detail</span></a></li>
      <li><a href='Invoice.aspx'><span>Invoice</span></a></li>
      
      <li ><a href='ContactUs.aspx'><span>Contact</span></a></li>
      <li ><a href='versionhistory.aspx'><span>Version History</span></a></li>
      <li class="last"><a><asp:Button id="Button2" Text="Log Out"  runat="server" OnClick="logout_Click" /></a></li>
    </ul>
     </div>
             </div>
     <div>
    
     <asp:panel id="Fieldset2" style="position:absolute;border-color:black;height:240px;width:100%;margin-top:0px;border:10px solid transparent;  padding: 15px;
    -webkit-border-image: url(border.png) 30 round; /* Safari 3.1-5 */
    -o-border-image: url(border.png) 30 round; /* Opera 11-12.1 */
    border-image: url(border.png) 30 round;background-image:url(bak1.png);" runat="server">
          <h1 style="position:absolute;top:0px">Rogue Transportation Order Tracking for Orders In Progress OR CANCELLED</h1> <br /><br />
       
       <asp:linkbutton ID="Linkbutton1" runat="server"  style="position:absolute;left:20px;margin-top:30px;color:black" OnClientClick="PopupPicker('TextBoxG1', 250, 250)">Order Start Date</asp:linkbutton>
       <asp:TextBox ID="TextBoxG1" style="position:absolute;left:200px;margin-top:30px"  runat="server" ></asp:TextBox><br /><br />
        
       <asp:linkbutton ID="Linkbutton2"  runat="server" style="position:absolute;left:20px;margin-top:20px;color:black"  OnClientClick="PopupPicker('TextBoxG2', 250, 250)">Order End Date</asp:linkbutton>
       <asp:TextBox ID="TextBoxG2" style="position:absolute;left:200px;margin-top:20px" runat="server"></asp:TextBox><br /><br />

       <asp:label ID="reference"  Text="Reference#" runat="server" style="position:absolute;left:20px;color:darkblue;margin-top:20px" ></asp:label>
       
       <asp:TextBox ID="TextBox3" style="position:absolute;left:200px;margin-top:20px" runat="server"></asp:TextBox><br /><br />

       <asp:label ID="orderNo"  Text="Order#" runat="server" style="position:absolute;left:20px;color:darkblue;margin-top:20px" ></asp:label>
       
       <asp:TextBox ID="TextBox4" style="position:absolute;left:200px;margin-top:20px" runat="server" ></asp:TextBox>
     
     <asp:Button ID="magic" runat="server" Text="View Report" OnClick="magic_Click"  style="font-size:20px;position:absolute;left:400px; margin-top:20px" />
       
    </asp:panel><br/><br/>
         
    <fieldset id="Fieldset3" style="position:absolute;width:150%;margin-top:300px;border:10px solid transparent;  padding: 15px;
    -webkit-border-image: url(border.png) 30 stretch; /* Safari 3.1-5 */
    -o-border-image: url(border.png) 30 stretch; /* Opera 11-12.1 */
    border-image: url(border.png) 30 stretch;" runat="server">
     <asp:Button ID="Button1" runat="server" Text="Export to EXCEL" OnClick="Button1_Click"   autopostback="true" Visible="FALSE"/><br />
     <asp:UpdatePanel runat="server">

         <Triggers></Triggers>
         <ContentTemplate>
      <ASP:DataGrid id="MyDataGrid" runat="server" 
      CssClass="GridViewStyle"
      
      BorderColor="black"
      ShowFooter="true"
      ShowHeader="true"
      ShowPageHeader="true"
      AutoGenerateSelectButton="true"       
      AutoGenerateColumns="false"
      CellPadding="3"
      BackColor="White"
      CellSpacing="0"
      Font-Name="Verdana"
      Font-Size="8pt"
      HeaderStyle-BackColor="#aaaadd"
      EnableViewState="true"
      AllowPaging="True" PageSize="20"
      OnPageIndexChanged="Grid_PageIndexChanged"
      resizeble="true"
      OnItemCommand="ItemsGrid_Command"
      OnItemDataBound="Item_Bound"

         
      
     
      >
     <Columns>
           <asp:TemplateColumn>
              <HeaderTemplate>
                  <asp:Label ID="Label1" runat="server" Text="Reference"></asp:Label><br />
                  <asp:Textbox  style="width:70%"  id="filterOrder1" runat="server" ></asp:Textbox> <asp:Button id="filterbutton1" runat="server"  CommandName="filter2" style="height:20px;width:20px;background-image:url(filter.gif)" ></asp:Button>
              </HeaderTemplate>
              <ItemTemplate>
               <asp:label ID="label3" 
                            Text='<%# Eval("Reference") %>' style="color:blue;text-decoration:underline" runat="server">
                </asp:label>
               </ItemTemplate>
              
          </asp:TemplateColumn>
           
            <asp:BoundColumn DataField="Account Name" HeaderText="Account Name" />
          

            <asp:BoundColumn DataField="Order No" HeaderText="Order No" ItemStyle-Font-Underline="true"  />

            <asp:BoundColumn DataField="Invoice Number" HeaderText="Invoice Number" />

            <asp:BoundColumn DataField="Service Type" HeaderText="Service Type"/>
            <asp:BoundColumn DataField="Status" HeaderText="Status"/>

            <asp:BoundColumn DataField="Pickup Time"  HeaderText="Pickup Time"/>
            <asp:BoundColumn DataField="Pickup Company" HeaderText="Pickup Company" />

            <asp:BoundColumn DataField="Pickup Street" HeaderText="Pickup Street"/>
            <asp:BoundColumn DataField="Pickup City" HeaderText="Pickup City"/>

            <asp:BoundColumn DataField="Pickup Province" HeaderText="Pickup Province" />

            <asp:BoundColumn DataField="Pickup PostalCode" HeaderText="Pickup PostalCode"/>

            <asp:BoundColumn DataField="Deliver Time" HeaderText="Deliver Time"/>

            <asp:BoundColumn DataField="Delivery Company" HeaderText="Delivery Company" />

            <asp:BoundColumn DataField="Delivery Street" HeaderText="Delivery Street" />

           <asp:BoundColumn DataField="Delivery City" HeaderText="Delivery City" />
           <asp:BoundColumn DataField="Delivery Province" HeaderText="Delivery Province" />
         
           <asp:BoundColumn DataField="Delivery PostalCode" HeaderText="Delivery PostalCode" />

           <asp:BoundColumn DataField="Billed Weight" HeaderText="Billed Weight" />

           <asp:BoundColumn DataField="Freight Charge" HeaderText="Freight Charge" />
           <asp:BoundColumn DataField="Fuel" HeaderText="Fuel" />
          
           <asp:BoundColumn DataField="allaccessory1" HeaderText="Accessorials Fee" />
           <asp:BoundColumn DataField="waitingtimeamount" HeaderText="Waiting Time" />
            <asp:BoundColumn DataField="afterhoursamount" HeaderText="After Hours" />
            <asp:BoundColumn DataField="insuranceamount" HeaderText="Insurance" />

             
           <asp:BoundColumn DataField="Freight Subtotal" HeaderText="Freight Subtotal" />

           <asp:BoundColumn DataField="Tax Name" HeaderText="Tax Name" />

            <asp:BoundColumn DataField="Tax Subtotal" HeaderText="Tax Subtotal" />
            <asp:BoundColumn DataField="Client Charge" HeaderText="Client Charge" />
            


         </Columns> 


   
      <AlternatingItemStyle BackColor="#aaaadd" />
     
      <PagerStyle  Mode="NumericPages" NextPageText="Next" Position="top" PrevPageText="Previous" />
     <FooterStyle BackColor="white" Font-Bold="True" ForeColor="green" />
           <HeaderStyle BackColor="lightblue" Font-Bold="true" ForeColor="green" Font-Size="Larger"></HeaderStyle>

        
    </asp:DataGrid>
           </ContentTemplate>
        </asp:UpdatePanel>
   

      

   
        <br />
     

      

   
    </fieldset>
     
        
 </div>
       </form>
   </body>
    </html>
    