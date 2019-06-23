using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


public partial class update_order_details : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=F:\shoppingaspnet\App_Data\grocerrymarket.mdf;Integrated Security=True");
   // SqlConnection con = new SqlConnection(@"workstation id=grocerrymarket.mssql.somee.com;packet size=4096;user id=neo02_SQLLogin_1;pwd=pgr8or4buk;data source=grocerrymarket.mssql.somee.com;persist security info=False;initial catalog=grocerrymarket");
    string order_no;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(con.State==ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        if (Session["user"] == null)
        {
            Response.Redirect("login.aspx");
        }

        if (IsPostBack)
        {
            return;
        }

        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "select * from signup where email='" + Session["user"].ToString() + "'";
        cmd.ExecuteNonQuery();
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        foreach (DataRow dr in dt.Rows)
        {
            firstname.Text = dr["firstname"].ToString();
            lastname.Text = dr["lastname"].ToString();
            address.Text = dr["address"].ToString();
            city.Text = dr["city"].ToString();
            mobile.Text = dr["mobile"].ToString();
        }


    }

    protected void l1_Click(object sender, EventArgs e)
    {
        

        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "update signup set firstname='" + firstname.Text + "',lastname='" + lastname.Text + "',address='" + address.Text + "',city='" + city.Text + "' where email='" + Session["user"].ToString() + "'";
        cmd.ExecuteNonQuery();

        if (RadioButtonList1.SelectedItem.ToString() == "PayPal")
        {
            Response.Redirect("paypal.aspx");
        }
        else
        {
            order_no = Class1.GetRandomPassword(10).ToString();
            Session["order_no"] = order_no.ToString();
            Response.Redirect("payment_success.aspx?order=" + order_no.ToString());
        }

    }
}