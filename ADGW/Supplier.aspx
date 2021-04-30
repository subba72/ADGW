<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="Supplier.aspx.cs" Inherits="ADGW.Supplier" %>
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
                           <h4>Supplier List<asp:SqlDataSource ID="SupplierDatasql" runat="server" ConnectionString="<%$ ConnectionStrings:grocerydbConnectionString %>" SelectCommand="SELECT [supplier_id], [supplier_name] FROM [supplier]"></asp:SqlDataSource>
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
                        <asp:GridView class="table table-striped table-bordered" ID="SupplierGridView" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="supplier_id" DataSourceID="SupplierDatasql">
                            <Columns>
                                <asp:BoundField DataField="supplier_id" HeaderText="supplier_id" ReadOnly="True" SortExpression="supplier_id" />
                                <asp:BoundField DataField="supplier_name" HeaderText="supplier_name" SortExpression="supplier_name" />
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
                           <h4>Add Supplier</h4>
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
                        <label>Supplier ID</label>
                        <div class="form-group">
                             <div class="input-group">
                                 <asp:TextBox CssClass="auto-style3" ID="txtSupId" runat="server" placeholder="category ID" Width="220px"></asp:TextBox>
                            <asp:Button class="btn btn-primary" ID="LoadSupData" runat="server" Text="load" Height="25px" Width="40px" CssClass="auto-style5" OnClick="LoadSupData_Click"   />
                             </div>
                           
                        </div>
                     </div>
                     <div class="col-md-5">
                        <label>Supplier Name</label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="auto-style3" ID="txtSupName" runat="server" placeholder="Category Name" Width="273px"></asp:TextBox>
                               
                           </div>
                        </div>
                     </div>
                   
 
            <br>
         </div>
             </div>
               
                  <table>
                      <tr>
                          <td>
                              <asp:Button ID="addSuplierBtn" class="btn btn-lg btn-block btn-primary" runat="server" Text="Add" OnClick="addSuplierBtn_Click"   />
                          </td>
                           <td>
                               <asp:Button ID="updateSupplierBtn" class="btn btn-lg btn-block btn-warning" runat="server" Text="Update" OnClick="updateSupplierBtn_Click" />
                               
                          </td>
                           <td>
                                <asp:Button ID="deleteSupplierBtn" class="btn btn-lg btn-block btn-danger" runat="server" Text="Delete" OnClick="deleteSupplierBtn_Click"   />
                                
                          </td>
                      </tr>
                  </table>
                                    
                                
                        
                     </div></div>      
               
 </div></div>
</asp:Content>
