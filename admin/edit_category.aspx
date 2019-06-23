<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="edit_category.aspx.cs" Inherits="admin_edit_category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="c1" Runat="Server">
     <div class="col-lg-6">


        <div class="card">
            <div class="form-row">
                <div class="form-group col-md-12">
                    <label for="categorytname" class="col-form-label">Category Name</label>
                    <asp:TextBox ID="t1" runat="server" CssClass="form-control" style="padding-left:10px; padding-right:10px;"></asp:TextBox>
                </div>

                <div class="form-group col-md-12">
                    <asp:Button ID="b1" runat="server" Text="Update Category" class="btn btn-primary default-btn-color form-control" style="padding-left:10px; padding-right:10px;" OnClick="b1_Click"  />
                </div>

            </div>
        </div>

    </div>
</asp:Content>

