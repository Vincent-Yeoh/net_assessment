using System;
using System.Collections.Generic;
using System.Data.Entity;
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

        }

        protected void btnDBUpload_Click(object sender, EventArgs e)
        {
            using(var context = new EmployeeDbEntities())
            {
                var Employees = context.Employees;
                List<Employee> queries = Employees.Where(x => x.Age == Employees.Max(p => p.Age) || x.Age == Employees.Min(p => p.Age)).ToList();
                MinMaxEmployeeGrid.DataSource = queries;
                MinMaxEmployeeGrid.DataBind();
            }
            

        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            FileUpload.Dispose();
            TxtTable.DataSource = null;
            TxtTable.DataBind();
        }

        protected void btnDBClear_Click(object sender, EventArgs e)
        {
            MinMaxEmployeeGrid.DataSource = null;
            MinMaxEmployeeGrid.DataBind();
        }
    }
}