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
    public partial class RegisterPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SignUpButton_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(UsernameBox.Text) || string.IsNullOrWhiteSpace(PasswordBox.Text))
                {
                    Response.Write("Username or Password cannot be empty!");

                }
                else if (IsPostBack)
                {
                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShipmentDBConnectionString1"].ConnectionString);
                    conn.Open();
                    string checkuser = "select count(*) from LoginInfo where Username ='" + UsernameBox.Text + "'";
                    SqlCommand com = new SqlCommand(checkuser, conn);
                    int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
                    if (temp == 1)
                    {
                        Response.Write("User exists already!");
                    }
                    else
                    {
                        string insertQuery = "insert into LoginInfo(Username, Password) values (@username, @password)";
                        com = new SqlCommand(insertQuery, conn);
                        com.Parameters.AddWithValue("@username", UsernameBox.Text);
                        com.Parameters.AddWithValue("@password", PasswordBox.Text);

                        com.ExecuteNonQuery();
                        Response.Redirect("MainPage.aspx");
                        Response.Write("Register successfully!");
                    }
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                Response.Write("Please try again!");
            }
        }

        protected void BackButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("LoginPage.aspx");
        }
    }
}