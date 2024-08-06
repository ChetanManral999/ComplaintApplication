using System;
using System.Data.SqlClient;
using System.Configuration;

namespace ComplaintApplication
{
    public partial class EditComplaint : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["Id"] != null)
                {
                    int complaintId = int.Parse(Request.QueryString["Id"]);
                    LoadComplaint(complaintId);
                }
                else
                {
                    Response.Redirect("ComplaintsList.aspx");
                }
            }
        }

        private void LoadComplaint(int complaintId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ComplaintDB"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM Complaints WHERE Id = @Id";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Id", complaintId);

                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                if (reader.Read())
                {
                    txtName.Text = reader["Name"].ToString();
                    txtEmail.Text = reader["Email"].ToString();
                    txtSubject.Text = reader["Subject"].ToString();
                    txtComplaintAgainst.Text = reader["ComplaintAgainst"].ToString();
                    txtDetails.Text = reader["Details"].ToString();
                    txtAddress.Text = reader["Address"].ToString();
                    txtMobile.Text = reader["Mobile"].ToString();
                    txtCaptcha.Text = reader["Captcha"].ToString();
                }
                connection.Close();
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            int complaintId = int.Parse(Request.QueryString["Id"]);
            UpdateComplaint(complaintId, isSubmit: false);
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int complaintId = int.Parse(Request.QueryString["Id"]);
            UpdateComplaint(complaintId, isSubmit: true);
        }

        private void UpdateComplaint(int complaintId, bool isSubmit)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ComplaintDB"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "UPDATE Complaints SET Name = @Name, Email = @Email, Subject = @Subject, ComplaintAgainst = @ComplaintAgainst, " +
                               "Details = @Details, Address = @Address, Mobile = @Mobile, Captcha = @Captcha, " +
                               "isSubmitted = @isSubmitted " +
                               "WHERE Id = @Id";

                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Name", txtName.Text);
                command.Parameters.AddWithValue("@Email", txtEmail.Text);
                command.Parameters.AddWithValue("@Subject", txtSubject.Text);
                command.Parameters.AddWithValue("@ComplaintAgainst", txtComplaintAgainst.Text);
                command.Parameters.AddWithValue("@Details", txtDetails.Text);
                command.Parameters.AddWithValue("@Address", txtAddress.Text);
                command.Parameters.AddWithValue("@Mobile", txtMobile.Text);
                command.Parameters.AddWithValue("@Captcha", txtCaptcha.Text);
                command.Parameters.AddWithValue("@Id", complaintId);
                command.Parameters.AddWithValue("@isSubmitted", isSubmit ? 1 : 0); // Set status based on isSubmit parameter

                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();

                if (isSubmit)
                {
                    lblMessage.Text = "Complaint submitted successfully!";
                    lblMessage.ForeColor = System.Drawing.Color.Red; // Set color to red for submitted complaints
                }
                else
                {
                    lblMessage.Text = "Complaint updated successfully!";
                    lblMessage.ForeColor = System.Drawing.Color.Green; // Set color to green for updated complaints
                }
                Response.Redirect("ComplaintsList.aspx");
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("ComplaintsList.aspx");
        }
    }
}
