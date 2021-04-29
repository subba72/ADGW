<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="UserLogin.aspx.cs" Inherits="ADGW.UserLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
      <div class="row">
         <div class="col-md-6 mx-auto" style="margin-top:5%">
            <div class="card">
               <div class="card-body">
            
                  <div class="row">
                     <div class="col">
                        <center>
                           <img width="150px" src="imgs/user.png" /> 
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center>
                           <h3>User Login</h3>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                         <label>User ID</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="userIDTxt" runat="server" placeholder="user ID"></asp:TextBox>
                        </div>
                        <label>Password</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="UserPswdTxt" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                        </div>
                           
                        <div class="d-grid gap-2 col-6 mx-auto">
                           <div class="col-4">
                                <asp:Button ID="Button2" class="btn btn-lg btn-block btn-success" runat="server" Text="Login" OnClick="Button2_Click"   />
                            </div>
                            <%--  <div class="col-4">
                                <asp:Button ID="Button1" class="btn btn-lg btn-block btn-success" runat="server" Text="Add" OnClick="Button2_Click" />
                            </div>

                          <button class="btn btn-primary" type="button">Sign Up</button>--%>
                        </div>

                    </div>
                </div>
                   <!-- <a href="Home.aspx"><< Back to Home</a><br><br>
              <a href="AdminLogin.aspx"><< admin</a><br><br>
                       -->
                </div>
            </div>
             </div>
          </div>
        </div>


           
      
</asp:Content>
