<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="update_order_details.aspx.cs" Inherits="update_order_details" %>


<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="Server">
    <div class="w3_login">
        <h3>Shipping Details</h3>
        <br />
        <!---728x90--->

        <div class="w3_login_module">
            <div class="form-group">


                <div class="form-group" style="display: block">


                    <asp:TextBox ID="firstname" runat="server" placeholder="First Name" class="form-control"></asp:TextBox>
                    <asp:TextBox ID="lastname" runat="server" placeholder="Last Name" class="form-control" Style="margin-top: 15px"></asp:TextBox>

                    <asp:TextBox ID="address" runat="server" placeholder="Address" TextMode="MultiLine" Style="width: 100%; margin-top: 15px" class="form-control"></asp:TextBox>
                    <asp:TextBox ID="city" runat="server" placeholder="City" Style="margin-top: 15px" class="form-control"></asp:TextBox>
                    <asp:TextBox ID="mobile" runat="server" placeholder="Mobile" class="form-control" Style="margin-top: 15px"></asp:TextBox>
                    <br />
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" Style="font-size: 16px; color: black;">
                        <asp:ListItem Selected style="margin-right:10px">PayPal</asp:ListItem>
                        <asp:ListItem>COD</asp:ListItem>
                    </asp:RadioButtonList><br />
                    <asp:Button ID="l1" runat="server" Text="Update & Continue" class="btn btn-success col-lg-12" OnClick="l1_Click"></asp:Button>


                </div>

            </div>
        </div>

    </div>
</asp:Content>

