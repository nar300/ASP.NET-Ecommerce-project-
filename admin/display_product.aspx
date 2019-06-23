<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="display_product.aspx.cs" Inherits="admin_display_product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="c1" Runat="Server">

     <div class="col-12">

                    <!-- Examples -->
                    <div class="card">

                        <div class="card-body">

                           <table id="example1" class="table table-striped">

    <asp:Repeater ID="r1" runat="server">

        <HeaderTemplate>
             <thead>
                                <tr>
                                    <th>Image</th>
                                    <th>Category</th>
                                    <th>Product Name</th>
                                    <th>Original Price</th>
                                    <th>Selling Price</th>
                                    <th>Quantity</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
             <tbody>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                                            <td><img src="<%#Eval("product_images") %>" height="100" width="100"> </td>
                                            <td><%#Eval("product_category") %></td>
                                            <td><%#Eval("product_name") %></td>
                                            <td><%#Eval("product_price_original") %></td>
                                            <td><%#Eval("product_selling_price") %></td>
                                            <td><%#Eval("product_qty") %></td>
                                            <td><a href="edit_product.aspx?id=<%#Eval("id") %>" style="color:#6d5196"><span class="ti-pencil-alt"></span></a>
                                           <a href="delete_product.aspx?id=<%#Eval("id") %>" style="color:red; margin-left:10px"><i class="fa fa-ban"></i></a></td>
                                        </tr>

        </ItemTemplate>

        <FooterTemplate>
             
                                </tbody>
                          
        </FooterTemplate>

    </asp:Repeater>


           </table>
                               
                               
                              

                        </div><!-- .card-body -->
                    </div><!-- .card -->
                    <!-- /End Examples -->

                </div><!-- .col -->


     
</asp:Content>

