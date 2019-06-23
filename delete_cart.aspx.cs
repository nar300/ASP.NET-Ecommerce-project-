using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class delete_cart : System.Web.UI.Page
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

        id = Convert.ToInt32(Request.QueryString["id"].ToString());

        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();


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

        int totcount = 0;
        if (Request.Cookies["cookies"] != null)
        {
            s = Convert.ToString(Request.Cookies["cookies"].Value);
            string[] strArr = s.Split('|');
            for (int i = 0; i < strArr.Length; i++)
            {
                totcount = totcount + 1;
            }
        }

        if (totcount == 1)
        {
            Response.Cookies["cookies"].Expires = DateTime.Now.AddDays(-1);
        }
        else
        {






            //this is for if cart is not empty

            DataTable dt1 = new DataTable();
            dt1.Columns.AddRange(new DataColumn[7] { new DataColumn("productname"), new DataColumn("productprice"), new DataColumn("productqty"), new DataColumn("producttotal"), new DataColumn("productimages"), new DataColumn("id"), new DataColumn("cookieid") });



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

                    if (id.ToString() == a[4].ToString())
                    {

                    }
                    else
                    {
                        ptotal = Convert.ToInt32(a[1].ToString()) * Convert.ToInt32(a[2].ToString());
                        dt1.Rows.Add(a[0].ToString(), a[1].ToString(), a[2].ToString(), ptotal.ToString(), a[3].ToString(), a[4].ToString(), i.ToString());

                    }






                }
            }




            int count = 0;
            foreach (DataRow dr2 in dt1.Rows)
            {

                if (count == 0)
                {
                    Response.Cookies["cookies"].Value = dr2["productname"].ToString() + "&" + dr2["productprice"].ToString() + "&" + dr2["productqty"].ToString() + "&" + dr2["productimages"].ToString() + "&" + dr2["id"].ToString();
                    Response.Cookies["cookies"].Expires = DateTime.Now.AddDays(1);
                }

                else
                {

                    Response.Cookies["cookies"].Value = Response.Cookies["cookies"].Value + "|" + dr2["productname"].ToString() + "&" + dr2["productprice"].ToString() + "&" + dr2["productqty"].ToString() + "&" + dr2["productimages"].ToString() + "&" + dr2["id"].ToString();
                    Response.Cookies["cookies"].Expires = DateTime.Now.AddDays(1);
                }

                count = count + 1;

            }


          

        }
        Response.Redirect("view_cart.aspx");
    }
}