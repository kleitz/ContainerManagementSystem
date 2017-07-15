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
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(LoginBox.Text) || string.IsNullOrWhiteSpace(PasswordBox.Text))
                {
                    Response.Write("Username and Password not correct!");

                }
                else if (IsPostBack)
                {
                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShipmentDBConnectionString1"].ConnectionString);
                    conn.Open();
                    string checkuser = "select count(*) from LoginInfo where Username = @username and Password = @password";
                    SqlCommand com = new SqlCommand(checkuser, conn);
                    com.Parameters.AddWithValue("@username", LoginBox.Text);
                    com.Parameters.AddWithValue("@password", PasswordBox.Text);
                    int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
                    if (temp == 1)
                    {
                        Response.Redirect("MainPage.aspx");
                        Response.Write("Login completed!");
                    }
                    else
                    {
                        Response.Write("Incorrect Username or Password!");
                    }
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                Response.Write("Please try again!");
            }
        }

        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("RegisterPage.aspx");
        }
    }
}