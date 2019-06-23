using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class payment_success : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=F:\shoppingaspnet\App_Data\grocerrymarket.mdf;Integrated Security=True");
   // SqlConnection con = new SqlConnection(@"workstation id=grocerrymarket.mssql.somee.com;packet size=4096;user id=neo02_SQLLogin_1;pwd=pgr8or4buk;data source=grocerrymarket.mssql.somee.com;persist security info=False;initial catalog=grocerrymarket");
    string order = "";
    string order_id;
    string s;
    string t;
    string[] a = new string[6];

    protected void Page_Load(object sender, EventArgs e)
    {

        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();


        order = Request.QueryString["order"].ToString();

        if (order == Session["order_no"].ToString())
        {

            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from signup where email='" + Session["user"].ToString() + "'";
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            foreach (DataRow dr in dt.Rows)
            {
                SqlCommand cmd1 = con.CreateCommand();
                cmd1.CommandType = CommandType.Text;
                cmd1.CommandText = "insert into orders values('" + dr["firstname"].ToString() + "','" + dr["lastname"].ToString() + "','" + dr["email"].ToString() + "','" + dr["address"].ToString() + "','" + dr["city"].ToString() + "','" + dr["mobile"].ToString() + "','"+ DateTime.Now.ToString("dd-MM-yyyy") +"','open')";
                cmd1.ExecuteNonQuery();
            }


            SqlCommand cmd2 = con.CreateCommand();
            cmd2.CommandType = CommandType.Text;
            cmd2.CommandText = "select top 1 * from orders where email='" + Session["user"].ToString() + "' order by id desc ";
            cmd2.ExecuteNonQuery();
            DataTable dt2 = new DataTable();
            SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
            da2.Fill(dt2);
            foreach (DataRow dr2 in dt2.Rows)
            {
                order_id = dr2["id"].ToString();
            }


            if (Request.Cookies["cookies"] != null)
            {
                s = Convert.ToString(Request.Cookies["cookies"].Value);
                string[] strArr = s.Split('|');
                for (int i = 0; i < strArr.Length; i++)
                {
                    t = Convert.ToString(strArr[i].ToString());
                    string[] strArr1 = t.Split('&');
                    for (int j = 0; j < strArr1.Length; j++)
                    {

                        a[j] = strArr1[j].ToString();

                    }



                    SqlCommand cmd1 = con.CreateCommand();
                    cmd1.CommandType = CommandType.Text;
                    cmd1.CommandText = "update products set product_qty=product_qty-" + a[2].ToString() + " where id=" + a[4].ToString();
                    cmd1.ExecuteNonQuery();

                    int gtotal = 0;
                    gtotal = Convert.ToInt32(a[1].ToString()) * Convert.ToInt32(a[2].ToString());

                    SqlCommand cmd3 = con.CreateCommand();
                    cmd3.CommandType = CommandType.Text;
                    cmd3.CommandText = "insert into order_details values('" + order_id.ToString() + "','" + a[0].ToString() + "','" + a[1].ToString() + "','" + a[2].ToString() + "','"+ gtotal.ToString() +"','" + a[3].ToString() + "')";
                    cmd3.ExecuteNonQuery();

                }

            }

        }
        else
        {
            Response.Redirect("login.aspx");
        }



        Session["user"] = null;
        Session["checkoutbutton"] = null;
        Session["deliverydate"] = null;
        Session["deliverytime"] = null;

        Response.Cookies["cookies"].Expires = DateTime.Now.AddDays(-1);
        Response.Cookies["cookies"].Expires = DateTime.Now.AddDays(-1);

        Response.Write("<script> alert('you will get your order soon'); window.location='products.aspx'; </script> ");

    }
}