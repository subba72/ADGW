<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="Stock.aspx.cs" Inherits="ADGW.Stock" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div class="container-fluid"  >
    <div class="row" style="margin-left:15%">
  <div class="col-md-11">
            <div class="card">
               <div class="card-body">
                   <div>
                       <h2>
                       <asp:Label ID="Label1" runat="server" Text="View Item Details"></asp:Label></h2>
                   </div>

                   Item:

                   <asp:DropDownList ID="ItemlistData" runat="server" DataSourceID="itemlist" DataTextField="item_name" DataValueField="id" AutoPostBack="True">
                   </asp:DropDownList>
                   <asp:SqlDataSource ID="itemlist" runat="server" ConnectionString="<%$ ConnectionStrings:grocerydbConnectionString %>" SelectCommand="SELECT [id], [item_name] FROM [items]"></asp:SqlDataSource>
                   <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" DataKeyNames="id" DataSourceID="displayItemdetailsql" GridLines="None">
                       <Columns>
                           <asp:BoundField DataField="id" HeaderText="CODE" ReadOnly="True" SortExpression="id" />
                           <asp:BoundField DataField="item_name" HeaderText="Name" SortExpression="item_name" />
                           <asp:BoundField DataField="item_quantity" HeaderText="Quantity" SortExpression="item_quantity" />
                           <asp:BoundField DataField="description" HeaderText="Description" SortExpression="description" />
                           <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price" />
                           <asp:BoundField DataField="purchase_date" HeaderText="Purchase Date" SortExpression="purchase_date" />
                           <asp:BoundField DataField="manu_date" HeaderText="Manufacture Date" SortExpression="manu_date" />
                           <asp:BoundField DataField="exp_date" HeaderText="Expiry Date" SortExpression="exp_date" />
                           <asp:BoundField DataField="name" HeaderText="Category" SortExpression="name" />
                       </Columns>
                       <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                       <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                       <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                       <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                       <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                       <SortedAscendingCellStyle BackColor="#F1F1F1" />
                       <SortedAscendingHeaderStyle BackColor="#594B9C" />
                       <SortedDescendingCellStyle BackColor="#CAC9C9" />
                       <SortedDescendingHeaderStyle BackColor="#33276A" />
                   </asp:GridView>
                   <asp:SqlDataSource ID="displayItemdetailsql" runat="server" ConnectionString="<%$ ConnectionStrings:grocerydbConnectionString %>" SelectCommand="SELECT [id], [item_quantity], [item_name], [description], [price], [purchase_date], [manu_date], [exp_date], [category].[name] FROM [items] ,[category] WHERE ([id] = @id) AND [items].[category] = [category].[category_id]">
                       <SelectParameters>
                           <asp:ControlParameter ControlID="ItemlistData" Name="id" PropertyName="SelectedValue" Type="String" />
                       </SelectParameters>
                   </asp:SqlDataSource>


                    <div>
                       <h2>
                       <asp:Label ID="Label2" runat="server" Text="View stock by Category"></asp:Label></h2>
                   </div>

                   </div>
                Category: <asp:DropDownList ID="catDrop" runat="server" AutoPostBack="True" DataSourceID="categoryDat" DataTextField="name" DataValueField="category_id" Height="31px" Width="132px">
            </asp:DropDownList>
            <asp:SqlDataSource ID="categoryDat" runat="server" ConnectionString="<%$ ConnectionStrings:grocerydbConnectionString %>" SelectCommand="SELECT [category_id], [name] FROM [category]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="catCOunt" runat="server" ConnectionString="<%$ ConnectionStrings:grocerydbConnectionString %>" SelectCommand="SELECT       COUNT(name) AS &quot;Total  Items&quot;
FROM            category as c ,items as i 
where i.category = c.category_id
and i.category= @id">
                <SelectParameters>
                    <asp:ControlParameter ControlID="catDrop" Name="id" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="catCOunt" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Total  Items" HeaderText="Total  Items" ReadOnly="True" SortExpression="Total  Items" />
                </Columns>
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
                </div>
            
      </div>

    </div>
            </div>

</asp:Content>
