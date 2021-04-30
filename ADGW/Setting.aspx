<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="Setting.aspx.cs" Inherits="ADGW.Setting" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid"  >
      <div class="row" style="margin-left:15%" >
     <div class="col-md-6">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Change Password</h4>
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
                         <label>&nbsp;New Passowrd</label>
                        <div class="form-group">
                             <div class="input-group">
                                 <asp:TextBox CssClass="auto-style3" ID="txtChangePswd" runat="server" placeholder="new password" Width="268px"></asp:TextBox>
                             </div>
                           
                        </div>
                     </div>
                     <div class="col-md-5">
                         Confirm Passowrd:<div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="auto-style3" ID="txtConfirmPassword" runat="server" placeholder="confirm password" Width="273px"></asp:TextBox>
                               
                           </div>
                        </div>
                     </div>
                   
 
            <br>
         </div>
             </div>
               
                  <table>
                      <tr>
                          <td>
                              <asp:Button ID="changePswdBtn" class="btn btn-lg btn-block btn-success" runat="server" Text="Change Password" OnClick="changePswdBtn_Click"    />
                          </td>
                           <td>
                               &nbsp;</td>
                           <td>
                                &nbsp;</td>
                      </tr>
                  </table>
                                    
                                
                        
                     </div></div>      
          </div>
        </div>
</asp:Content>
