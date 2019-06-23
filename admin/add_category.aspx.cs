using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admin_add_category : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\grocerrymarket.mdf;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {

        if(Session["admin"]==null)
        {
            Response.Redirect("adminlogin.aspx");
        }


        if(con.State==ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();



        load_category();

    }

    protected void b1_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "insert into product_category values('" + t1.Text + "')";
        cmd.ExecuteNonQuery();
        load_category();
        Response.Write("<script>alert('product category added successfully'); </script>");
    }

    public void load_category()
    {
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "select * from product_category";
        cmd.ExecuteNonQuery();
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        dd1.DataSource = dt;
        dd1.DataBind();
    }
}