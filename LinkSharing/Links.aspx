<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Links.aspx.cs" Inherits="LinkSharing.Links" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
      crossorigin="anonymous"
    />
    <title>Links</title>
    <style>
            
        .protitle{
            font-size: xx-large;
            font-family:'Lucida Handwriting';
        }
        .nav-item{
            font-size:large;

        }
        .card{
            margin-top: 5px;
            margin-bottom:5px;
        }
        #logout{
            margin-top: 10px;
            padding: 5px;
            font-size: 17px;
            border: 1px solid #008CBA;
            border-radius: 8px;
            background-color: #d3d2cc;
            text-decoration:none;
        }

        mainContent {
            text-align: center;
            justify-content: center;
            display: flex;
        }
        th:first-of-type {
          border-top-left-radius: 10px;
          padding: 10px;
        }
        th:last-of-type {
          border-top-right-radius: 10px;
          padding: 10px;
        }
        tr:last-of-type td:first-of-type {
          border-bottom-left-radius: 10px;
          padding: 10px;
        }
        tr:last-of-type td:last-of-type {
          border-bottom-right-radius: 10px;
        }
        table{
            width:70%;
            
            box-shadow:20px 20px 30px grey;
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
    </div>
      <asp:LinkButton ID="logout" runat="server" OnClick="logout_Click">Logout</asp:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </div>
</nav>
        </div>
        <div class="container-fluid mr-2 mt-3">
            <asp:GridView class="table table-bordered table-condensed table-responsive table-hover " ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSourceLinks" AllowSorting="True" EnableTheming="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:TemplateField HeaderText="Link" SortExpression="Link">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Link") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:HyperLink ID="Label1" runat="server"  Text='<%# Bind("Name") %>' Target="_blank" NavigateUrl='<%# Bind("Link") %>'></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Edit" SortExpression="Edit">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Link") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Button ID="Button1" runat="server" CommandArgument='<%# Bind("Id") %>' CommandName="ThisBtnClick" Text="Edit" OnClick="MyButtonClick" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                    <asp:CheckBoxField DataField="IsPublic" HeaderText="IsPublic" SortExpression="IsPublic" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceLinks" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT Urls.Id, Category.Name AS Category, Urls.Name AS Name, Urls.Link, Urls.Description, Urls.IsPublic FROM Urls INNER JOIN Category ON Urls.Cid = Category.Id">
                <DeleteParameters>
                    <asp:Parameter Name="Id" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Name" />
                    <asp:Parameter Name="Link" />
                    <asp:Parameter Name="Description" />
                    <asp:Parameter Name="IsPublic" />
                    <asp:Parameter Name="Id" />
                </UpdateParameters>
            </asp:SqlDataSource>
            
        </div>
    </form>
</body>
</html>
