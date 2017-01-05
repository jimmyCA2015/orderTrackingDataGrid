<%@ Page Language="C#" AutoEventWireup="true" CodeFile="orderdetail.aspx.cs" Inherits="orderdetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
      <script type="text/javascript" >
          function resizeWindow() {
              // you can get height and width from serverside as well      


              myWindow = window.open("", "", "width=100, height=100");
              myWindow.resizeTo(400, 400);
              myWindow.moveTo(500, 500);
              // Resizes the new window
              myWindow.focus();

          }

       </script>
    
</head>
<body>
    <form id="form1" runat="server" width="800px" height="650px">
      <div id="fileprint" runat="server">
      <fieldset id="Fieldset1"  legend="Order Tracking" runat="server" style="position:absolute;border-color:black; top: 40px; left: 14px; height: 93px; width:773px">
          <legend style="color:red">Order Tracking</legend>
        <asp:Label ID="Label1" style="position:absolute;left:32px; top: 25px; height: 21px;" Text="Reference" runat="server"></asp:Label>
       <asp:textbox style="position:absolute;left:125px; top: 25px; width: 99px; right: 764px;" id="Textbox1" runat="server"></asp:textbox>
          
      <asp:Label ID="Label2" Text="Order No" style="position:absolute;left:246px; top: 26px; height: 21px; width: 76px;" runat="server"></asp:Label>
      <asp:textbox id="Textbox2" style="position:absolute;left:334px; top: 24px; height: 18px; width: 131px;" runat="server"></asp:textbox>
      <asp:Label ID="Label3" Text="Invoice Number" style="position:absolute;left:482px; top: 23px; height: 19px; width: 125px;" runat="server"></asp:Label>
      <asp:textbox id="Textbox3" style="position:absolute;left:611px; top: 21px; width: 137px;" runat="server" ></asp:textbox>
      <asp:Label ID="Label4"  Text="Service Type" style="position:absolute;left:24px; top: 61px;" runat="server"></asp:Label>
      <asp:textbox id="Textbox4" style="position:absolute;left:125px; top: 63px; height: 18px; width: 100px;" runat="server"></asp:textbox>
          <asp:Label ID="Label5" Text="Status" style="position:absolute; left: 269px; top: 63px;" runat="server"></asp:Label>
      <asp:textbox id="Textbox5" style="position:absolute;top: 57px; height: 21px; width: 131px; left:334px;" runat="server"></asp:textbox>
          <asp:Label ID="Label29" style="position:absolute; left: 482px; height: 36px; top: 57px;" Text="Account Name" runat="server"></asp:Label>
       <asp:textbox id="Textbox29" style="position:absolute;left:611px; top: 63px; width: 137px;" runat="server" ></asp:textbox>
      
      </fieldSet>
        <fieldset id="Fieldset2" legend="Pick Up Info"  runat="server" style="position:absolute;border-color:black; top: 165px; left: 13px; width: 360px; height: 288px;" >
        <legend style="color:red">Pickup Information</legend>
        <asp:Label ID="Label6"  Text="Pickup Time" style="position:absolute;left:15px; top: 22px; height: 25px; width: 115px;" runat="server"></asp:Label>
        <asp:textbox id="Textbox6" style="position:absolute;top: 19px; height: 20px; width: 185px; bottom: 247px; left: 153px; right: 163px;" runat="server"></asp:textbox>
        <asp:Label ID="Label7" Text="Pickup Company" style="position:absolute;left:15px; top: 59px; right: 224px; height: 19px; width: 117px;" runat="server"></asp:Label>
        <asp:textbox id="Textbox7" style="position:absolute;left:153px; top: 58px; height: 22px; width: 185px; right: 139px;" runat="server"></asp:textbox>
        <asp:Label ID="Label8" Text="Pickup Street" style="position:absolute;left:15px; top: 98px; width: 115px;" runat="server"></asp:Label>
      <asp:textbox id="Textbox8" style="position:absolute;left:153px; top: 99px; width: 185px; height: 21px;" runat="server"></asp:textbox>
       <asp:Label ID="Label9"  Text="Pickup City" style="position:absolute;left:15px; top: 136px; width: 89px; height: 25px;" runat="server"></asp:Label>
      <asp:textbox id="Textbox9" style="position:absolute;left:153px; top: 136px; width: 185px; height: 22px;" runat="server"></asp:textbox>
       <asp:Label ID="Label10"   Text="Pickup Province" style="position:absolute;left:15px; top: 181px; height: 14px;" runat="server"></asp:Label>     
      <asp:textbox id="Textbox10" style="position:absolute;left:153px; top: 184px; height: 20px; width: 185px;" runat="server"></asp:textbox>
            <asp:Label ID="Label11" Text="Pickup PostalCode" style="position:absolute;left:15px; top: 228px; height: 23px; width: 122px;" runat="server"></asp:Label>
      <asp:textbox id="Textbox11" style="position:absolute;left:153px; top: 233px; width: 185px; height: 21px;" runat="server"></asp:textbox>
        </fieldset>
        <fieldset id="Fieldset3" legend="Delivery Info" runat="server" style="position:absolute;border-color:black; top: 167px; left: 404px; height: 287px; width: 387px; margin-top: 0px;">
            <legend style="color:red">Delivery Information</legend>
            <asp:Label ID="Label12" style="position:absolute;left:25px; top: 24px; height: 26px; width: 133px;" Text="Deliver Time" runat="server"></asp:Label>
      <asp:textbox style="position:absolute;left:163px; top: 18px; width:185px; height: 21px; bottom: 246px;" id="Textbox12" runat="server"></asp:textbox>
            <asp:Label ID="Label13" style="position:absolute;left:25px; top: 58px; height: 28px; " Text="Delivery Company" runat="server"></asp:Label>
      <asp:textbox style="position:absolute;left:164px; top: 56px; width:185px; height: 22px;" id="Textbox13" runat="server"></asp:textbox>
            <asp:Label ID="Label14"  style="position:absolute;left:25px; top: 101px; width: 105px;" Text="Delivery Street" runat="server"></asp:Label>
      <asp:textbox style="position:absolute; top: 93px; left: 164px; width:185px; height: 23px;" id="Textbox14" runat="server"></asp:textbox>
            <asp:Label ID="Label15"  style="position:absolute; top: 136px; left: 25px; height: 2px;" Text="Delivery City" runat="server"></asp:Label>
      <asp:textbox style="position:absolute; top: 140px; left: 164px; height: 24px; width: 185px;" id="Textbox15" runat="server"></asp:textbox>
            <asp:Label ID="Label16"  style="position:absolute; top: 187px; left: 25px;" Text="Delivery Province" runat="server"></asp:Label>
      <asp:textbox style="position:absolute; top: 192px; left: 164px; height: 20px; width: 185px;" id="Textbox16" runat="server"> </asp:textbox>
            <asp:Label ID="Label17" style="position:absolute; top: 235px; left: 25px;"  Text="Delivery PostalCode" runat="server"></asp:Label>
      <asp:textbox style="position:absolute; top: 235px; left: 164px; height: 23px; width: 185px;" id="Textbox17" runat="server"></asp:textbox>
            </fieldset>&nbsp;
    
      <fieldset id="Fieldset4" legend="Order Charge" runat="server" style="position:absolute;border-color:black; top: 482px; left: 12px; height: 212px; margin-bottom: 102px; width: 795px;">
          <legend style="color:red">Order Charge Details</legend>
            <asp:Label ID="Label18"  style="position:absolute; top: 32px; left: 19px; height: 23px; width: 91px; right: 681px;" Text="Billed Weight" runat="server"></asp:Label>
      <asp:textbox style="position:absolute; top: 27px; left: 131px; height: 20px; width: 135px;" id="Textbox18" runat="server"></asp:textbox>
            <asp:Label ID="Label19"   style="position:absolute; top: 31px; left: 293px; height: 30px; right: 392px;" Text="Freight Charge" runat="server"></asp:Label>
      <asp:textbox style="position:absolute; top: 29px; height: 23px; left: 400px; width: 78px;" id="Textbox19" runat="server"></asp:textbox>
            <asp:Label ID="Label20"   style="position:absolute; top: 33px; left: 528px; height: 27px; width: 95px; right: 168px;" Text="Fuel" runat="server"></asp:Label>
      <asp:textbox style="position:absolute; top: 31px; left: 617px; width: 115px;height:20px" id="Textbox20" runat="server"></asp:textbox>
            <asp:Label ID="Label21"  style="position:absolute; top: 56px; left: 8px; width: 141px; margin-top: 26px;" Text="Accessorials Fee" runat="server"></asp:Label>
      <asp:textbox style="position:absolute; top: 79px; left: 132px; height: 20px; width: 137px;" id="Textbox21" runat="server"></asp:textbox>
            <asp:Label ID="Label22"   style="position:absolute; top: 86px; left: 292px;" Text="Waiting Time" runat="server"></asp:Label>
      <asp:textbox style="position:absolute; top: 77px; left: 401px; height: 25px; width: 78px; " id="Textbox22" runat="server"></asp:textbox>
            <asp:Label ID="Label23"  style="position:absolute; top: 83px; left: 499px; height: 20px; width: 109px; bottom: 113px;" Text="After Hours" runat="server"></asp:Label>
      <asp:textbox style="position:absolute; top: 81px; left: 617px; height: 23px; width: 113px;" id="Textbox23" runat="server"></asp:textbox>
            <asp:Label ID="Label24"  style="position:absolute; top: 133px; left: 286px; height: 36px;" Text="Freight Subtotal" runat="server"></asp:Label>
      <asp:textbox style="position:absolute; top: 126px; left: 400px; width: 77px; height: 20px;" id="Textbox24" runat="server" ></asp:textbox>
            <asp:Label ID="Label25"  style="position:absolute; top: 130px; left: 522px; height: 30px; width: 90px; right: 179px;" Text="Tax Name" runat="server"></asp:Label>
      <asp:textbox style="position:absolute; top: 130px; left: 617px; height: 23px; width: 114px; " id="Textbox25" runat="server"></asp:textbox>
            <asp:Label ID="Label26" style="position:absolute; left: 32px; height: 29px; top: 180px;" Text="Tax Subtotal" runat="server"></asp:Label>
      <asp:textbox style="position:absolute; top: 173px; height: 23px; width: 135px; left: 131px; right: 517px;" id="Textbox26" runat="server"></asp:textbox>
           <asp:Label ID="Label27" style="position:absolute; left: 298px; height: 36px; top: 175px;" Text="Client Charge" runat="server"></asp:Label>
      <asp:textbox style="position:absolute; top: 176px; left: 400px; height: 23px; width: 84px; right: 307px;" id="Textbox27" runat="server"></asp:textbox>
          <asp:Label ID="Label28" style="position:absolute; left: 56px; height: 36px; top: 127px;" Text="Insurance" runat="server"></asp:Label>
      <asp:textbox style="position:absolute; top: 125px; left: 131px; height: 23px; width: 135px; right: 525px;" id="Textbox28" runat="server"></asp:textbox>
             
      </fieldset>
        </div>
        <asp:Button style="position:absolute;left:20px; top:7px;" ID="wow" Text="Click To Print"  CausesValidation="False" OnClientClick="javascript:self.print();return false;" UseSubmitBehavior="False" runat="server" />

    </form><br />
    
    

</body>
</html>

