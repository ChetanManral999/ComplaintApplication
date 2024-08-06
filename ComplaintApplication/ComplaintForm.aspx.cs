using System;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Text;
using System.Linq;

namespace ComplaintApplication
{
    public partial class ComplaintForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillCaptcha();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid && ValidateCaptcha())
            {
                if (ValidateForm())
                {
                    SaveComplaint(false);
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid && ValidateCaptcha())
            {
                if (ValidateForm())
                {
                    SaveComplaint(true);
                }
            }
        }

        private void SaveComplaint(bool isSubmitted)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ComplaintDB"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Complaints (Name, Email, Subject, ComplaintAgainst, Details, Address, Mobile, FilePath, Captcha, IsSubmitted, Timestamp) " +
                               "VALUES (@Name, @Email, @Subject, @ComplaintAgainst, @Details, @Address, @Mobile, @FilePath, @Captcha, @IsSubmitted, @Timestamp)";

                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Name", txtName.Text);
                command.Parameters.AddWithValue("@Email", txtEmail.Text);
                command.Parameters.AddWithValue("@Subject", txtSubject.Text);
                command.Parameters.AddWithValue("@ComplaintAgainst", txtComplaintAgainst.Text);
                command.Parameters.AddWithValue("@Details", txtDetails.Text);
                command.Parameters.AddWithValue("@Address", txtAddress.Text);
                command.Parameters.AddWithValue("@Mobile", txtMobile.Text);

                // Handle file upload
                string filePath = "";
                if (fileUpload.HasFile)
                {
                    string[] allowedExtensions = { ".gif", ".jpeg", ".jpg", ".png", ".pdf", ".txt", ".docx" };
                    string fileExtension = Path.GetExtension(fileUpload.FileName).ToLower();

                    if (allowedExtensions.Contains(fileExtension) && fileUpload.PostedFile.ContentLength <= 100 * 1024 * 1024)
                    {
                        string uploadsFolder = Server.MapPath("~/Uploads");
                        if (!Directory.Exists(uploadsFolder))
                        {
                            Directory.CreateDirectory(uploadsFolder);
                        }
                        filePath = "~/Uploads/" + fileUpload.FileName;
                        fileUpload.SaveAs(Server.MapPath(filePath));
                    }
                    else
                    {
                        lblMessage.Text = "Invalid file type or file size exceeds the limit.";
                        return;
                    }
                }
                command.Parameters.AddWithValue("@FilePath", filePath);

                command.Parameters.AddWithValue("@Captcha", txtCaptcha.Text);
                command.Parameters.AddWithValue("@IsSubmitted", isSubmitted);
                command.Parameters.AddWithValue("@Timestamp", DateTime.Now);

                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
                Response.Redirect("ComplaintsList.aspx");
            }
        }

        private bool ValidateCaptcha()
        {
            if (txtCaptcha.Text == Session["captcha"].ToString())
            {
                return true;
            }
            else
            {
                lblMessage.Text = "Invalid CAPTCHA code. Please try again.";
                FillCaptcha(); // Refresh CAPTCHA on incorrect entry
                return false;
            }
        }

        void FillCaptcha()
        {
            try
            {
                Random random = new Random();
                string combination = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
                StringBuilder captcha = new StringBuilder();
                for (int i = 0; i < 6; i++)
                {
                    captcha.Append(combination[random.Next(combination.Length)]);
                }
                // Store the generated CAPTCHA in the session
                Session["captcha"] = captcha.ToString();
                // Update the CAPTCHA display
                lblCaptcha.Text = Session["captcha"].ToString();
            }
            catch
            {
                throw;
            }
        }

        protected void btnRefreshCaptcha_Click(object sender, EventArgs e)
        {
            FillCaptcha(); // Refresh the CAPTCHA
        }
        private bool ValidateForm()
        {
            bool isValid = true;
            lblMessage.Text = "";

            // Check if all other fields are filled (already validated with RequiredFieldValidators)

            // Validate FileUpload
            if (!fileUpload.HasFile)
            {
                lblMessage.Text = "Attachment is required.";
                isValid = false;
            }

            return isValid;
        }
    }
}
