<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="my_order.aspx.cs" Inherits="my_order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="c1" Runat="Server">
      
				    


                           <table class="table table-striped">

                               <center> My Orders</center>

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
                                            <td>
                                                <a href="my_full_order.aspx?id=<%#Eval("id") %>" style="color:#6d5196">View</a> &nbsp;
                                             

                                                
                                                   <a href="cancel_order.aspx?id=<%#Eval("id") %>" style="color:#6d5196">Cancel</a></td>
                                        </tr>

        </ItemTemplate>

        <FooterTemplate>
             
                                </tbody>
                          
        </FooterTemplate>

    </asp:Repeater>


           </table>
                               
                               
                    
</asp:Content>

