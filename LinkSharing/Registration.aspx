<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="LinkSharing.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="	https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <title></title>
    <style type="text/css">
          
        .auto-style1 {
            width: 100%;
        }
        .auto-style3 {
            height: 35px;
            text-align: right;
            width: 609px;
        }
        .auto-style4 {
            height: 35px;
            width: 197px;
        }
        .auto-style5 {
            height: 35px;
            text-align: left;
        }
        .auto-style6 {
            font-size: x-large;
        }
        .auto-style8 {
            border-style: solid;
            border-color: inherit;
            border-width: medium;
            text-align: center;
            margin-left: 460px;
            width: 438px;
            padding: 15px;
            font-size: xx-large;
            font-family:Papyrus;
        }
        #Button1{
            color: blue;
            padding: 5px;
            font-size: 17px;
            border: 1px solid #008CBA;
            border-radius: 8px;
            background-color: rgb(128,128,128,0.5);
        }
        #Button1:hover {
            box-shadow: 0 5px 15px 0 rgba(0,0,255,0.6);
        }
        #Reset1{
            color: blue;
            padding: 5px;
            font-size: 17px;
            border: 1px solid #008CBA;
            border-radius: 8px;
            background-color: rgb(128,128,128,0.5);
        }
        #Reset1:hover {
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
            <br />
            <br />
            <br />
            <br />
        </div>
        <p class="auto-style8"><strong><em>REGISTRATION</em></strong></p>
        <div>
            <table cellpadding="2" cellspacing="1" class="auto-style1">
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label1" runat="server" Text="User Name :"></asp:Label>
                    </td>
                    <td class="auto-style4">
                        <asp:TextBox ID="u_name" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style5">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="u_name" ErrorMessage="User Name is required." ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label2" runat="server" Text="Email Id :"></asp:Label>
                    </td>
                    <td class="auto-style4">
                        <asp:TextBox ID="u_email" runat="server" TextMode="Email"></asp:TextBox>
                    </td>
                    <td class="auto-style5">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="u_email" ErrorMessage="Email is required." ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label3" runat="server" Text="Contact No :"></asp:Label>
                    </td>
                    <td class="auto-style4">
                        <asp:TextBox ID="u_contact" runat="server" TextMode="Phone"></asp:TextBox>
                    </td>
                    <td class="auto-style5">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="u_contact" ErrorMessage="Contact No. is required." ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="u_contact" ErrorMessage="Must be 10 digit." ForeColor="Red" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label4" runat="server" Text="Password :"></asp:Label>
                    </td>
                    <td class="auto-style4">
                        <asp:TextBox ID="u_pswd" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                    <td class="auto-style5">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="u_pswd" ErrorMessage="Password is required." ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label5" runat="server" Text="Confirm Password :"></asp:Label>
                    </td>
                    <td class="auto-style4">
                        <asp:TextBox ID="u_cpswd" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                    <td class="auto-style5">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="u_cpswd" ErrorMessage="Confirm Password is required." ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="u_pswd" ControlToValidate="u_cpswd" ErrorMessage="Passwords not matching." ForeColor="Red"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style4">
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text=" SignUP " CssClass="nav-item" />
&nbsp;&nbsp; <span class="auto-style6"><strong>|</strong></span>&nbsp;&nbsp;
                        <input id="Reset1" type="reset" value=" Reset " class="nav-item" /></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
