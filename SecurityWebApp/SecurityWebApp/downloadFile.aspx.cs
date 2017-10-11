using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SecurityWebApp
{
    public partial class downloadFile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GenerateDownloadLinks();
        }

        private void GenerateDownloadLinks()
        {
            List<FileClass> lstFiles = new List<FileClass>();
            string path = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Data/");
            if (Directory.Exists(path))
            {
                DirectoryInfo di = new DirectoryInfo(path);

                foreach(FileInfo fi in di.GetFiles())
                {
                    lstFiles.Add(new FileClass() {
                        FileName = fi.Name,
                        DownloadLink = Path.Combine(AppDomain.CurrentDomain.BaseDirectory,"Data/" + fi.Name)
                    });
                }
                DataListContent.DataSource = lstFiles;
                DataListContent.DataBind();
            }
        }

        public class FileClass
        {
            public string FileName { get; set; }
            public string DownloadLink { get; set; }
        }

        protected void deleteFile(object sender, EventArgs e)
        {
            string filePath = (sender as LinkButton).CommandArgument;
            File.Delete(filePath);
            GenerateDownloadLinks();
        }


        protected void ButtonDownload_Click(object sender, EventArgs e)
        {
            string path = (sender as LinkButton).CommandArgument;
            string name = Path.GetFileName(path);
            string ext = Path.GetExtension(path);

            HttpResponse response = HttpContext.Current.Response;
            response.ClearContent();
            response.Clear();
            response.AddHeader("content-disposition", "attachment; filename =" + name);
            response.ContentType = "text/plain";
            response.TransmitFile(path);
            response.Flush();
            response.End();

        }
    }
}