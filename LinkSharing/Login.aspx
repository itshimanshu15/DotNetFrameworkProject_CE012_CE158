<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="LinkSharing.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="	https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <title></title>
    <style type="text/css">
          
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            text-align: right;
            width: 639px;
            padding: 4px;
        }
        .auto-style3 {
            width: 178px;
            padding: 4px;
        }
        .auto-style4 {
            text-align: right;
            height: 29px;
            width: 639px;
            padding: 4px;
        }
        .auto-style5 {
            width: 178px;
            height: 29px;
            padding: 4px;
        }
        .auto-style7 {
            border-style: solid;
            border-color: inherit;
            border-width: medium;
            text-align: center;
            margin-left: 510px;
            width: 386px;
            padding: 15px;
            font-size: xx-large;
            font-family:Papyrus;
        }
        #Button_login{
            color: blue;
            padding: 5px;
            font-size: 17px;
            border: 1px solid #008CBA;
            border-radius: 8px;
            background-color: rgb(128,128,128,0.5);
        }
        #Button_login:hover {
            box-shadow: 0 5px 15px 0 rgba(0,0,255,0.6);
        }
               
        .auto-style9 {
            font-size: large;
        }
        .protitle{
            font-size: xx-large;
            font-family:'Lucida Handwriting';
        }
        .nav-item{
            font-size:large;

        }
        .auto-style10 {
            margin-left: 800px;
        }
        #HyperLink1 {
            background-color: rgb(128,128,128,0.5);
            color: black;
            padding: 0.5em 1em;
            text-decoration: none;
            text-transform: uppercase;
            border: 1px solid #008CBA;
            border-radius: 8px;
        }
        #HyperLink2 {
            background-color: rgb(128,128,128,0.5);
            color: black;
            padding: 0.5em 1em;
            text-decoration: none;
            text-transform: uppercase;
            border: 1px solid #008CBA;
            border-radius: 8px;
        }
    </style>
</head>
<body class="body">
    <form id="form1" runat="server">
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
          <a class="nav-link" href="Contact.aspx">Contact</a>
        </li>
      </ul>
        <div class="auto-style10">
            <asp:HyperLink ID="HyperLink2" runat="server" ForeColor="Blue" NavigateUrl="~/Registration.aspx" CssClass="auto-style9">SIGNUP</asp:HyperLink>    
            &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
            <asp:HyperLink ID="HyperLink1" runat="server" CssClass="auto-style9" ForeColor="Blue" NavigateUrl="~/Login.aspx">LOGIN</asp:HyperLink>
        </div>
</nav>
            
            <br />
        </div>
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">
                    <strong>
                    <asp:Label ID="Label1" runat="server" Text="Email Id :"></asp:Label>
                    </strong>
                </td>
                <td class="auto-style3">
                    <asp:TextBox ID="Lu_email" runat="server" TextMode="Email"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Lu_email" ErrorMessage="Email is required." ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <strong>
                    <asp:Label ID="Label2" runat="server" Text="Password :"></asp:Label>
                    </strong>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="Lu_pswd" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <!---<td class="auto-style6">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Lu_pswd" ErrorMessage="Password is required." ForeColor="Red"></asp:RequiredFieldValidator>
                </td>-->
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">
                    <asp:Button ID="Button_login" runat="server" OnClick="Button_login_Click" Text=" Login " CssClass="nav-item" />
                </td>
            </tr>
        </table>
        <div>
        </div>
    </form>
</body>
</html>
