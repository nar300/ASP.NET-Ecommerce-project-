<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="add_product.aspx.cs" Inherits="admin_add_product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="Server">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="multiimageupload/script.js"></script>

    <!-------Including CSS File------>
    <link rel="stylesheet" type="text/css" href="multiimageupload/style.css">

    <script type="text/javascript" src="jscripts/tiny_mce/tiny_mce.js"></script>
    <script type="text/javascript">
        tinyMCE.init({
            // General options
            mode: "MultiLine",
            theme: "advanced",
            plugins: "autolink,lists,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,wordcount,advlist,autosave",

            // Theme options
            theme_advanced_buttons1: "save,newdocument,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,styleselect,formatselect,fontselect,fontsizeselect",
            theme_advanced_buttons2: "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,|,insertdate,inserttime,preview,|,forecolor,backcolor",
            theme_advanced_buttons3: "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,print,|,ltr,rtl,|,fullscreen",
            theme_advanced_buttons4: "insertlayer,moveforward,movebackward,absolute,|,styleprops,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,pagebreak,restoredraft",
            theme_advanced_toolbar_location: "top",
            theme_advanced_toolbar_align: "left",
            theme_advanced_statusbar_location: "bottom",
            theme_advanced_resizing: true,

            // Example content CSS (should be your site CSS)
            content_css: "css/content.css",

            // Drop lists for link/image/media/template dialogs
            template_external_list_url: "lists/template_list.js",
            external_link_list_url: "lists/link_list.js",
            external_image_list_url: "lists/image_list.js",
            media_external_list_url: "lists/media_list.js",

            // Style formats
            style_formats: [
                { title: 'Bold text', inline: 'b' },
                { title: 'Red text', inline: 'span', styles: { color: '#ff0000' } },
                { title: 'Red header', block: 'h1', styles: { color: '#ff0000' } },
                { title: 'Example 1', inline: 'span', classes: 'example1' },
                { title: 'Example 2', inline: 'span', classes: 'example2' },
                { title: 'Table styles' },
                { title: 'Table row 1', selector: 'tr', classes: 'tablerow1' }
            ],

            // Replace values for the template plugin
            template_replace_values: {
                username: "Some User",
                staffid: "991234"
            }
        });
    </script>


    <div class="col-12">

        <b>If you are going to insert food product then keep empty warranty and if you going to enter electronics product then keep empty manufacturing date and expiry date</b>
        <br />


        <div class="card" style="padding: 10px; margin-top:15px;">

            <div class="form-row">

                <div class="form-group col-md-10">
                    <label for="productname" class="col-form-label">Product Name</label>
                    <asp:TextBox ID="productname" runat="server" class="form-control" placeholder="Product Name"></asp:TextBox>
                </div>

                <div class="form-group col-md-10">
                    <label for="productname" class="col-form-label">Product Description</label>
                    <asp:TextBox ID="productdesc" runat="server" class="form-control" placeholder="Product Desc" TextMode="MultiLine"></asp:TextBox>
                </div>

                <div class="form-group col-md-10">
                    <label for="productname" class="col-form-label">Product Original Price</label>
                    <asp:TextBox ID="productoriginalprice" runat="server" class="form-control" placeholder="Product Original Price"></asp:TextBox>
                </div>

                <div class="form-group col-md-10">
                    <label for="productname" class="col-form-label">Product Selling Price</label>
                    <asp:TextBox ID="productsellingprice" runat="server" class="form-control" placeholder="Product Selling Price"></asp:TextBox>
                </div>

                <div class="form-group col-md-10">
                    <label for="productname" class="col-form-label">Product Qty</label>
                    <asp:TextBox ID="productqty" runat="server" class="form-control" placeholder="Product Qty"></asp:TextBox>
                </div>

                <div class="form-group col-md-10">
                    <label for="productname" class="col-form-label">Product Image</label>
                    <asp:FileUpload ID="productimage" runat="server" CssClass="form-control" />
                </div>

                <div class="form-group col-md-10">
                    <label for="productname" class="col-form-label">Product Category</label>
                    <asp:DropDownList ID="productcategory" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>

                <div class="form-group col-md-10">
                    <label for="productname" class="col-form-label">Product Manufacturing Date</label>
                    <asp:TextBox ID="productmanufacturingdate" runat="server" class="form-control" placeholder="Product Manufacturing Date" TextMode="Date"></asp:TextBox>
                </div>

                <div class="form-group col-md-10">
                    <label for="productname" class="col-form-label">Product Expiry Date</label>
                    <asp:TextBox ID="productexpirydate" runat="server" class="form-control" placeholder="Product Expiry Date" TextMode="Date"></asp:TextBox>
                </div>

                <div class="form-group col-md-10">
                    <label for="productname" class="col-form-label">Product Warranty</label>
                    <asp:TextBox ID="productwarranty" runat="server" class="form-control" placeholder="Product Warranty"></asp:TextBox>
                </div>

                <div class="form-group col-md-10">
                    <label for="productname" class="col-form-label">Product Promotion</label>
                    <asp:CheckBox ID="c1" runat="server" class="form-control" />
                </div>


                <div class="form-group col-md-10">
                    <asp:Button ID="b1" runat="server" Text="Insert Product" class="btn btn-primary default-btn-color" OnClick="b1_Click" />
                </div>

            </div>

        </div>
    </div>
</asp:Content>

