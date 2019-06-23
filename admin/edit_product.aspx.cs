using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admin_edit_product : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\grocerrymarket.mdf;Integrated Security=True");
    int id;
    string promotion = "no";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
        {
            Response.Redirect("adminlogin.aspx");
        }


        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();

        id = Convert.ToInt32(Request.QueryString["id"].ToString());
        Session["id"] = id.ToString();


        if (IsPostBack) return;


        productcategory.Items.Clear();
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "select * from product_category";
        cmd.ExecuteNonQuery();
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        foreach (DataRow dr in dt.Rows)
        {
            productcategory.Items.Add(dr["product_category"].ToString());
        }


        SqlCommand cmd1 = con.CreateCommand();
        cmd1.CommandType = CommandType.Text;
        cmd1.CommandText = "select * from products where id="+ id +"";
        cmd1.ExecuteNonQuery();
        DataTable dt1 = new DataTable();
        SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
        da1.Fill(dt1);
        foreach (DataRow dr1 in dt1.Rows)
        {
            productname.Text=dr1["product_name"].ToString();
            productdesc.Text=dr1["product_desc"].ToString();
            productoriginalprice.Text=dr1["product_price_original"].ToString();
            productsellingprice.Text= dr1["product_selling_price"].ToString();
            productqty.Text=dr1["product_qty"].ToString();
            productcategory.Items.FindByValue(dr1["product_category"].ToString()).Selected = true;
            productmanufacturingdate.Text=dr1["manufacturing_date"].ToString();
            productexpirydate.Text=dr1["expiry_date"].ToString();
            productwarranty.Text = dr1["warranty"].ToString();
            i1.ImageUrl = dr1["product_images"].ToString();
            promotion = dr1["is_promotion"].ToString();
        }



        if(promotion=="yes")
        {
            c1.Checked = true;
        }
        else
        {
            c1.Checked = false;
        }

        SqlCommand cmd11 = con.CreateCommand();
        cmd11.CommandType = CommandType.Text;
        cmd11.CommandText = "select * from comments where productid='" + Session["id"].ToString() + "' order by id desc";
        cmd11.ExecuteNonQuery();
        DataTable dt11 = new DataTable();
        SqlDataAdapter da11 = new SqlDataAdapter(cmd11);
        da11.Fill(dt11);
        d11.DataSource = dt11;
        d11.DataBind();


    }

    protected void b1_Click(object sender, EventArgs e)
    {
        if (c1.Checked)
        {
            promotion = "yes";
        }
        else
        {
            promotion = "no";
        }

        if (productimage.FileName=="")
        {
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "update products set product_name='" + productname.Text + "',product_desc='" + productdesc.Text + "',product_price_original='" + productoriginalprice.Text + "',product_selling_price='" + productsellingprice.Text + "',product_qty='" + productqty.Text + "',product_category='" + productcategory.SelectedItem.ToString() + "',manufacturing_date='" + productmanufacturingdate.Text + "',expiry_date='" + productexpirydate.Text + "',warranty='" + productwarranty.Text + "',is_promotion='"+ promotion.ToString() +"' where id=" + Convert.ToInt32(Session["id"].ToString()) + "";
            cmd.ExecuteNonQuery();
        }
        else
        {
            productimage.SaveAs(Request.PhysicalApplicationPath + "/admin/product_images/" + productimage.FileName.ToString());
            String path = "product_images/" + productimage.FileName.ToString();

            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "update products set product_name='"+ productname.Text + "',product_desc='"+ productdesc.Text + "',product_price_original='"+ productoriginalprice.Text + "',product_selling_price='"+ productsellingprice.Text + "',product_qty='"+ productqty.Text + "',product_images='"+ path.ToString() + "',product_category='"+ productcategory.SelectedItem.ToString() + "',manufacturing_date='"+ productmanufacturingdate.Text + "',expiry_date='"+ productexpirydate.Text + "',warranty='"+ productwarranty.Text + "',is_promotion='" + promotion.ToString() + "' where id=" + Convert.ToInt32(Session["id"].ToString()) + "";
            cmd.ExecuteNonQuery();
        }
        Response.Redirect("display_product.aspx");

    }
}