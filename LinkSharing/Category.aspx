﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Category.aspx.cs"
Inherits="LinkSharing.Category" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
  <head runat="server">
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
      crossorigin="anonymous"
    />
    <title>Insert Category</title>
      <style>
            
          .protitle{
            font-size: xx-large;
            font-family:'Lucida Handwriting';
        }
        .nav-item{
            font-size:large;

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
      </style>
  </head>
  <body class="body">
    
      <form autocomplete="off" id="form1" runat="server">
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
      <asp:LinkButton ID="logout" runat="server" OnClick="logout_Click">Logout </asp:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </div>
</nav>
        </div>
          <div class="container mt-5">
        <div class="card border-primary">
          <h5 class="card-header">Insert Category or Sub-Category</h5>
          <div class="card-body">
            <div class="input-group mb-3">
              <span class="input-group-text">Category Name:</span>
              <asp:TextBox
                ID="txt_cname"
                class="form-control"
                runat="server"
              ></asp:TextBox>
              <asp:Button
                ID="btn_submit"
                class="btn btn-outline-secondary"
                runat="server"
                Text="Insert"
                OnClick="btn_submit_Click"
              />
              <asp:RegularExpressionValidator
                ID="RegularExpressionValidatorCname"
                runat="server"
                ErrorMessage="Category name can not contain special text and have to be at least 2 char long"
                ValidationExpression="^[a-zA-Z- ]{3,50}$"
                ControlToValidate="txt_cname"
                ForeColor="Red"
              ></asp:RegularExpressionValidator>
            </div>
          </div>
        </div>

        <div class="card border-primary mt-3 table-responsive">
          <h5 class="card-header">List of Category</h5>
          <div class="card-body">
            <asp:GridView
              ID="gv_category"
              class="table table-bordered table-condensed table-responsive table-hover "
              runat="server"
              AutoGenerateColumns="False"
              AutoGenerateDeleteButton="True"
              AutoGenerateEditButton="True"
              DataSourceID="SqlDataSourceCategory"
              AllowPaging="True"
              DataKeyNames="Id"
            >
              <Columns>
                <asp:BoundField
                  DataField="Id"
                  HeaderText="Id"
                  SortExpression="Id"
                  InsertVisible="False"
                  ReadOnly="True"
                />
                <asp:BoundField
                  DataField="Uid"
                  HeaderText="Uid"
                  SortExpression="Uid"
                />
                <asp:BoundField
                  DataField="Name"
                  HeaderText="Name"
                  SortExpression="Name"
                />
              </Columns>
            </asp:GridView>
            <asp:SqlDataSource
              ID="SqlDataSourceCategory"
              runat="server"
              ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
              SelectCommand="SELECT * FROM [Category]"
              DeleteCommand="Delete from [Category] where [Id]=@Id"
              UpdateCommand="Update [Category] set [Name]=@Name where [Id]=@Id"
            ></asp:SqlDataSource>
          </div>
        </div>
          </div>
      </form>
    
  </body>
</html>
