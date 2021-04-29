<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="AUserManagement.aspx.cs" Inherits="ADGW.UserManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {

          
          /*      $('.table_id').DataTable();*/
   

         $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
     
        });
    </script>
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
            margin-left: -8%;
        }
        .auto-style1 {
            margin-top: 0px;
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
                                        <asp:Button class="btn btn-primary" ID="gobtn" runat="server" Text="Go" OnClick="Button1_Click" style="height: 27px" />
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
                                <asp:Button  ID="addBtn" class="btn btn-lg btn-block btn-success" runat="server" Text="Add" OnClick="Button2_Click" />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="updateBtn" class="btn btn-lg btn-block btn-warning" runat="server" Text="Update" OnClick="Button3_Click" />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="delBtn" class="btn btn-lg btn-block btn-danger" runat="server" Text="Delete" OnClick="delBtn_Click" />
                            </div>
                        </div>


                    </div>
                </div>
 
                <br>
            </div>

            <div class="col-md-7" style="margin-right:-20%;padding-right:-10%">

                <div class="card">
                    <div class="card-body">



                        <div class="row">
                            <div class="col">
                                <center>
                                        <h4>User List</h4>
                                    </center>
                            </div>
                        </div>

                       

                        <div class="row" ">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        <div class="row">
                            <asp:SqlDataSource ID="GETDATAFROMSQL" runat="server" ConnectionString="<%$ ConnectionStrings:grocerydbConnectionString %>" SelectCommand="SELECT [id], [name], [phone], [email], [address], [user_type] FROM [users]" DeleteCommand="DELETE FROM [users] WHERE [id] = @id" InsertCommand="INSERT INTO [users] ([id], [name], [phone], [email], [address], [user_type]) VALUES (@id, @name, @phone, @email, @address, @user_type)" UpdateCommand="UPDATE [users] SET [name] = @name, [phone] = @phone, [email] = @email, [address] = @address, [user_type] = @user_type WHERE [id] = @id">
                                <DeleteParameters>
                                    <asp:Parameter Name="id" Type="String" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="id" Type="String" />
                                    <asp:Parameter Name="name" Type="String" />
                                    <asp:Parameter Name="phone" Type="String" />
                                    <asp:Parameter Name="email" Type="String" />
                                    <asp:Parameter Name="address" Type="String" />
                                    <asp:Parameter Name="user_type" Type="String" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="name" Type="String" />
                                    <asp:Parameter Name="phone" Type="String" />
                                    <asp:Parameter Name="email" Type="String" />
                                    <asp:Parameter Name="address" Type="String" />
                                    <asp:Parameter Name="user_type" Type="String" />
                                    <asp:Parameter Name="id" Type="String" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView class="table table-striped table-bordered" ID="userData" runat="server" AutoGenerateColumns="False" CssClass="auto-style1" DataKeyNames="id" DataSourceID="GETDATAFROMSQL" CellPadding="4" ForeColor="#333333" GridLines="None">
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    <Columns>
                                        <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" />
                                        <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                                        <asp:BoundField DataField="phone" HeaderText="phone" SortExpression="phone" />
                                        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                                        <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
                                        <asp:BoundField DataField="user_type" HeaderText="user_type" SortExpression="user_type" />
                                    </Columns>
                                    <EditRowStyle BackColor="#999999" />
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                </asp:GridView>
                            </div>
                        </div>


                    </div>
                </div>


            </div>

        </div>
    </div>

</asp:Content>
