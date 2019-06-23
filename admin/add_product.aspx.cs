using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admin_add_product : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\grocerrymarket.mdf;Integrated Security=True");
    String promotion="no";
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

        if (IsPostBack) return;

        productcategory.Items.Clear();

        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "select * from product_category";
        cmd.ExecuteNonQuery();
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        foreach(DataRow dr in dt.Rows)
        {
            productcategory.Items.Add(dr["product_category"].ToString());

        }

    }

    protected void b1_Click(object sender, EventArgs e)
    {
        if(c1.Checked)
        {
            promotion = "yes";
        }
        else
        {
            promotion = "no";
        }

        productimage.SaveAs(Request.PhysicalApplicationPath + "/admin/product_images/" + productimage.FileName.ToString());
        String path = "product_images/" + productimage.FileName.ToString();

        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "insert into products values('"+ productname.Text +"','"+ productdesc.Text +"','"+ productoriginalprice.Text +"','"+ productsellingprice.Text +"','"+ productqty.Text +"','"+ path.ToString()+"','"+ productcategory.SelectedItem.ToString() +"','"+ productmanufacturingdate.Text + "','"+ productexpirydate.Text +"','"+  productwarranty.Text +"','"+ promotion.ToString() + "')";
        cmd.ExecuteNonQuery();
    }
}