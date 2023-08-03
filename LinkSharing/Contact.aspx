5t<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="LinkSharing.Contact" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="	https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <title></title>
    <style type="text/css">
          
        #logout{
            margin-top: 10px;
            padding: 5px;
            font-size: 17px;
            border: 1px solid #008CBA;
            border-radius: 8px;
            background-color: #d3d2cc;
            text-decoration:none;
        }
        .protitle{
            font-size: xx-large;
            font-family:'Lucida Handwriting';
        }
        .nav-item{
            font-size:large;

        }
        .auto-style1 {
            width: 52%;
            margin-left:100px;
        }
        .auto-style2 {
            width: 111px;
        }
        .auto-style3 {
            padding: 4px;
            width: 111px;
            height: 125px;
            text-align: right;
        }
        .auto-style4 {
            height: 125px;
        }
        #Button1{
            color: blue;
            padding: 5px;
            font-size: 17px;
            border: 1px solid #008CBA;
            border-radius: 8px;
            background-color: rgb(128,128,128,0.5);
        }
        .auto-style7 {
            font-size: x-large;
        }
        .auto-style8 {
            font-size: xx-large;
        }
        .auto-style9 {
            padding: 4px;
            width: 111px;
            text-align: right;
            height: 44px;
        }
        .auto-style10 {
            height: 44px;
        }
    </style>
</head>
<body class="body">
    <form id="form1" runat="server" action="https://formcarry.com/s/4ZcUDnGxywk" method="POST">
         <div>
            <nav class="navbar navbar-expand-lg bg-light">
  <div class="container-fluid">
      <div class="protitle"><em><strong>  KeepLink</strong></em>&nbsp;&nbsp;</div>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" aria-current="page" href="Index.aspx">Home</a>
        </li>&nbsp;&nbsp;
         
        <li class="nav-item">
          <a class="nav-link active" href="Contact.aspx">Contact</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
            <br />
             <strong><span class="auto-style8">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Sorry</span><span class="auto-style7"> for the issue you faced.</span><br class="auto-style7" />
             <span class="auto-style8">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Please</span><span class="auto-style7"> let us know about your issue.</span></strong><br />
             <br />
            <br />
       
             <table class="auto-style1">
                 <tr>
                     <td class="auto-style9">
                         <strong>
                         <asp:Label ID="Label3" runat="server" Text="Name : "></asp:Label>
                         </strong>
                     </td>
                     <td class="auto-style10">&nbsp;
                         <asp:TextBox ID="User_Name" runat="server" Width="294px"></asp:TextBox>
                     &nbsp;&nbsp;&nbsp;&nbsp;
                         </td>
                 </tr>
                 <tr>
                     <td class="auto-style9">
                         <strong>
                         <asp:Label ID="Label4" runat="server" Text="Email : "></asp:Label>
                         </strong>
                     </td>
                     <td class="auto-style10">&nbsp;&nbsp;
                         <asp:TextBox ID="Email" runat="server" Width="292px"></asp:TextBox>
                         </td>
                 </tr>
                 <tr>
                     <td class="auto-style9">
                         <strong>
                         <asp:Label ID="Label1" runat="server" Text="Subject : "></asp:Label>
                         </strong>
                     </td>
                     <td class="auto-style10">&nbsp;
                         <asp:TextBox ID="Subject" runat="server" Width="303px"></asp:TextBox>
                     </td>
                 </tr>
                 <tr>
                     <td class="auto-style3">
                         <strong>
                         <asp:Label ID="Label2" runat="server" Text="Message : "></asp:Label>
                         </strong>
                     </td>
                     <td class="auto-style4">&nbsp;
                         <asp:TextBox ID="Message" runat="server" Height="115px" TextMode="MultiLine" Width="317px"></asp:TextBox>
                     </td>
                 </tr>
                 <tr>
                     <td class="auto-style2">&nbsp;</td>
                     <td>&nbsp;
                         <asp:Button ID="Button1" runat="server" Text="Send" Width="106px" />
                     </td>
                 </tr>
             </table>
            <br />
        </div>
    </form>
</body>
</html>
