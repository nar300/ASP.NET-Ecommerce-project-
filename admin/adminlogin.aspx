<%@ Page Language="C#" AutoEventWireup="true" CodeFile="adminlogin.aspx.cs" Inherits="admin_adminlogin" %>

<!DOCTYPE html>
<html lang="en-US">

<!-- Mirrored from html.alfisahr.com/prudence/page_login.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 10 Nov 2017 09:22:08 GMT -->
<head>
    <title>Login Form</title>
    <meta charset="utf-8">
    <meta content="IE=edge" http-equiv="x-ua-compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="yes" name="apple-touch-fullscreen">

    <link rel="stylesheet" type="text/css" href="assets/bootstrap/css/bootstrap.min.css">

    <link rel="stylesheet" type="text/css" href="assets/plugins/themify/themify-icons.css">

    <link rel="stylesheet" type="text/css" href="assets/css/style00e0.css">


</head>

<body>
<div id="page-container2">
    <div class="page-helper">
        <div class="form-container">
            <div class="logo mb-4" style="margin-top: -200px; ">

                <p style="font-size:30px;">Grocery Admin</p>
            </div>

            <form id="f1" runat="server">
                <div class="login-box">
                    <div class="form-group">
                        <label for="email">Username</label>
                        
                        <asp:TextBox ID="username" runat="server" class="form-control" placeholder="Username"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <asp:TextBox ID="password" runat="server" class="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                    </div>
                   
                    <asp:Button ID="b1" runat="server" Text="Sign In" CssClass="btn btn-block btn-alt-primary" OnClick="b1_Click" />
                    <br>

                  
                </div>

        </div>
        </form>
    </div>
</div>


</body>

<!-- Mirrored from html.alfisahr.com/prudence/page_login.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 10 Nov 2017 09:22:08 GMT -->
</html>