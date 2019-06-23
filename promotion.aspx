<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="promotion.aspx.cs" Inherits="promotion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="c1" Runat="Server">

    <h3 style="margin-top:-100px;">PROMOTIONS</h3>
    <br />


    <asp:Repeater ID="r1" runat="server">

        <ItemTemplate>

    <div class="col-md-3 w3ls_w3l_banner_left">
						<div class="hover14 column">
						<div class="agile_top_brand_left_grid w3l_agile_top_brand_left_grid">
							<div class="agile_top_brand_left_grid_pos">
								<img src="images/offer.png" alt=" " class="img-responsive" />
							</div>
							<div class="agile_top_brand_left_grid1">
								<figure>
									<div class="snipcart-item block">
										<div class="snipcart-thumb">
											<a href="single.html"><img src="admin/<%#Eval("product_images") %>" height="140" width="140" /></a>
											<p><%#Eval("product_name") %></p>
											<h4>$<%#Eval("product_selling_price") %></h4>
										</div>
										<div class="snipcart-details">
											<form action="#" method="post">
												<fieldset>
													 <a href="view_more.aspx?id=<%#Eval("id") %>">
                                        <input type="button" name="btn" value="View More" class="button" /></a>

												</fieldset>
											</form>
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

