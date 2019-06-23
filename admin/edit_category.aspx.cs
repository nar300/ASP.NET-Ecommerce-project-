using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admin_edit_category : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\grocerrymarket.mdf;Integrated Security=True");
    int id;
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


        id = Convert.ToInt32(Request.QueryString["id"].ToString());
        Session["id"] = id.ToString();
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "select * from product_category where id=" + id + "";
        cmd.ExecuteNonQuery();
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        foreach(DataRow dr in dt.Rows)
        {
            t1.Text = dr["product_category"].ToString();
        }

      
    }

    protected void b1_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "update product_category set product_category='" + t1.Text + "' where id=" + Convert.ToInt32(Session["id"].ToString()) + "";
        cmd.ExecuteNonQuery();
        Response.Redirect("add_category.aspx");
    }
}