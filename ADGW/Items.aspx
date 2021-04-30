<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="Items.aspx.cs" Inherits="ADGW.Items" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            position: relative;
            display: flex;
            flex-wrap: wrap;
            align-items: stretch;
            width: 100%;
            left: -45px;
            top: 4px;
            margin-left: 40px;
        }
        .auto-style2 {
            display: block;
            font-size: 1rem;
            font-weight: 400;
            line-height: 1.5;
            color: #212529;
            background-clip: padding-box;
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            border-radius: .25rem;
            transition: none;
            border: 1px solid #ced4da;
            margin-bottom: 0;
            background-color: #fff;
        }
        .auto-style3 {
            display: block;
            font-size: 1rem;
            font-weight: 400;
            line-height: 1.5;
            color: #212529;
            background-clip: padding-box;
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            border-radius: .25rem;
            transition: none;
            border: 1px solid #ced4da;
            background-color: #fff;
        }
        .auto-style4 {
            position: relative;
            display: flex;
            flex-wrap: wrap;
            align-items: stretch;
            width: 31%;
            left: 1px;
            top: 0px;
        }
        .auto-style5 {
            left: 5px;
            top: 0px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
       <div class="container-fluid"  >
    <div class="row" style="margin-left:15%">
  <div class="col-md-11">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Item List<asp:SqlDataSource ID="itemSqlDat" runat="server" ConnectionString="<%$ ConnectionStrings:grocerydbConnectionString %>" SelectCommand="SELECT [id], [item_name], [item_quantity], [description], [price], [purchase_date], [manu_date], [exp_date], [category].[name] AS &quot;Category&quot; FROM [items] JOIN category on items.category=category.category_id"></asp:SqlDataSource>
                            </h4>
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
                        <asp:GridView class="table table-striped table-bordered" ID="itemGrid" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="id" DataSourceID="itemSqlDat">
                            <Columns>
                                <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" />
                                <asp:BoundField DataField="item_name" HeaderText="item_name" SortExpression="item_name" />
                                <asp:BoundField DataField="item_quantity" HeaderText="item_quantity" SortExpression="item_quantity" />
                                <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
                                <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                                <asp:BoundField DataField="purchase_date" HeaderText="purchase_date" SortExpression="purchase_date" />
                                <asp:BoundField DataField="manu_date" HeaderText="manu_date" SortExpression="manu_date" />
                                <asp:BoundField DataField="exp_date" HeaderText="exp_date" SortExpression="exp_date" />
                                <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
                            </Columns>
                            <FooterStyle BackColor="White" ForeColor="#000066" />
                            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                            <RowStyle ForeColor="#000066" />
                            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#007DBB" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#00547E" />
                         </asp:GridView>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      <div class="row"   >
         <div class="col-md-8">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Add Item<asp:SqlDataSource ID="catSqlDat" runat="server" ConnectionString="<%$ ConnectionStrings:grocerydbConnectionString %>" SelectCommand="SELECT [category_id], [name] FROM [category]"></asp:SqlDataSource>
                            </h4>
                        </center>
                     </div>
                  </div>
 
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-5">
                        <label>Item ID</label>
                        <div class="form-group">
                             <div class="input-group">
                                  <asp:TextBox CssClass="auto-style3" ID="txtitemID" runat="server" placeholder="Item ID" Width="256px"></asp:TextBox>
                             <asp:Button class="btn btn-primary" ID="itemLoad" runat="server" Text="load" Height="25px" Width="40px" CssClass="auto-style5" OnClick="itemLoad_Click"  />
                      
                             </div>
                            </div>
                     </div>
                     <div class="col-md-5">
                        <label>Item Name</label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="auto-style3" ID="txtItemName" runat="server" placeholder="Item Name" Width="254px"></asp:TextBox>
                               
                           </div>
                        </div>
                     </div>
                  </div>
                   <div class="row">
                     <div class="col-md-5">
                        <label>Item Quantity</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="auto-style2" ID="txtItemQuantity" runat="server" placeholder="units" Width="251px"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-5">
                        <label>Category</label>
                        <div class="form-group">
                           <div class="auto-style1">
                               <asp:DropDownList ID="drpdownCat" runat="server" DataSourceID="catSqlDat" DataTextField="name" DataValueField="category_id" Height="26px" Width="264px">
                               </asp:DropDownList>
                               
                           </div>
                        </div>
                     </div>
                  </div>
                   <div class="row">
                     <div class="col-md-5">
                        <label>Description</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="auto-style3" ID="txtDescr" runat="server" placeholder="" Width="249px"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-5">
                        <label>Price</label>
                        <div class="form-group">
                           <div class="auto-style4">
                              <asp:TextBox CssClass="form-control" ID="txtPrice" runat="server" placeholder="price $"></asp:TextBox>
                               
                           </div>
                        </div>
                     </div>
                  </div>

                 
                  <div class="row">
                     <div class="col-md-5">
                        <label>Purchase Date</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="auto-style3" ID="TxtPDate" runat="server" placeholder="Purchase Date" TextMode="Date" Width="247px"></asp:TextBox>
                        </div>
                     </div>
                      <div class="col-md-5">
                        <label>Manufacture Date</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="auto-style3" ID="txtMdate" runat="server" placeholder="Manufacture Date" TextMode="Date" Width="245px"></asp:TextBox>
                        </div>
                  </div>
                     
                      
                  </div>
                    <div class="row">
                  
                         <div class="col-md-5">
                        <label>Expiry Date</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="auto-style3" ID="txtEDate" runat="server" placeholder="Expity Date" TextMode="Date" Width="244px"></asp:TextBox>
                       
                         </div>
                   
                       </div>
                      
               </div>
                <table>
                      <tr>
                          <td>
                              <asp:Button ID="ItemAddBtn" class="btn btn-lg btn-block btn-primary" runat="server" Text="Add" OnClick="addBtn_Click" />
                             </td>
                           <td>
                               <asp:Button ID="ItemUpdateBtn" class="btn btn-lg btn-block btn-warning" runat="server" Text="Update" OnClick="Button3_Click"   />
                             
                          </td>
                           <td>
                               <asp:Button ID="itemDelBtn" class="btn btn-lg btn-block btn-danger" runat="server" Text="Delete" OnClick="delBtn_Click" />
              
                          </td>
                      </tr>
                  </table>
                                   
                        
                        
                               
                               
 
            <br>
         </div>
             </div>
        
      </div>
   
          </div>
          </div>
        </div>
    
</asp:Content>
