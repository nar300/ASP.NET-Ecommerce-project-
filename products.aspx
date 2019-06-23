<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="products.aspx.cs" Inherits="products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="Server">


    <asp:Repeater ID="r1" runat="server" >

        <ItemTemplate>
            <div class="col-md-3 top_brand_left">
                <div class="hover14 column">
                    <div class="agile_top_brand_left_grid">
                        <!--<div class="tag"><img src="images/tag.png" alt=" " class="img-responsive" /></div>-->
                        <div class="agile_top_brand_left_grid1">
                            <figure>
                                <div class="snipcart-item block">
                                    <div class="snipcart-thumb">
                                        <a href="single.html">
                                            <img title=" " alt=" " src="admin/<%#Eval("product_images") %>" height="140" width="140" /></a>
                                        <center>
                                <p><%#Eval("product_name") %></p>
                                </center>
                                        <center>
                                <h4>$<%#Eval("product_selling_price") %></h4></center>
                                    </div>
                                    <div class="snipcart-details top_brand_home_details">

                                        <a href="view_more.aspx?id=<%#Eval("id") %>">
                                        <input type="button" name="btn" value="View More" class="button" /></a>


                                    </div>
                                </div>
                            </figure>
                        </div>
                    </div>
                </div>
            </div>
        </ItemTemplate>

    </asp:Repeater>


</asp:Content>

