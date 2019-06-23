<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="view_cart.aspx.cs" Inherits="view_cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="Server">
    <style>
        .table > tbody > tr > td, .table > tfoot > tr > td {
            vertical-align: middle;
        }

        @media screen and (max-width: 600px) {
            table#cart tbody td .form-control {
                width: 20%;
                display: inline !important;
            }

            .actions .btn {
                width: 36%;
                margin: 1.5em 0;
            }

            .actions .btn-info {
                float: left;
            }

            .actions .btn-danger {
                float: right;
            }

            table#cart thead {
                display: none;
            }

            table#cart tbody td {
                display: block;
                padding: .6rem;
                min-width: 320px;
            }

            table#cart tbody tr td:first-child {
                background: #333;
                color: #fff;
            }

            table#cart tbody td:before {
                content: attr(data-th);
                font-weight: bold;
                display: inline-block;
                width: 8rem;
            }

            table#cart tfoot td {
                display: block;
            }

                table#cart tfoot td .btn {
                    display: block;
                }
        }
    </style>



    <div class="container" style="min-height: 100px; max-width: 1000px; border-style: solid; border-width: 1px; padding-bottom: 10px">
        <h3>Shopping Cart</h3>
        <hr>
        <div class="row">

          
            <div class="col-lg-2 col-md-2 col-sm-2  hidden-xs" style="min-height: 10px;">
                <strong>Product Image</strong>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-2 hidden-xs" style="min-height: 10px;">
                <strong>Product Title</strong>
            </div>
            <div class="col-lg-1 col-md-1 col-sm-1 hidden-xs" style="min-height: 10px;"><strong>Price</strong></div>
            <div class="col-lg-2 col-md-2 col-sm-3 hidden-xs" style="min-height: 10px;"><strong>Quantity</strong></div>
            <div class="col-lg-1 col-md-1 col-sm-1 hidden-xs" style="min-height: 10px;"><strong>Subtotal</strong></div>
            <div class="col-lg-2 col-md-2 col-sm-2 hidden-xs" style="min-height: 10px;"></div>


        </div>


        
        <asp:Repeater ID="r1" runat="server">

            <ItemTemplate>
                 <div class="row">

            <div class="col-lg-2 col-md-2 col-sm-2" style="">
                <img src="admin/<%#Eval("productimages") %>" alt="..."
                    class="img-responsive" />
            </div>
            <div class="col-lg-4 col-md-4 col-sm-2" style="">
                <h4
                    class="nomargin"><%#Eval("productname") %></h4>
            </div>
            <div class="col-lg-1 col-md-1 col-sm-1" style="">
                <%#Eval("productprice") %> $
            </div>
            <div class="col-lg-2 col-md-2 col-sm-3" style="">
                <input id="text<%#Eval("id")%>"
                    type="number"
                    class="form-control text-center"
                    value="<%#Eval("productqty") %>" min="1">
            </div>
            <div class="col-lg-1 col-md-2 col-sm-1" style=""><%#Eval("producttotal") %>$</div>
            <div class="col-lg-2 col-md-2 col-sm-2" style="">
                <button type="button" 
                    class="btn btn-info btn-sm" onclick="update_cart(<%#Eval("id")%>)">

                    <i
                        class="fa fa-refresh"></i>


                </button>
                <button type="button" class="btn btn-danger btn-sm" onclick="window.location='delete_cart.aspx?id=<%#Eval("id") %>'">
                    <i
                        class="fa fa-trash-o"></i>
                </button>
            </div>


        </div>
            </ItemTemplate>

        </asp:Repeater>

        
       


        <hr>
        <div class="row">

            <div class="col-lg-7 col-md-7 col-sm-8 " style="">
                <a href="products.aspx" class="btn btn-warning"><i
                    class="fa fa-angle-left"></i>Continue Shopping</a>
            </div>


            <div class="col-lg-1 col-md-1 col-sm-2 col-xs-2 col-lg-push-1 " style=""><strong>
                <h4>Total</h4>
            </strong></div>
            <div class="col-lg-2 col-md-2 col-sm-1 col-xs-5 col-lg-push-1" style="">
                <h4><asp:Label ID="total" runat="server" Text="0"></asp:Label>
                        $</h4>
            </div>
            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
                <asp:Button ID="bb1" runat="server" Text="Checkout" class="btn btn-info" OnClick="bb1_Click"  />
            </div>

        </div>




    </div>

    <script type="text/javascript">
        function update_cart(id)
        {
            var tid = 'text' + id;
            var textvalue = document.getElementById(tid).value;
            window.location = 'update_cart.aspx?id='+id + '&textvalue=' + textvalue;
        }
    </script>


</asp:Content>

