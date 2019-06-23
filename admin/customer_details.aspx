<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="customer_details.aspx.cs" Inherits="admin_customer_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="c1" Runat="Server">
       <div class="col-12">

          <h1>All Registered User</h1>

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

