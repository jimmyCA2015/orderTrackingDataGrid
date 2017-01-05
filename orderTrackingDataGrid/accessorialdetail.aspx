<%@ Page Language="C#" AutoEventWireup="true" CodeFile="accessorialdetail.aspx.cs" Inherits="accessorialdetail" %>

<!DOCTYPE html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="Scripts/jquery.js" type="text/javascript"></script>
<script src="Scripts/colResizable-1.3.min.js" type="text/javascript"></script>
<script src="Scripts/jquery.cookie.js" type="text/javascript"></script>
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
     </script>

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
          <h1 style="position:absolute;top:0px;">Rogue Transportation Accessorials Detail</h1> <br /><br />
       
       <asp:linkbutton ID="Linkbutton1" runat="server"  style="position:absolute;left:20px;margin-top:30px;color:black;" OnClientClick="PopupPicker('TextBoxG1', 250, 250)">Pickup Start Date</asp:linkbutton>
       <asp:TextBox ID="TextBoxG1" style="position:absolute;left:200px;margin-top:30px;"  runat="server" ></asp:TextBox><br /><br />
        
       <asp:linkbutton ID="Linkbutton2"  runat="server" style="position:absolute;left:20px;margin-top:50px;color:black;"  OnClientClick="PopupPicker('TextBoxG2', 250, 250)">Pickup End Date</asp:linkbutton>
       <asp:TextBox ID="TextBoxG2" style="position:absolute;left:200px;margin-top:50px" runat="server"></asp:TextBox><br /><br />

      
     
     <asp:Button ID="magic" runat="server" Text="View Report" OnClick="magic_Click"  style="font-size:20px;position:absolute;left:400px; margin-top:20px" />
         
       
    </asp:panel><br/><br/>
    <fieldset id="Fieldset3" style="position:absolute;width:150%;margin-top:320px;border:10px solid transparent;  padding: 15px;
    -webkit-border-image: url(border.png) 30 stretch; /* Safari 3.1-5 */
    -o-border-image: url(border.png) 30 stretch; /* Opera 11-12.1 */
    border-image: url(border.png) 30 stretch;" runat="server">
     <asp:Button ID="Button1" runat="server" Text="Export to EXCEL" OnClick="Button1_Click"   autopostback="true" Visible="FALSE"/><br />
     <asp:label ID="reference"  Text="Reference#"  style="position:absolute; top: 4px; left: 184px;" Visible="false" runat="server"></asp:label>
     <asp:TextBox ID="TextBox3" style="position:absolute; top: 5px; left: 259px; height: 16px;" Visible="false" runat="server"></asp:TextBox>
     <asp:label ID="orderNo" style="position:absolute; top: 6px; left: 429px;"  Text="Order#" Visible="false" runat="server"  ></asp:label>
     <asp:TextBox ID="TextBox4" style="position:absolute; top: 5px; left: 505px;"  Visible="false" runat="server" ></asp:TextBox>
     <asp:Button ID="filter" runat="server" style="position:absolute;left:666px; top: 5px; width: 20px;height:20px;background-image:url(filter.gif)" OnClick="UpdateFilter" Visible="false"  />

     <asp:updatePanel runat="server">
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
            <asp:BoundColumn DataField="orderno" HeaderText="Order No" />
            <asp:BoundColumn DataField="Reference" HeaderText="Reference" />
            <asp:BoundColumn DataField="Pickup Time" HeaderText="Pickup Time" />
            <asp:BoundColumn DataField="Deliver Time" HeaderText="Deliver Time" />
     </Columns> 

   
     <AlternatingItemStyle BackColor="#aaaadd" />
     <HeaderStyle BackColor="lightblue" Font-Bold="true" ForeColor="green" Font-Size="Larger"></HeaderStyle>
     <PagerStyle  Mode="NumericPages" NextPageText="Next >" Position="TopAndBottom" PrevPageText="< Previous"  ForeColor="#4A3C8C" BackColor="#E7E7FF"  />
     <FooterStyle BackColor="white" Font-Bold="True" ForeColor="green" />
     </ASP:DataGrid>
    </ContentTemplate>
   </asp:updatePanel>
     <br /><br />
     <br />
   </fieldset>
  </div>
     </form>
   </body>
    </html>
    
