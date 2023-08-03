<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="LinkSharing.Index" %>

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
        .auto-style1 {
            text-align: center;
        }
        .auto-style2 {
            font-size: xx-large;
        }
        .protitle{
            font-size: xx-large;
            font-family:'Lucida Handwriting';
        }
        .nav-item{
            font-size:large;

        }
        #HyperLink1:link, #HyperLink1:visited {
          background-color: #af5f69;
          color: black;
          padding: 14px 25px;
          text-align: center;
          text-decoration: none;
          display: inline-block;
          border-radius: 10px;
        }
        #HyperLink1:hover, #HyperLink1:active {
          background-color: #ffc5b3;
        }
        #HyperLink2:link, #HyperLink2:visited {
          background-color: #af5f69;
          color: black;
          padding: 14px 25px;
          text-align: center;
          text-decoration: none;
          display: inline-block;
          border-radius: 10px;
        }
        #HyperLink2:hover, #HyperLink2:active {
          background-color: #ffc5b3;
        }
        #HyperLink3:link, #HyperLink3:visited {
          background-color: #af5f69;
          color: black;
          padding: 14px 25px;
          text-align: center;
          text-decoration: none;
          display: inline-block;
          border-radius: 10px;
        }
        #HyperLink3:hover, #HyperLink3:active {
          background-color: #ffc5b3;
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
          <a class="nav-link active" aria-current="page" href="Index.aspx">Home</a>
        </li>&nbsp;&nbsp;
         
        <li class="nav-item">
          <a class="nav-link" href="Contact.aspx">Contact</a>
        </li>
      </ul>
    </div>
      <asp:LinkButton ID="logout" runat="server" OnClick="logout_Click">Logout</asp:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </div>
</nav>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
        </div>
        <div class="auto-style1">
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="Links.aspx" CssClass="auto-style2">Links</asp:HyperLink>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="Category.aspx" CssClass="auto-style2">Insert Category</asp:HyperLink>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="Insert_Link.aspx" CssClass="auto-style2">Insert Link</asp:HyperLink>
        </div>
        
    </form>
</body>
</html>
