using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Security;

namespace User_Login_CS
{

    public partial class Login : System.Web.UI.Page
    {
        static int counter = 1;
        static string tempname = "temp";

        protected void ValidateUser(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(@"Data Source=(LocalDb)\MSSQLLocalDB;Initial Catalog=ICT3103;Integrated Security=True"))
            {
               SqlCommand cmd = new SqlCommand("select * from [ca2] where UserName like @username and Password = HASHBYTES('SHA2_512', @password) AND status = 'active';");
                cmd.Parameters.AddWithValue("@username", Login1.UserName);
                cmd.Parameters.AddWithValue("@password", Login1.Password);
                cmd.Connection = con;
                con.Open();

                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                con.Close();
                bool loginSuccessful = ((ds.Tables.Count > 0) && (ds.Tables[0].Rows.Count > 0));

                if (loginSuccessful)
                {
                    FormsAuthentication.RedirectFromLoginPage(Login1.UserName, Login1.RememberMeSet);
                    Response.Redirect ("uploadFile.aspx");

                }
                else
                {

                    // trying for 3 attempts
                    SqlCommand cmd2 = new SqlCommand("select * from [ca2] where UserName like @username AND status = 'active';");

                    cmd2.Parameters.AddWithValue("@username", Login1.UserName);
                    cmd2.Connection = con;
                    con.Open();

                    DataSet ds2 = new DataSet();
                    SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
                    da2.Fill(ds2);
                    con.Close();

                    bool attempts = ((ds2.Tables.Count > 0) && (ds2.Tables[0].Rows.Count > 0));
                    if (attempts)
                    {   
                        //first login 
                        if (tempname == "temp")
                        {
                            tempname = Login1.UserName;
                        }
                        // login attempt with same username 2nd time
                        else if (tempname == Login1.UserName)
                        {
                            counter++;
                            // another username login, set counter to 1
                        } else {
                            tempname = Login1.UserName;
                            counter = 1;

                        }

                        Login1.FailureText = "No of fail attempt "  + counter;

                        if(counter == 3)
                        {
                            SqlCommand cmd3 = new SqlCommand("update [ca2] SET status ='disable' where UserName like @username");

                            cmd3.Parameters.AddWithValue("@username", Login1.UserName);
                            cmd3.Connection = con;
                            con.Open();

                            DataSet ds3 = new DataSet();
                            SqlDataAdapter da3 = new SqlDataAdapter(cmd3);
                            da3.Fill(ds3);
                            con.Close();

                            counter = 0;
                            Login1.FailureText = "Account Disabled";

                        }


                    }
                    else
                    {
                        Login1.FailureText = "Username and/or password is incorrect or account has been disabled.";
                    }
                }
            }
        }
    }
}