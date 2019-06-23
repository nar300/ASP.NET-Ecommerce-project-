using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


public partial class update_cart : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=F:\shoppingaspnet\App_Data\grocerrymarket.mdf;Integrated Security=True");
   // SqlConnection con = new SqlConnection(@"workstation id=grocerrymarket.mssql.somee.com;packet size=4096;user id=neo02_SQLLogin_1;pwd=pgr8or4buk;data source=grocerrymarket.mssql.somee.com;persist security info=False;initial catalog=grocerrymarket");
    int id, qty = 0,newqtyy=0;
    string s;
    string t;
    string[] a = new string[6];
    int tot = 0;
    int ptotal = 0;
    protected void Page_Load(object sender, EventArgs e)
    {

        if(con.State==ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();

        id = Convert.ToInt32(Request.QueryString["id"].ToString());
        newqtyy = Convert.ToInt32(Request.QueryString["textvalue"].ToString());

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


        if (Convert.ToInt32(newqtyy.ToString()) > Convert.ToInt32(productqty.ToString()))
        {
            Response.Write("<script>alert('please enter less qty');</script>");
        }
        else
        {


            if (Request.Cookies["cookies"] == null)
            {
                Response.Cookies["cookies"].Value = productname.ToString() + "&" + productprice.ToString() + "&" + newqtyy.ToString() + "&" + productimages.ToString() + "&" + id.ToString();
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
                    pt = 0;
                    if (dr1["id"].ToString() == id.ToString())
                    {
                        found = 1;
                        String oldqty = dr1["productqty"].ToString();
                        String newqty = Convert.ToString(Convert.ToInt32(newqtyy.ToString()));

                        pt = Convert.ToInt32(dr1["productprice"].ToString()) * Convert.ToInt32(newqty.ToString());
                        dt2.Rows.Add(dr1["productname"].ToString(), dr1["productprice"].ToString(), newqty.ToString(), pt.ToString(), dr1["productimages"].ToString(), dr1["id"].ToString(), dr1["cookieid"].ToString());
                    }
                    else
                    {
                        Response.Write("hi");
                        dt2.Rows.Add(dr1["productname"].ToString(), dr1["productprice"].ToString(), dr1["productqty"].ToString(), dr1["producttotal"].ToString(), dr1["productimages"].ToString(), dr1["id"].ToString(), dr1["cookieid"].ToString());
                    }

                }


                if (found == 0)
                {
                    pt = Convert.ToInt32(productprice.ToString()) * Convert.ToInt32(newqtyy.ToString());
                    dt2.Rows.Add(productname.ToString(), productprice.ToString(), newqtyy.ToString(), pt.ToString(), productimages.ToString(), id.ToString(), "");

                }




                int count = 0;
                foreach (DataRow dr2 in dt2.Rows)
                {

                    if (count == 0)
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

        Response.Redirect("view_cart.aspx");
    }
}