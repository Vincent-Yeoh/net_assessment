using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assessment123
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {

   
            if (FileUpload.HasFile)
            {
                try
                {
                    //read textfile in ASP.NET
                    string fileName = Path.GetFileName(FileUpload.FileName);
                    string filePath = Server.MapPath(fileName);
                    FileUpload.SaveAs(filePath);

                    //Save txt_file to server
                    string fileContent = File.ReadAllText(filePath);
                    List<string> contents = fileContent.Split(',').ToList();


                    //Set the datasource of the table to file content
                    TxtTable.DataSource = contents;
                    TxtTable.DataBind();
                }
                catch(Exception ex)
                {
                    Console.WriteLine(ex);
                }
            }




            //Understand how to read textfile and convert it to data source

            //How to convert/or can it directly work with the table 
        }
    }
}