<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="view_more.aspx.cs" Inherits="view_more" %>

<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="Server">

    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
       <link rel="stylesheet" type="text/css" href="style.css">
    <asp:Repeater ID="r1" runat="server" OnItemCommand="r1_ItemCommand">
        <ItemTemplate>


            <h2><%#Eval("product_name") %></h2>
            <br />
            <div class="col-md-4 agileinfo_single_left">
                <img id="example" src="admin/<%#Eval("product_images") %>" alt="" height="320" width="320" class="img-responsive" />
            </div>
            <div class="col-md-8 agileinfo_single_right">
               
                <div class="w3agile_description" style="margin-top:0px;">
                    <h4>Description :</h4>
                    <p><%#Eval("product_desc") %></p>
                </div>


                <div class="row" style="padding-left: 12px">
                    <div class="col-lg-6" style="margin: 0px; padding: 0px;">

                        <div class="w3agile_description" style="margin: 0px; padding: 0px;">
                            <h4>Available Qty</h4>
                            <p><%#Eval("product_qty") %></p>
                        </div>

                    </div>

                    <div class="col-lg-6" style="margin: 0px; padding: 0px;">

                        <div class="w3agile_description" style="margin: 0px; padding: 0px;">
                            <h4>Price</h4>
                            <p>$<%#Eval("product_selling_price") %></p>
                        </div>

                    </div>

                </div>


            <div class="snipcart-item block">


                <%
                    if (Session["manufacturing_date"] != "")
                    {
                     %>


                <div class="row" style="padding-left: 12px">

                    <div class="col-lg-6" style="margin: 0px; padding: 0px;">

                        <div class="w3agile_description">
                            <h4>Manufacturing Date</h4>
                            <p><%#Eval("manufacturing_date") %></p>
                        </div>
                    </div>

                    <div class="col-lg-6" style="margin: 0px; padding: 0px;">
                        <div class="w3agile_description">
                            <h4>Expiry Date</h4>
                            <p><%#Eval("expiry_date") %></p>
                        </div>
                    </div>
                </div>

                <%
                    }
                     %>


                <%
    if (Session["warranty"] != "")
    {
                     %>



                <div class="w3agile_description" style="margin: 0px; padding: 0px;">
                    <h4>Warranty</h4>
                    <p><%#Eval("warranty") %> Months</p>
                </div>

                <%

    }
                     %>

        </ItemTemplate>
    </asp:Repeater>


    <div class="w3agile_description col-md-4" style="margin: 0px; padding: 0px; margin-bottom: 10px; margin-top: 20px;">
        <h4>Enter Qty</h4>
        <p>
            <asp:TextBox ID="qty1" runat="server" CssClass="form-control" ValidationGroup="aa"> </asp:TextBox>
            <asp:RequiredFieldValidator ID="rr1" runat="server" ErrorMessage="Please Enter Value" ControlToValidate="qty1" ForeColor="#FF3300" Display="Dynamic" ValidationGroup="aa"></asp:RequiredFieldValidator>
            <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Enter Value Between 1 to 100 only" ControlToValidate="qty1" ForeColor="#FF3300" MaximumValue="100" MinimumValue="1" Display="Dynamic" Type="Integer" ValidationGroup="aa"></asp:RangeValidator>
        </p>
    </div>


    <div class="snipcart-details agileinfo_single_right_details">
        <asp:Button ID="b1" runat="server" Text="Add to cart" CssClass="button" OnClick="b1_Click" ValidationGroup="aa" />
        <asp:Label ID="error" runat="server" ForeColor="Red" Text=""></asp:Label>
    </div>
    </div>
            </div>
            <div class="clearfix"></div>



    <!-- new starts from here -->


      <!-- this is for ratings-->
        <div class="container" style="min-height: 100px; text-align: center; background-color: white; margin-top: 20px">
            
                    <center>
                    <asp:Image runat="server" id="image1" runat="server" Height="50" Width="220"></asp:Image>
                 </center>       


            <h1>Give Rating</h1>

            <%
                if (Session["user"] == null)
                {

            %>
            <div id="star-container">
                <i class="fa fa-star fa-3x star" id="star-1" name="1" onclick="alert('please login to give ratings');"></i>
                <i class="fa fa-star fa-3x star" id="star-2" name="2" onclick="alert('please login to give ratings');"></i>
                <i class="fa fa-star fa-3x star" id="star-3" name="3" onclick="alert('please login to give ratings');"></i>
                <i class="fa fa-star fa-3x star" id="star-4" name="4" onclick="alert('please login to give ratings');"></i>
                <i class="fa fa-star fa-3x star" id="star-5" name="5" onclick="alert('please login to give ratings');"></i>
            </div>
            <%

                }
                else
                {

            %>
            <div id="star-container">
                <i class="fa fa-star fa-3x star" id="star-1" name="1" onclick="check_star(1,<% Response.Write(Request.QueryString["id"].ToString()); %>)"></i>
                <i class="fa fa-star fa-3x star" id="star-2" name="2" onclick="check_star(2,<% Response.Write(Request.QueryString["id"].ToString()); %>)"></i>
                <i class="fa fa-star fa-3x star" id="star-3" name="3" onclick="check_star(3,<% Response.Write(Request.QueryString["id"].ToString()); %>)"></i>
                <i class="fa fa-star fa-3x star" id="star-4" name="4" onclick="check_star(4,<% Response.Write(Request.QueryString["id"].ToString()); %>)"></i>
                <i class="fa fa-star fa-3x star" id="star-5" name="5" onclick="check_star(5,<% Response.Write(Request.QueryString["id"].ToString()); %>)"></i>
            </div>
            <%

                }

            %>


            <div id="result"></div>

            <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
            <script type="text/javascript" src="main.js"></script>
            <script type="text/javascript">
                function check_star(a, b) {

                    var xmlhttp = new XMLHttpRequest();
                    xmlhttp.onreadystatechange = function () {
                        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                            alert(xmlhttp.responseText);
                            window.location.href = window.location.href;
                        }
                    };
                    xmlhttp.open("GET", "ajax/ratings.aspx?star=" + a + "&id=" + b, true);
                    xmlhttp.send();


                }
            </script>


        </div>

        <!-- end here ratings-->



        <!-- this is for comment -->

      
        <div  class="container" style="min-height: 100px;text-align: center; background-color: white; margin-top: 2px;">

            <br />
            <center>
                             
                            <table>

                                <tr>
                                    <td>Enter Comment</td>
                                    <td>
                                        <asp:TextBox ID="TextBox1" runat="server" class="form-control"></asp:TextBox> 
                                    </td>
                                    <td>
                                        <asp:Button ID="Button1" runat="server" class="btn btn-success" Text="Save" OnClick="Button1_Click"  />

                                    </td>
                                </tr>

                            </table>
                                </center>


        </div>


        <!-- end here comment -->

            <!-- display comments -->

            <div class="container" style="min-height: 100px; text-align: center; background-color: white; margin-top: -18px; ">
                <h1>User Comments</h1>
                
                <asp:DataList ID="d11" runat="server" Width="100%">
                    <ItemTemplate>
                        <div style="min-width:100%; text-align:left; padding-left:5px; ">
                        <b style="color:blue"><%# Eval("userid") %></b> <br />
                        <%#Eval("comments") %>
                        <hr style="width:100%" />
                         </div>
                    </ItemTemplate>


                </asp:DataList>
                

            </div>

            <!-- end here comments -->





    </div>

     <!-- new ends from here -->

        <br /><br />


</asp:Content>

