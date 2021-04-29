<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="AUserManagement.aspx.cs" Inherits="ADGW.UserManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
      /*  .col-4{
            height:50px;
            width:60px;
            padding:10px;
        }*/
        .col-md-5,col-md-7{
            margin-top:5px;
            height:400px;
        }
    </style>
    

    <div class="container">
        <div class="row" style="margin-left:15%">
            <div class="col-md-5">

                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                        <h4>User Details</h4>
                                    </center>
                            </div>

                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                        <img width="100px" src="imgs/user.png" />
                                       
                                    </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <label>User ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TxtuserID" runat="server" placeholder="ID"></asp:TextBox>
                                        <asp:Button class="btn btn-primary" ID="Button1" runat="server" Text="Go" />
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-8">
                                <label>User Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtusername" runat="server" placeholder="User Name"></asp:TextBox>

                                </div>
                            </div>
                        </div>
                         <div class="row">
                            <div class="col-md-4">
                                <label>  Address</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="txtaddress" runat="server" placeholder="Input address"></asp:TextBox>
                                       
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-8">
                                <label>  Email</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtemail" runat="server" placeholder="Email"></asp:TextBox>

                                </div>
                            </div>
                        </div>
                         <div class="row">
                            <div class="col-md-4">
                                <label>  Phone</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="txtPhone" runat="server" placeholder="P.no"></asp:TextBox>
                                       
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-8">
                                <label>  User type</label>
                               <div class="form-group">
                            <asp:DropDownList ID="DrpDwnUserType" runat="server" class="form-control" >
                                <asp:ListItem>select</asp:ListItem>
                                <asp:ListItem>employee</asp:ListItem>
                                <asp:ListItem>admin</asp:ListItem>
                                 
                            </asp:DropDownList>

                        </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>  Password</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="txtpswd" runat="server" placeholder="pswd" OnTextChanged="TextBox7_TextChanged"></asp:TextBox>
                                       
                                    </div>
                                </div>
                            </div>
 
                        </div>
                        <div class="row">
                            <div class="col-4" >
                                <asp:Button  ID="Button2" class="btn btn-lg btn-block btn-success" runat="server" Text="Add" OnClick="Button2_Click" />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="Button3" class="btn btn-lg btn-block btn-warning" runat="server" Text="Update" />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="Button4" class="btn btn-lg btn-block btn-danger" runat="server" Text="Delete" />
                            </div>
                        </div>


                    </div>
                </div>
 
                <br>
            </div>

            <div class="col-md-7">

                <div class="card">
                    <div class="card-body">



                        <div class="row">
                            <div class="col">
                                <center>
                                        <h4>User List</h4>
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
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server"></asp:GridView>
                            </div>
                        </div>


                    </div>
                </div>


            </div>

        </div>
    </div>

</asp:Content>
