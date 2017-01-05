<%@ Page Language="C#" MasterPageFile="~/ordertrack.master" AutoEventWireup="true" CodeFile="Invoice.aspx.cs" Inherits="Invoice" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     
   
     
    

</asp:Content>   
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <fieldset id="Fieldset2" style="height:242px; position:absolute;margin-top:10px; left: 0px;width:100%;border:10px solid transparent;  padding: 15px;
    -webkit-border-image: url(border.png) 30 round; /* Safari 3.1-5 */
    -o-border-image: url(border.png) 30 round; /* Opera 11-12.1 */
    border-image: url(border.png) 30 round;background-image:url(bak1.png);" runat="server">
          <h1 style="position:absolute;margin-top:10px">Rogue Transportation Invoice Tracking</h1> 
       
      
       <asp:label ID="InoviceNo"  Text="Invoice#" runat="server" style="position:absolute;left:20px;color:black;font-size:20px;margin-top:80px" ></asp:label>
       
      
        <asp:DropDownList ID="txtDropDown1" runat="server"  AutoPostBack="True" style="position:absolute;left:120px;margin-top:80px" BackColor="#F6F1DB" ForeColor="#7d6754" Font-Names="Andalus" CssClass="ddl" >
         </asp:DropDownList>
     
     <asp:Button ID="magic" runat="server" Text="View Report" OnClick="magic_Click"  style="font-size:20px;position:absolute;left:400px; margin-top:80px" />
    
    </fieldset>
    <fieldset id="Fieldset3" style="position:absolute;margin-top:320px;width:150%;border:10px solid transparent;  padding: 15px;
    -webkit-border-image: url(border.png) 30 stretch; /* Safari 3.1-5 */
    -o-border-image: url(border.png) 30 stretch; /* Opera 11-12.1 */
    border-image: url(border.png) 30 stretch;" runat="server">
     <asp:Button ID="Button1" runat="server" Text="Export to EXCEL" OnClick="Button1_Click"   autopostback="true" Visible="FALSE"/><br />
     <asp:UpdatePanel runat="server">
         <Triggers></Triggers>
          
         <ContentTemplate>
            
     
        
      <ASP:Datagrid id="MyDataGrid" runat="server" 
      ShowHeaderWhenEmpty="true"
      AutoGenerateColumns="false"
      BorderColor="black"
      ShowFooter="true" 
      ShowHeader="true"
      CellPadding="3"
      BackColor="White"
      CellSpacing="0"
      Font-Name="Verdana"
      Font-Size="8pt"
      HeaderStyle-BackColor="#aaaadd"
      EnableViewState="true"
      AllowPaging="True" PageSize="20"
      OnPageIndexChanged="Grid_PageIndexChanged"
      OnItemCommand="ItemsGrid_Command"
      OnItemDataBound="Item_Bound"
      >
          
      <Columns>
          <asp:TemplateColumn>
              <HeaderTemplate>
                  <asp:Label runat="server" Text="Reference"></asp:Label><br />
                  <asp:Textbox  style="width:70%"  id="filterInvoice1" runat="server" ></asp:Textbox> <asp:Button id="filterbutton1" runat="server"  CommandName="filter1" style="height:20px;width:20px;background-image:url(filter.gif)"  />
              </HeaderTemplate>
              <ItemTemplate>
               <asp:LinkButton 
                           CommandName="Select"    Text='<%# Eval("Reference") %>' runat="server">
                </asp:LinkButton>
               </ItemTemplate>
              
          </asp:TemplateColumn>
       
           
         
          <asp:BoundColumn DataField="Account Name" HeaderText="Account Name" />

            <asp:BoundColumn DataField="Order No" HeaderText="Order No" />

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
      <HeaderStyle BackColor="lightblue" Font-Bold="true" ForeColor="green" Font-Size="Larger"></HeaderStyle>
      <PagerStyle  Mode="NumericPages" NextPageText="Next >" Position="TopAndBottom" PrevPageText="< Previous"  ForeColor="#4A3C8C" BackColor="#E7E7FF"  />
       
        
     <FooterStyle BackColor="white" Font-Bold="True" ForeColor="green" />

          
        
    </ASP:Datagrid>
   </ContentTemplate>
      </asp:UpdatePanel>
      

   
        <br />
     

      

   
    </fieldset>
</asp:Content>