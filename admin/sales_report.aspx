<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="sales_report.aspx.cs" Inherits="admin_sales_report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="c1" Runat="Server">

    <div class="col-12">

    <table class="table">
        <tr>
            <td>Select Start Date</td>
            <td>
               
                    <asp:TextBox ID="startdate" runat="server" class="form-control"  TextMode="Date"></asp:TextBox>
                </td>
            <td>Select Start Date</td>
            <td>
                    <asp:TextBox ID="enddate" runat="server" class="form-control"  TextMode="Date"></asp:TextBox>
                </td>
            <td>
                <asp:Button ID="b1" runat="server" Text="Display Sales" CssClass="btn btn-success" OnClick="b1_Click" />
            </td>

        </tr> 

    </table>

        </div>


       <div class="col-12" style="margin-top:-200px">

          <h1>Orders</h1>

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
                                    <th>order date</th>
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
                                            <td><%#Eval("order_date") %></td>
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

