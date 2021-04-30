<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="AMemberManagement.aspx.cs" Inherits="ADGW.MemberManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container">
        <div class="row" style="margin-left:15%">
            <div class="col-md-5">

                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                        <h4>Member Details</h4>
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
                                <label>  ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="MemIdTxt" runat="server" placeholder="ID"></asp:TextBox>
                                        <asp:Button class="btn btn-primary" ID="goBtn" runat="server" Text="Go" OnClick="Button1_Click" />
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-8">
                                <label>  Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="memNameTxt" runat="server" placeholder="Enter Name"></asp:TextBox>

                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <label>  Address</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="addressTxt" runat="server" placeholder="Input address"></asp:TextBox>
                                       
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-8">
                                <label>  Email</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="emailTxt" runat="server" placeholder="Email"></asp:TextBox>

                                </div>
                            </div>
                        </div>
                         <div class="row">
                            <div class="col-md-4">
                                <label>  Phone</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="phoneTxt" runat="server" placeholder="P.no"></asp:TextBox>
                                       
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-8">
                                <label>  Member type</label>
                                <div class="form-group">
                                   <asp:DropDownList ID="MemTypeDrpdwn" runat="server" class="form-control" >
                                <asp:ListItem>select</asp:ListItem>
                                <asp:ListItem>Normal</asp:ListItem>
                                <asp:ListItem>Member</asp:ListItem>
                                 <asp:ListItem>VIP</asp:ListItem>
                            </asp:DropDownList>

                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-4">
                                <asp:Button ID="addMem" class="btn btn-lg btn-block btn-success" runat="server" Text="Add" OnClick="Button2_Click" />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="updateMem" class="btn btn-lg btn-block btn-warning" runat="server" Text="Update" OnClick="updateMem_Click" />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="delMem" class="btn btn-lg btn-block btn-danger" runat="server" Text="Delete" OnClick="delMem_Click" />
                            </div>
                        </div>


                    </div>
                </div>

                <a href="Home.aspx">&nbsp;</a><br>
                <br>
            </div>

            <div class="col-md-7">

                <div class="card">
                    <div class="card-body">



                        <div class="row">
                            <div class="col">
                                <center>
                                        <h4>Member List</h4>
                                    </center>
                            </div>
                        </div>

                       

                        <div class="row">
                            <div class="col">
                                <asp:SqlDataSource ID="custDatasql" runat="server" ConnectionString="<%$ ConnectionStrings:grocerydbConnectionString %>" SelectCommand="SELECT [cust_id], [name], [address], [email], [phone], [customer_type] FROM [customer]"></asp:SqlDataSource>
                                <hr>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <asp:GridView class="table table-striped table-bordered" ID="userGridView" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="cust_id" DataSourceID="custDatasql" ForeColor="#333333" GridLines="None">
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    <Columns>
                                        <asp:BoundField DataField="cust_id" HeaderText="cust_id" ReadOnly="True" SortExpression="cust_id" />
                                        <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                                        <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
                                        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                                        <asp:BoundField DataField="phone" HeaderText="phone" SortExpression="phone" />
                                        <asp:BoundField DataField="customer_type" HeaderText="customer_type" SortExpression="customer_type" />
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
