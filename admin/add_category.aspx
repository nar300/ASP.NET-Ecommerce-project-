<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="add_category.aspx.cs" Inherits="admin_add_category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="Server">

    <div class="col-lg-6">


        <div class="card">
            <div class="form-row">
                <div class="form-group col-md-12">
                    <label for="categorytname" class="col-form-label">Category Name</label>
                    <asp:TextBox ID="t1" runat="server" CssClass="form-control" style="padding-left:10px; padding-right:10px;"></asp:TextBox>
                </div>

                <div class="form-group col-md-12">
                    <asp:Button ID="b1" runat="server" Text="Add Category" class="btn btn-primary default-btn-color form-control" style="padding-left:10px; padding-right:10px;" OnClick="b1_Click" />
                </div>

            </div>
        </div>

    </div>

    <div class="col-lg-6">
        <div class="card" style="padding: 10px">
            <asp:Repeater ID="dd1" runat="server">
                <HeaderTemplate>
                    <table id="example1" class="table table-striped">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Categories</th>
                                <th>Edit</th>
                                <th>Delete</th>
                            </tr>
                        </thead>
                        <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%#Eval("id") %></td>
                        <td>
                            <%#Eval("product_category") %>
                        </td>
                       <td>
                            <a href="edit_category.aspx?id=<%#Eval("id") %>">Edit</a>
                       </td>
                         <td>
                            <a href="delete.aspx?id=<%#Eval("id") %>">Delete</a>
                        </td>
                       
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </tbody>
                        </table>
                           
                </FooterTemplate>
            </asp:Repeater>

        </div>
</asp:Content>

