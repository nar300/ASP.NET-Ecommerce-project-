using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class register : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=F:\shoppingaspnet\App_Data\grocerrymarket.mdf;Integrated Security=True");
   // SqlConnection con = new SqlConnection(@"workstation id=grocerrymarket.mssql.somee.com;packet size=4096;user id=neo02_SQLLogin_1;pwd=pgr8or4buk;data source=grocerrymarket.mssql.somee.com;persist security info=False;initial catalog=grocerrymarket");
    protected void Page_Load(object sender, EventArgs e)
    {
        if(con.State==ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();

    }

    protected void b1_Click(object sender, EventArgs e)
    {

        int count = 0;
        SqlCommand cmd1 = con.CreateCommand();
        cmd1.CommandType = CommandType.Text;
        cmd1.CommandText = "select * from signup where email='"+ t3.Text +"'";
        cmd1.ExecuteNonQuery();
        DataTable dt1 = new DataTable();
        SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
        da1.Fill(dt1);
        count = Convert.ToInt32(dt1.Rows.Count.ToString());


        if (count == 0)
        {
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "insert into signup values('" + t1.Text + "','" + t2.Text + "','" + t3.Text + "','" + t4.Text + "','" + t5.Text + "','" + t6.Text + "','" + t7.Text + "')";
            cmd.ExecuteNonQuery();

            l1.Text = "registration successfully";
            l1.ForeColor = System.Drawing.Color.Green;


            t1.Text = "";
            t2.Text = "";
            t3.Text = "";
            t4.Text = "";
            t5.Text = "";
            t6.Text = "";
            t7.Text = "";


        }
        else
        {
            l1.Text = "this email is already registered please choose again!!";
            l1.ForeColor = System.Drawing.Color.Red;
        }

    }
}