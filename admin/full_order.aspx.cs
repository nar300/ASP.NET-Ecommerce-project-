using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admin_full_order : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=F:\shoppingaspnet\App_Data\grocerrymarket.mdf;Integrated Security=True");
    int id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
        {
            Response.Redirect("adminlogin.aspx");
        }



        id = Convert.ToInt32(Request.QueryString["id"].ToString());
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();


        SqlCommand cmd1 = con.CreateCommand();
        cmd1.CommandType = CommandType.Text;
        cmd1.CommandText = "select * from orders where id=" + id + "";
        cmd1.ExecuteNonQuery();
        DataTable dt1 = new DataTable();
        SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
        da1.Fill(dt1);
        foreach(DataRow dr1 in dt1.Rows)
        {
            firstname.Text = dr1["firstname"].ToString();
            lastname.Text = dr1["lastname"].ToString();
            email.Text = dr1["email"].ToString();
            address.Text = dr1["address"].ToString();
            city.Text = dr1["city"].ToString();
            mobile.Text = dr1["mobile"].ToString();
            orderstatus.Text = dr1["orderstatus"].ToString();

        }


       int count = 0;


        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "select * from order_details where order_id='"+ id.ToString() +"'";
        cmd.ExecuteNonQuery();
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        foreach(DataRow dr in dt.Rows)
        {
            count = count + Convert.ToInt32(dr["product_gtotal"].ToString());
        }
        r1.DataSource = dt;
        r1.DataBind();


        totalamount.Text="Total Amount=" + count.ToString(); 


    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "update orders set orderstatus='"+ DropDownList1.SelectedItem.ToString() +"' where id='" + id.ToString() + "'";
        cmd.ExecuteNonQuery();

        Response.Redirect("full_order.aspx?id=" + id.ToString());
    }
}