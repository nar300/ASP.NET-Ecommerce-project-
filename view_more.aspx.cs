using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class view_more : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=F:\shoppingaspnet\App_Data\grocerrymarket.mdf;Integrated Security=True");
   // SqlConnection con = new SqlConnection(@"workstation id=grocerrymarket.mssql.somee.com;packet size=4096;user id=neo02_SQLLogin_1;pwd=pgr8or4buk;data source=grocerrymarket.mssql.somee.com;persist security info=False;initial catalog=grocerrymarket");
    int id, qty = 0;
    string s;
    string t;
    string[] a = new string[6];
    int tot = 0;
    int ptotal = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();

        id = Convert.ToInt32(Request.QueryString["id"].ToString());
        Session["id"] = id.ToString();

        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "select * from products where id=" + id + "";
        cmd.ExecuteNonQuery();
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);

        foreach(DataRow dr in dt.Rows)
        {

            Session["manufacturing_date"] = dr["manufacturing_date"].ToString();
            Session["expiry_date"] = dr["expiry_date"].ToString();
            Session["warranty"] = dr["warranty"].ToString();

        }

        r1.DataSource = dt;
        r1.DataBind();




        SqlCommand cmd1 = con.CreateCommand();
        cmd1.CommandType = CommandType.Text;
        cmd1.CommandText = "select * from products where id=" + id + "";
        cmd1.ExecuteNonQuery();
        DataTable dt1 = new DataTable();
        SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
        da1.Fill(dt1);
        foreach (DataRow dr1 in dt1.Rows)
        {

            qty = Convert.ToInt32(dr1["product_qty"].ToString());
        }

        if (qty == 0)
        {
            b1.Enabled = false;
        }
        else
        {
            b1.Enabled = true;
        }


        /* for ratings */


        double average = 0;
        int tot = 0;
        SqlCommand cmd2 = con.CreateCommand();
        cmd2.CommandType = CommandType.Text;
        cmd2.CommandText = "select * from ratings where productid=" + id + "";
        cmd2.ExecuteNonQuery();
        DataTable dt2 = new DataTable();
        SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
        da2.Fill(dt2);
        foreach (DataRow dr2 in dt2.Rows)
        {
            tot = tot + 1;
            average = average + Convert.ToInt32(dr2["rating"].ToString());

        }

        if (tot == 0)
        {
            average = 0;
        }
        else
        {
            average = average / tot;
            average = Math.Round(average);
        }




        if (average == 0)
        {
            image1.ImageUrl = "star/star0.jpg";
        }
        else if (average == 1)
        {
            image1.ImageUrl = "star/star1.jpg";
        }
        else if (average == 2)
        {
            image1.ImageUrl = "star/star2.jpg";
        }
        else if (average == 3)
        {
            image1.ImageUrl = "star/star3.jpg";
        }
        else if (average == 4)
        {
            image1.ImageUrl = "star/star4.jpg";
        }
        else if (average == 5)
        {
            image1.ImageUrl = "star/star5.jpg";
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


        /* end here */


    }

    protected void r1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {

    }

    protected void b1_Click(object sender, EventArgs e)
    {

        int found_id = 0;
        int pt = 0;

        string productname = "", productdesc = "", productprice = "", productqty = "", productimages = "";

        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "select * from products where id=" + id + "";
        cmd.ExecuteNonQuery();
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        foreach (DataRow dr in dt.Rows)
        {
            productname = dr["product_name"].ToString();
            productdesc = dr["product_desc"].ToString();
            productprice = dr["product_selling_price"].ToString();
            productqty = dr["product_qty"].ToString();
            productimages = dr["product_images"].ToString();
        }


        if (Convert.ToInt32(qty1.Text) > Convert.ToInt32(productqty.ToString()))
        {
            error.Text = "only " + productqty.ToString() + " available";
        }
        else
        {

            error.Text = "";
            if (Request.Cookies["cookies"] == null)
            {
                Response.Cookies["cookies"].Value = productname.ToString() + "&" + productprice.ToString() + "&" + qty1.Text + "&" + productimages.ToString() + "&" + id.ToString();
                Response.Cookies["cookies"].Expires = DateTime.Now.AddDays(1);
            }
            else
            {

                //this is for if cart is not empty

                DataTable dt1 = new DataTable();
                dt1.Columns.AddRange(new DataColumn[7] { new DataColumn("productname"), new DataColumn("productprice"), new DataColumn("productqty"), new DataColumn("producttotal"), new DataColumn("productimages"), new DataColumn("id"), new DataColumn("cookieid") });

                DataTable dt2 = new DataTable();
                dt2.Columns.AddRange(new DataColumn[7] { new DataColumn("productname"), new DataColumn("productprice"), new DataColumn("productqty"), new DataColumn("producttotal"), new DataColumn("productimages"), new DataColumn("id"), new DataColumn("cookieid") });


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
                        ptotal = Convert.ToInt32(a[1].ToString()) * Convert.ToInt32(a[2].ToString());
                        dt1.Rows.Add(a[0].ToString(), a[1].ToString(), a[2].ToString(), ptotal.ToString(), a[3].ToString(), a[4].ToString(), i.ToString());

                        tot = tot + (Convert.ToInt32(a[1].ToString()) * Convert.ToInt32(a[2].ToString()));
                    }
                }

                Response.Cookies["cookies"].Expires = DateTime.Now.AddDays(-1);

                int found = 0;
                dt2.Rows.Clear();
                foreach (DataRow dr1 in dt1.Rows)
                {
                    pt=0;
                    if (dr1["id"].ToString() == id.ToString())
                    {
                        found = 1;
                        String oldqty = dr1["productqty"].ToString();
                        String newqty = Convert.ToString(Convert.ToInt32(dr1["productqty"].ToString()) + Convert.ToInt32(qty1.Text));

                        pt = Convert.ToInt32(dr1["productprice"].ToString()) * Convert.ToInt32(newqty.ToString());
                        dt2.Rows.Add(dr1["productname"].ToString(), dr1["productprice"].ToString(), newqty.ToString(), pt.ToString(), dr1["productimages"].ToString(), dr1["id"].ToString(), dr1["cookieid"].ToString());
                    }
                    else
                    {
                        Response.Write("hi");  
                        dt2.Rows.Add(dr1["productname"].ToString(), dr1["productprice"].ToString(), dr1["productqty"].ToString(), dr1["producttotal"].ToString(), dr1["productimages"].ToString(), dr1["id"].ToString(), dr1["cookieid"].ToString());
                    }

                }


                if(found==0)
                {
                    pt = Convert.ToInt32(productprice.ToString()) * Convert.ToInt32(qty1.Text);
                    dt2.Rows.Add(productname.ToString(), productprice.ToString(), qty1.Text, pt.ToString(), productimages.ToString(), id.ToString(),"");

                }


               

                int count = 0;
                foreach(DataRow dr2 in dt2.Rows)
                {

                    if(count==0)
                    {
                        Response.Cookies["cookies"].Value = dr2["productname"].ToString() + "&" + dr2["productprice"].ToString() + "&" + dr2["productqty"].ToString() + "&" + dr2["productimages"].ToString() + "&" + dr2["id"].ToString();
                        Response.Cookies["cookies"].Expires = DateTime.Now.AddDays(1);
                    }

                    else
                    {
                        Response.Write("hello");
                        Response.Cookies["cookies"].Value = Response.Cookies["cookies"].Value + "|" + dr2["productname"].ToString() + "&" + dr2["productprice"].ToString() + "&" + dr2["productqty"].ToString() + "&" + dr2["productimages"].ToString() + "&" + dr2["id"].ToString();
                        Response.Cookies["cookies"].Expires = DateTime.Now.AddDays(1);
                    }

                    count = count + 1;

                }
            }

        }


    }



    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Write("yess");
        if (Session["user"] == null)
        {
            Response.Write("<script>alert('please login to give comment');</script>");
        }
        else
        {
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "insert into comments values('" + Session["id"] + "','" + Session["user"].ToString() + "','" + TextBox1.Text + "')";
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('your comment added successfully'); window.location=window.location;</script>");
        }
    }

   
}
