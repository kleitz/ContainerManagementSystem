using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace ShipmentManagementSystem.Views
{
    public partial class MainPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShipmentDBConnectionString1"].ConnectionString);
                conn.Open();
                string showAll = "select count(*) from ShipmentInfo";
                SqlCommand com = new SqlCommand(showAll, conn);
                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write("Please try again!");
            }
        }

        protected void InsertButton_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(ShipmentIDBox.Text) || string.IsNullOrWhiteSpace(ImDateBox.Text) ||
                    string.IsNullOrWhiteSpace(ImTimeBox.Text) || string.IsNullOrWhiteSpace(ImLocationBox.Text) ||
                    string.IsNullOrWhiteSpace(ExDateBox.Text) || string.IsNullOrWhiteSpace(ExTimeBox.Text) ||
                    string.IsNullOrWhiteSpace(ExLocationBox.Text))
                {
                    Response.Write("The fields cannot be empty!");

                }
                else if (IsPostBack)
                {
                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShipmentDBConnectionString1"].ConnectionString);
                    conn.Open();
                    string checkID = "select count(*) from ShipmentInfo where ShipmentID ='" + ShipmentIDBox.Text + "'";
                    SqlCommand com = new SqlCommand(checkID, conn);
                    int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
                    if (temp == 1)
                    {
                        Response.Write("ShipmentID exists already!");
                    }
                    else
                    {
                        string insertQuery = "insert into ShipmentInfo(ShipmentID, ImportDate, ImportTime, ImportLocation, ExportDate, ExportTime, ExportLocation) values (@value1, @value2, @value3, @value4, @value5, @value6, @value7)";
                        com = new SqlCommand(insertQuery, conn);
                        com.Parameters.AddWithValue("@value1", ShipmentIDBox.Text);
                        com.Parameters.AddWithValue("@value2", ImDateBox.Text);
                        com.Parameters.AddWithValue("@value3", ImTimeBox.Text);
                        com.Parameters.AddWithValue("@value4", ImLocationBox.Text);
                        com.Parameters.AddWithValue("@value5", ExDateBox.Text);
                        com.Parameters.AddWithValue("@value6", ExTimeBox.Text);
                        com.Parameters.AddWithValue("@value7", ExLocationBox.Text);

                        com.ExecuteNonQuery();
                        Response.Redirect("MainPage.aspx");
                        Response.Write("New shipment successfully added!");
                    }
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                Response.Write("Please try again!");
            }
            finally
            {
                //GridView1.DataBind();
            }
        }

        protected void LogOutButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("LoginPage.aspx");
        }
    }
}