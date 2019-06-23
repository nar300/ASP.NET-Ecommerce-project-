using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class view_cart : System.Web.UI.Page
{
    string s;
    string t;
    string[] a = new string[6];
    int tot = 0;
    int ptotal = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        dt.Columns.AddRange(new DataColumn[7] { new DataColumn("productname"), new DataColumn("productprice"), new DataColumn("productqty"), new DataColumn("producttotal"), new DataColumn("productimages"), new DataColumn("id"), new DataColumn("cookieid") });

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
                dt.Rows.Add(a[0].ToString(), a[1].ToString(), a[2].ToString(), ptotal.ToString() , a[3].ToString(), a[4].ToString(), i.ToString());

                tot = tot + (Convert.ToInt32(a[1].ToString()) * Convert.ToInt32(a[2].ToString()));
            }
        }
        r1.DataSource = dt;
        r1.DataBind();


        total.Text = tot.ToString();

    }

    protected void bb1_Click(object sender, EventArgs e)
    {
        Session["checkoutbutton"] = "yes";
        Response.Redirect("checkout.aspx");
    }
}