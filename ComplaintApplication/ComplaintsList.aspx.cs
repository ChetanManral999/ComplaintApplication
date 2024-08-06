using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace ComplaintApplication
{
    public partial class ComplaintsList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindComplaints();
            }
        }

        private void BindComplaints()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ComplaintDB"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM Complaints";
                SqlDataAdapter adapter = new SqlDataAdapter(query, connection);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                RepeaterComplaints.DataSource = dt;
                RepeaterComplaints.DataBind();
            }
        }
    }
}
