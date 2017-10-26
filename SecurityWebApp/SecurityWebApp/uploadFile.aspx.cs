using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;
using System.Web.Security;
using System.Configuration;
using System.Data;

namespace SecurityWebApp
{
    public partial class uploadFile : System.Web.UI.Page
    {
        protected System.Web.UI.HtmlControls.HtmlInputFile inputFile;
        protected System.Web.UI.HtmlControls.HtmlInputFile File2;
        protected System.Web.UI.HtmlControls.HtmlInputButton Submit1;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if ((inputFile.PostedFile != null) && (inputFile.PostedFile.ContentLength > 0))
            {
                string fn = System.IO.Path.GetFileName(inputFile.PostedFile.FileName);
                string SaveLocation = Server.MapPath("Data") + "\\" + fn;
                //get hidden value
                var variable = encrycont.Value;
                //store to the DATA/
                File.WriteAllText(Server.MapPath("Data") + "\\" + DateTime.Now.ToString("yyyyMMddHHmm"), variable);

                //get fileformat  and encrypt key
                var lastfiletype = filetype.Value;
                var enckey = encryptedKey.Value;

                //insert to FileStorage... will include more
                using (SqlConnection con = new SqlConnection(@"Data Source=(LocalDb)\MSSQLLocalDB;Initial Catalog=ICT3103;Integrated Security=True"))
            {
               con.Open();
                 string sql = "INSERT INTO FileStorage(filetype,encryptkey) VALUES(@param1,@param2)";
                 SqlCommand cmd = new SqlCommand(sql,con);
                cmd.Parameters.AddWithValue("@param1", lastfiletype);
                cmd.Parameters.AddWithValue("@param2", enckey);
                cmd.CommandType = CommandType.Text;
                cmd.ExecuteNonQuery();
             }

                try
                {
                    inputFile.PostedFile.SaveAs(SaveLocation);
                    Response.Write("The file has been uploaded.");
                }
                catch (Exception ex)
                {
                    Response.Write("Error: " + ex.Message);
                    //Note: Exception.Message returns a detailed message that describes the current exception. 
                    //For security reasons, we do not recommend that you return Exception.Message to end users in 
                    //production environments. It would be better to put a generic error message. 
                }
            }
            else
            {
                Response.Write("Please select a file to upload.");
            }
        }
    }
}