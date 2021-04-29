<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="Items.aspx.cs" Inherits="ADGW.Items" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid"  >
      <div class="row" style="margin-left:15%" >
         <div class="col-md-5">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Add Item</h4>
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
                           <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Item ID"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-5">
                        <label>Item Name</label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Item Name"></asp:TextBox>
                               
                           </div>
                        </div>
                     </div>
                  </div>
                   <div class="row">
                     <div class="col-md-5">
                        <label>Item Quantity</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="units"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-5">
                        <label>Category</label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="Category"></asp:TextBox>
                               
                           </div>
                        </div>
                     </div>
                  </div>
                   <div class="row">
                     <div class="col-md-5">
                        <label>Description</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" placeholder=""></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-5">
                        <label>Price</label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" placeholder="price $"></asp:TextBox>
                               
                           </div>
                        </div>
                     </div>
                  </div>

                 
                  <div class="row">
                     <div class="col-md-5">
                        <label>Purchase Date</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Purchase Date" TextMode="Date"></asp:TextBox>
                        </div>
                     </div>
                      <div class="col-md-5">
                        <label>Manufacture Date</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox10" runat="server" placeholder="Manufacture Date" TextMode="Date"></asp:TextBox>
                        </div>
                  </div>
                     
                      
                  </div>
                    <div class="row">
                  
                         <div class="col-md-5">
                        <label>Expiry Date</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox11" runat="server" placeholder="Expity Date" TextMode="Date"></asp:TextBox>
                        <div class="col-5">
                        <asp:Button ID="Button2" class="btn btn-lg btn-block btn-primary" runat="server" Text="Add" />
                     </div>
                         </div>
                   
                       </div>
                      
               </div>
            </div>
                   
 
            <br>
         </div>
             </div>
         <div class="col-md-6">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Item List</h4>
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
