<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="c1" Runat="Server">
    <div class="w3_login" style="margin-top:-100px;">
			<h3>Sign In</h3>

			<div class="w3_login_module">
				<div class="module form-module">
				    
				  <div class="form" style="display:block">
					<h2>Login to your account</h2>
					
                        <asp:TextBox ID="t1" runat="server" placeholder="Email"></asp:TextBox> 
					  <asp:TextBox ID="t2" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox> 
                        <asp:Button ID="b1" runat="server" Text="Login" OnClick="b1_Click" />
					<asp:Label ID="l1" runat="server" Text=""></asp:Label>
				  </div>
 				  <div class="cta" style="background-color:#fa1818;"><a href="register.aspx">Register </a></div>
				  
				</div>
			</div>
			
		</div>
</asp:Content>

