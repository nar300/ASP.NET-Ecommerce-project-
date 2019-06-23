using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class ajax_ratings : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\grocerrymarket.mdf;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        String id;
        String ratings;
        int count = 0;

        if(con.State==ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();

        id = Request.QueryString["id"].ToString();
        ratings = Request.QueryString["star"].ToString();

        SqlCommand cmd1 = con.CreateCommand();
        cmd1.CommandType = CommandType.Text;
        cmd1.CommandText = "select * from ratings where productid='"+id+"' and userid='"+Session["user"].ToString()+"'";
        cmd1.ExecuteNonQuery();
        DataTable dt1 = new DataTable();
        SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
        da1.Fill(dt1);
        count = Convert.ToInt32(dt1.Rows.Count.ToString());

        if(count>0)
        {
            Response.Write("you already give rating to this product");
        }
        else
        {
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "insert into ratings values('" + id.ToString() + "','" + Session["user"].ToString() + "','" + ratings.ToString() + "')";
            cmd.ExecuteNonQuery();
            Response.Write("Ratings Added successfully");
        }   
    }
}