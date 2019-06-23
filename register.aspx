<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="c1" Runat="Server">
     <div class="w3_login" style="margin-top:-100px;">
			<h3>Sign Up</h3>
<!---728x90--->

			<div class="w3_login_module">
				<div class="module form-module">
				    
				 
				  <div class="form" style="display:block">
					<h2>Create an account</h2>
					
                        <asp:TextBox ID="t1" runat="server" placeholder="First Name"></asp:TextBox> 
                      <asp:RequiredFieldValidator ID="r1" runat="server" ControlToValidate="t1" ErrorMessage="please enter value in firstname" ForeColor="red" style="margin-top:-10px"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="t2" runat="server" placeholder="Last Name"></asp:TextBox> 
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="t2" ErrorMessage="please enter value in lastname" ForeColor="red"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="t3" runat="server" placeholder="Email"></asp:TextBox> 
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="t3" ErrorMessage="please enter value in email" ForeColor="red"></asp:RequiredFieldValidator>
					  <asp:TextBox ID="t4" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox> 
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="t4" ErrorMessage="please enter value in password" ForeColor="red"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="t5" runat="server" placeholder="Address" TextMode="MultiLine" style="width:100%"></asp:TextBox> 
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="t5" ErrorMessage="please enter value in address" ForeColor="red"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="t6" runat="server" placeholder="City" style="margin-top:15px"></asp:TextBox> 
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="t6" ErrorMessage="please enter value in city" ForeColor="red"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="t7" runat="server" placeholder="Mobile"></asp:TextBox> 
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="t7" ErrorMessage="please enter value in mobile mo" ForeColor="red"></asp:RequiredFieldValidator>
                     
                        <asp:Button ID="b1" runat="server" Text="Register" OnClick="b1_Click" />
                      <center>
                      <asp:Label ID="l1" runat="server" Text=""></asp:Label>
					</center>
				  </div>
				  
				</div>
			</div>
			
		</div>
</asp:Content>

