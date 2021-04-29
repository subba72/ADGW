<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="ADGW.SignUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid" style="margin-top:5%">
      <div class="row">
         <div class="col-md-5">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           s<img width="100px" src="imgs/user.png"/>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Your Profile</h4>
                           <span>Account Status - </span>
                           <asp:Label class="badge rounded-pill bg-info text-dark" ID="Label1" runat="server" Text="Your status"></asp:Label>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-6">
                        <label>Full Name</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Full Name"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label>Date of Birth</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Password" TextMode="Date"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-6">
                        <label>Contact No</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Contact No" TextMode="Number"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label>Email ID</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Email ID" TextMode="Email"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                   <div class="row">
                     <div class="col-md-4">
                        <label>Address</label>
                        <div class="form-group">
                            <asp:DropDownList ID="DropDownList1" runat="server" class="form-control" >
                                <asp:ListItem>select</asp:ListItem>
                                <asp:ListItem>Dharan</asp:ListItem>
                                <asp:ListItem>Biratnagar</asp:ListItem>
                                <asp:ListItem>Kathmandu</asp:ListItem>
                                <asp:ListItem>Pokhara</asp:ListItem>
                                <asp:ListItem>Jhapa</asp:ListItem>
                                <asp:ListItem>Itahari</asp:ListItem>
                                <asp:ListItem>Chitwan</asp:ListItem>
                                <asp:ListItem>Belbari</asp:ListItem>
                                <asp:ListItem>Janakpur</asp:ListItem>
                            </asp:DropDownList>

                        </div>
                     </div>
                    
                  <div class="row">
                     <div class="col">
                        <center>
                           <span class="badge rounded-pill bg-info text-dark">Login Credentials</span>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-4">
                        <label>User ID</label>
                        <div class="form-group">
                           <asp:TextBox class="form-control" ID="TextBox8" runat="server" placeholder="User ID" ReadOnly="True" Enabled="False" Width="631px"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                         <label>&nbsp;Password</label>
                        <div class="form-group">
                           <asp:TextBox class="form-control" ID="TextBox10" runat="server" placeholder="password" TextMode="Password"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-8 mx-auto">
                        <center>
                           <div class="form-group">
                              <asp:Button class="btn btn-primary btn-block btn-lg" ID="Button1" runat="server" Text="Update" />
                           </div>
                        </center>
                     </div>
                  </div>
               </div>
            </div>
            <a href="homepage.aspx"><< Back to Home</a><br><br>
         </div>
         <div class="col-md-7">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           &nbsp;</center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Items List</h4>
                           <asp:Label class="badge badge-pill badge-info" ID="Label2" runat="server" Text="your books info"></asp:Label>
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
                         <asp:GridView ID="GridView1" runat="server" class="table table-striped table-bordered"></asp:GridView>
                    </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>


</asp:Content>
