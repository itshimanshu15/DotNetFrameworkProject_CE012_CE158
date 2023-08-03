<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Update_Link.aspx.cs" Inherits="LinkSharing.Update_Link" %>

  <!DOCTYPE html>

  <html xmlns="http://www.w3.org/1999/xhtml">

  <head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />

    <title>Insert Link</title>
  </head>

  <body>
    <form id="form1" class="mx-auto" runat="server">
      <main class="container mt-3 col-xl-6">

        <div class="accordion container" id="accordionExample">
          <!-- link name -->
          <div class="card">
            <div class="card-header" id="headingTwo">
              <label for="InputEmail" class="form-label font-weight-bold">Link Name</label>
              <asp:TextBox ID="txt_lname" class="form-control" runat="server" aria-describedby="emailHelp"
                data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo"
                required="required"></asp:TextBox>
              <asp:RegularExpressionValidator ID="RegularExpressionValidatorLname" runat="server"
                ErrorMessage="You can use only a to z, A to Z, 0 to 9 and _(underscore)" ControlToValidate="txt_lname"
                ForeColor="Red" ValidationExpression="[a-zA-Z0-9_]+"></asp:RegularExpressionValidator>
            </div>
            <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
              <div class="card-body">
                Why? - It will be displayed in the list.
              </div>
            </div>
          </div>
          <!-- Link -->
          <div class="card">
            <div class="card-header" id="headingThree">
              <label for="InputEmail" class="form-label font-weight-bold">Link</label>
              <asp:TextBox ID="txt_link" class="form-control" runat="server" TextMode="Url" required="required"
                aria-describedby="emailHelp" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false"
                aria-controls="collapseThree"></asp:TextBox>
            </div>
            <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
              <div class="card-body">
                Why? - Main URL.
              </div>
            </div>
          </div>

          <!-- Category -->
          <div class="card">
            <div class="card-header" id="headingThree">
              <label for="InputEmail" class="form-label font-weight-bold">Category</label>
                <asp:DropDownList ID="DDList_category" runat="server">
                     
                </asp:DropDownList>
            </div>
            <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
              <div class="card-body">
                Why? - Category in which it goes.
              </div>
            </div>
          </div>

          <!-- Description  -->
          <div class="card">
            <div class="card-header" id="headingFour">
              <label for="InputEmail" class="form-label font-weight-bold">Description</label>
              <asp:TextBox ID="txt_description" runat="server" TextMode="MultiLine" class="form-control"
                data-toggle="collapse" data-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour"
                Rows="4"></asp:TextBox>
            </div>
            <div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-parent="#accordionExample">
              <div class="card-body">
                Why? - Optional description about the link.
              </div>
            </div>
          </div>

          <!-- IsPublic -->
          <div class="card">
            <div class="card-header" id="headingSix">

              <div class="form-check form-switch">
                <asp:CheckBox ID="ckbox_ispublic" runat="server" />
                <label class="form-check-label" for="flexSwitchCheckChecked">Want to make this link as public. (Anybody
                  with your mail id can access this link, without knowing the password.)</label>
                  <br />
                  <asp:HiddenField ID="hf_urlid" runat="server" />
              </div>
            </div>

              <asp:Button ID="btn_submit" runat="server" Text="Update" class="btn btn-outline-success my-2" OnClick="btn_submit_Click" />
              <asp:Button ID="btn_delete" runat="server" Text="Delete" class="btn btn-outline-danger my-2" OnClick="btn_delete_Click" />
          </div>

      </main>
    </form>
  </body>

  </html>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
    crossorigin="anonymous"></script>