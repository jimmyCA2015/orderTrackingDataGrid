<%@ Page Language="C#"  MasterPageFile="~/ordertrack.master" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="Contactus" %>


 <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>   
   <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


      <fieldset id="Fieldset2" style="height:500px" runat="server">
    
    
                    <h1><span id="ctl00_lblHeading"></span> Rogue Transportation Contact</h1>

               
<p style="font-size:large">To contact one of our staff about the status of an order please call our office at the numbers listed  below
     </p>
<ul>
    <li>Local calls: (905) 362-9401</li>
    <li>Long distance: (800) 388-5143</li>
</ul>
<p>If your enquiry is about a technical issue with our web site or you want to add new functionality to the website,please fill out the following form and send us a message </p><br />
    <asp:label Text="Your Company Name" runat="server"></asp:label><asp:TextBox ID="cname" style="position:absolute;left:200px"  runat="server"></asp:TextBox><br /><br />
    <asp:label Text="Your Email Address" runat="server"></asp:label><asp:TextBox ID="cemail"  style="position:absolute;left:200px"   runat="server"></asp:TextBox><br /><br />
    <asp:label Text="Subject" runat="server"></asp:label><asp:TextBox ID="csubject"  style="position:absolute;left:200px"   runat="server"></asp:TextBox><br /><br />
    <asp:label Text="Message" runat="server"></asp:label><asp:TextBox ID="cmessage"  style="position:absolute;left:200px"  TextMode="multiline" Columns="50" Rows="5" runat="server"></asp:TextBox> <asp:label ID="Label1" Text="Message" runat="server"></asp:label><br /><br /><br /><br /><br /><br />
    <asp:Button ID="smessage" runat="server" Text="Send Message" OnClick="smessage_Click"   /> <br /><br />
      <asp:label ID="sstat" Text="" style="color:blue" runat="server"></asp:label>


        
   </fieldset>

    </asp:Content>

