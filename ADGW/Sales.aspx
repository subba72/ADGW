<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="Sales.aspx.cs" Inherits="ADGW.Sales" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
                           <h4>Sales List<asp:SqlDataSource ID="catSqlDat" runat="server" ConnectionString="<%$ ConnectionStrings:grocerydbConnectionString %>" SelectCommand="SELECT [category_id], [name] FROM [category]"></asp:SqlDataSource>
                               <asp:SqlDataSource ID="saleSqlDat" runat="server" ConnectionString="<%$ ConnectionStrings:grocerydbConnectionString %>" SelectCommand="SELECT [id], [item_name], [item_quantity], [description], [price], [purchase_date], [manu_date], [exp_date], [category].[name] AS &quot;Category&quot; FROM [items] JOIN category on items.category=category.category_id"></asp:SqlDataSource>
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
                        <asp:GridView class="table table-striped table-bordered" ID="itemGrid" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="saleSqlDat">
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
         <div class="col-md-11">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Add Sales</h4>
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
                        <label>Sale ID</label>
                        <div class="form-group">
                             <div class="input-group">
                                  <asp:TextBox CssClass="auto-style3" ID="txtSaleID" runat="server" placeholder="Item ID" Width="256px"></asp:TextBox>
                             <asp:Button class="btn btn-primary" ID="saleLoad" runat="server" Text="load" Height="25px" Width="40px" CssClass="auto-style5" OnClick="saleLoad_Click"   />
                      
                             </div>
                            </div>
                     </div>
                     <div class="col-md-5">
                        <label>Search Item ID</label>
                        <div class="form-group">
                           <div class="input-group">
                               
                             <asp:Button class="btn btn-primary" ID="searchItem" runat="server" Text="search" Height="25px" Width="40px" CssClass="auto-style5" OnClick="searchItem_Click"    />
                      
                              <asp:TextBox CssClass="auto-style3" ID="txtItemID" runat="server" placeholder="Item Name" Width="254px"></asp:TextBox>
                               
                               <asp:GridView ID="itemsearchRsult" runat="server">
                               </asp:GridView>
                      
                           </div>
                        </div>
                     </div>
                  </div>
                   <div class="row">
                     <div class="col-md-5">
                        <label>Quantity</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="auto-style2" ID="txtSaleQuantity" runat="server" placeholder="units" Width="251px"></asp:TextBox>
                        </div>
                     </div>
                      
                  </div>
                   <div class="row">
                     <div class="col-md-5">
                         Total
                        <div class="form-group">
                           <asp:TextBox CssClass="auto-style3" ID="txtSaleTotal" runat="server" placeholder="" Width="249px"></asp:TextBox>
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

              
                <table>
                      <tr>
                          <td>
                              <asp:Button ID="saleAddBtn" class="btn btn-lg btn-block btn-primary" runat="server" Text="Add" OnClick="saleAddBtn_Click"  />
                             </td>
                           <td>
                               <asp:Button ID="saleUpdateBtn" class="btn btn-lg btn-block btn-warning" runat="server" Text="Update"  />
                             
                          </td>
                           <td>
                               <asp:Button ID="saleDelBtn" class="btn btn-lg btn-block btn-danger" runat="server" Text="Delete"  />
              
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
