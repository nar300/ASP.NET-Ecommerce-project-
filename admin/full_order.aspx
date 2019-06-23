<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="full_order.aspx.cs" Inherits="admin_full_order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="Server">
    <div class="col-12">

        <h1>Full Order</h1>

        <!-- Examples -->
        <div class="card">
            <div class="card-body">

                <table>
                    <tr>
                        <td>firstname</td>
                        <td><asp:Label ID="firstname" runat="server" Font-Bold="true"></asp:Label></td>
                    </tr>
                     <tr>
                        <td>lastname</td>
                        <td><asp:Label ID="lastname" runat="server" Font-Bold="true"></asp:Label></td>
                    </tr>
                     <tr>
                        <td>email</td>
                        <td><asp:Label ID="email" runat="server" Font-Bold="true"></asp:Label></td>
                    </tr>
                     <tr>
                        <td>address</td>
                        <td><asp:Label ID="address" runat="server" Font-Bold="true"></asp:Label></td>
                    </tr>
                     <tr>
                        <td>city</td>
                        <td><asp:Label ID="city" runat="server" Font-Bold="true"></asp:Label></td>
                    </tr>
                     <tr>
                        <td>mobile</td>
                        <td><asp:Label ID="mobile" runat="server" Font-Bold="true"></asp:Label></td>
                    </tr>
                     <tr>
                        <td>orderstatus</td>
                        <td><asp:Label ID="orderstatus" runat="server" Font-Bold="true"></asp:Label></td>
                    </tr>

                   <tr>
                       <td>&nbsp;</td>
                   </tr>
                    <tr>
                        <td colspan="2" align="center">
                            change status
                            <asp:DropDownList ID="DropDownList1" runat="server">
                                <asp:ListItem>Shipped</asp:ListItem>
                                <asp:ListItem>Deliveres</asp:ListItem>
                                <asp:ListItem>Cancel</asp:ListItem>
                                <asp:ListItem>New</asp:ListItem>
                                <asp:ListItem>Close</asp:ListItem>
                            </asp:DropDownList>

                            <asp:Button ID="Button1" runat="server" Text="Change Satatus" OnClick="Button1_Click" />
                        </td>
                    </tr>
                </table>


                <br /><br />

                <table class="table table-striped">

                    <asp:Repeater ID="r1" runat="server">

                        <HeaderTemplate>
                            <thead>
                                <tr>
                                    <th>Product Image</th>
                                    <th>Product Name</th>
                                    <th>Product Price</th>
                                    <th>Product Qty</th>
                                    <th>Total</th>
                                </tr>
                            </thead>
                            <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><img src="<%#Eval("product_images") %>" height="100" width="100" /></td>
                                <td><%#Eval("product_name") %></td>
                                <td><%#Eval("product_price") %></td>
                                <td><%#Eval("product_qty") %></td>
                                <td><%#Eval("product_gtotal") %></td>
                            </tr>

                        </ItemTemplate>

                        <FooterTemplate>
                            </tbody>
                          
                        </FooterTemplate>

                    </asp:Repeater>


                </table>


                <p align="right">
               <asp:Label ID="totalamount" runat="server" Font-Bold="true" Font-Size="Large"></asp:Label>
                    </p>



            </div>
            <!-- .card-body -->
        </div>
        <!-- .card -->
        <!-- /End Examples -->

    </div>
    <!-- .col -->
</asp:Content>

