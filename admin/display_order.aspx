<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="display_order.aspx.cs" Inherits="admin_display_order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="c1" Runat="Server">
      <div class="col-12">

          <h1>All Order</h1>

                    <!-- Examples -->
                    <div class="card">

                        <div class="card-body">

                           <table class="table table-striped">

    <asp:Repeater ID="r1" runat="server">

        <HeaderTemplate>
             <thead>
                                <tr>
                                    <th>id</th>
                                    <th>firstname</th>
                                    <th>lastname</th>
                                    <th>email</th>
                                    <th>city</th>
                                    <th>mobile</th>
                                    <th>orderstatus</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
             <tbody>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                                            <td><%#Eval("id") %></td>
                                            <td><%#Eval("firstname") %></td>
                                            <td><%#Eval("lastname") %></td>
                                            <td><%#Eval("email") %></td>
                                            <td><%#Eval("city") %></td>
                                            <td><%#Eval("mobile") %></td>
                                            <td><%#Eval("orderstatus") %></td>
                                            <td><a href="full_order.aspx?id=<%#Eval("id") %>" style="color:#6d5196">View</a></td>
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

