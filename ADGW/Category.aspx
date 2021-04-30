<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="ADGW.Category" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="container-fluid"  >
      <div class="row" style="margin-left:15%" >
           <div class="col-md-3">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Category List<asp:SqlDataSource ID="catSqlDat" runat="server" ConnectionString="<%$ ConnectionStrings:grocerydbConnectionString %>" SelectCommand="SELECT [category_id], [name] FROM [category]"></asp:SqlDataSource>
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
                        <asp:GridView class="table table-striped table-bordered" ID="catGridView" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="category_id" DataSourceID="catSqlDat">
                            <Columns>
                                <asp:BoundField DataField="category_id" HeaderText="CODE" ReadOnly="True" SortExpression="category_id" />
                                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                            </Columns>
                            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                            <RowStyle BackColor="White" ForeColor="#003399" />
                            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                            <SortedAscendingCellStyle BackColor="#EDF6F6" />
                            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                            <SortedDescendingCellStyle BackColor="#D6DFDF" />
                            <SortedDescendingHeaderStyle BackColor="#002876" />
                         </asp:GridView>
                     </div>
                  </div>
               </div>
            </div>
         </div>
   
 
         <div class="col-md-6">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Add Category</h4>
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
                        <label>Category ID</label>
                        <div class="form-group">
                             <div class="input-group">
                                 <asp:TextBox CssClass="auto-style3" ID="catIdTxt" runat="server" placeholder="category ID" Width="220px"></asp:TextBox>
                            <asp:Button class="btn btn-primary" ID="loadSupplierBtn" runat="server" Text="load" Height="25px" Width="40px" CssClass="auto-style5" OnClick="loadCategory_Click"  />
                             </div>
                           
                        </div>
                     </div>
                     <div class="col-md-5">
                        <label>Category Name</label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="auto-style3" ID="catNameTxt" runat="server" placeholder="Category Name" Width="273px"></asp:TextBox>
                               
                           </div>
                        </div>
                     </div>
                   
 
            <br>
         </div>
             </div>
               
                  <table>
                      <tr>
                          <td>
                              <asp:Button ID="catAddBtn" class="btn btn-lg btn-block btn-primary" runat="server" Text="Add" OnClick="catAddBtn_Click"   />
                          </td>
                           <td>
                               <asp:Button ID="catUpdateBtn" class="btn btn-lg btn-block btn-warning" runat="server" Text="Update" OnClick="catUpdateBtn_Click" />
                               
                          </td>
                           <td>
                                <asp:Button ID="catDelBtn" class="btn btn-lg btn-block btn-danger" runat="server" Text="Delete" OnClick="catDelBtn_Click"   />
                                
                          </td>
                      </tr>
                  </table>
                                    
                                
                        
                     </div></div>      
               </div>
         </div>
</asp:Content>
