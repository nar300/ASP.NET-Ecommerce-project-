<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="my_full_order.aspx.cs" Inherits="my_full_order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="c1" Runat="Server">
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
                                <td><img src="admin/<%#Eval("product_images") %>" height="100" width="100" /></td>
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

</asp:Content>

