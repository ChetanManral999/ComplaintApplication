<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ComplaintForm.aspx.cs" Inherits="ComplaintApplication.ComplaintForm" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Complaint Form</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"/>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <style>
        body {
            background-image: url('images/vigilance logo.jpg'); /* Path to your image */
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            color: #ffffff;
            background-color: #f0f2f5;
        }
         .logo-container {
            position: fixed;
        top: 20px; /* Margin from top */
        left: 20px; /* Margin from left */
        width: 150px; /* Larger logo width */
        height: 150px; /* Larger logo height */
        z-index: 10;
        background: rgba(255, 255, 255, 0.5);
        border-radius: 50%; /* Circular shape */
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.4); /* Larger shadow for better visibility */
        display: flex;
        justify-content: center;
        align-items: center;
        animation: hoverEffect 3s infinite;
}
    .logo-container img {
           width: 80%;
            height:auto;
            border-radius:50%;
        }
        @keyframes hoverEffect {
            0% {
                transform: translateY(0);
            }
            50% {
                transform: translateY(-10px); 
            }
            100% {
                transform: translateY(0);
            }
        }
        .form-container {
            max-width: 700px;
            margin: auto;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.5);;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            animation: fadeIn 1s ease-in-out;
        }
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333333;
        }
        .form-group label {
            font-weight: bold;
        }
        .btn-primary {
            background-color: #007bff;
            border: none;
            transition: background-color 0.3s;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
        .form-group input, .form-group textarea {
            transition: box-shadow 0.3s, border-color 0.3s;
        }
        .form-group input:focus, .form-group textarea:focus {
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
            border-color: #007bff;
        }
        .file-upload {
            position: relative;
            overflow: hidden;
        }
        .file-upload input[type="file"] {
            position: absolute;
            top: 0;
            right: 0;
            margin: 0;
            padding: 0;
            font-size: 20px;
            cursor: pointer;
            opacity: 0;
        }
    </style>
    <script>
        $(document).ready(function () {
            $('.form-group input, .form-group textarea').on('focus', function () {
                $(this).css('box-shadow', '0 0 5px rgba(0, 123, 255, 0.5)');
            }).on('blur', function () {
                $(this).css('box-shadow', 'none');
            });

            $('.btn-primary').hover(function () {
                $(this).css('background-color', '#0056b3');
            }, function () {
                $(this).css('background-color', '#007bff');
            });

            $('#fileUploadBtn').on('click', function () {
                $('#fileUpload').click();
            });

            $('#fileUpload').on('change', function () {
                var fileName = $(this).val().split('\\').pop();
                $('#fileName').text(fileName);
            });
        });
    </script>
</head>
<body>
         <div class="logo-container">
               <img src="images/Saillogo.png" alt="logo" />
        </div>
    <form id="form1" runat="server">
        <div class="container">
            <div class="form-container">
                <h2>Submit a Complaint</h2>
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>

                <div class="form-group">
                    <label for="txtName">Name of Complainant:</label>
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" 
                        ErrorMessage="Name is required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    <label for="txtEmail">Email of Complainant:</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" 
                        ErrorMessage="Email is required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    <label for="txtSubject">Subject:</label>
                    <asp:TextBox ID="txtSubject" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvSubject" runat="server" ControlToValidate="txtSubject" 
                        ErrorMessage="Subject is required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    <label for="txtComplaintAgainst">Complaint Against:</label>
                    <asp:TextBox ID="txtComplaintAgainst" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvComplaintAgainst" runat="server" ControlToValidate="txtComplaintAgainst" 
                        ErrorMessage="Complaint Against is required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    <label for="txtDetails">Details of Allegation:</label>
                    <asp:TextBox ID="txtDetails" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvDetails" runat="server" ControlToValidate="txtDetails" 
                        ErrorMessage="Details are required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    <label for="txtAddress">Address:</label>
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="txtAddress" 
                        ErrorMessage="Address is required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    <label for="txtMobile">Mobile Number:</label>
                    <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvMobile" runat="server" ControlToValidate="txtMobile" 
                        ErrorMessage="Mobile Number is required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                     <asp:RegularExpressionValidator ID="revMobile" runat="server" ControlToValidate="txtMobile" 
        ErrorMessage="Mobile Number must be a 10-digit number." ForeColor="Red" Display="Dynamic"
        ValidationExpression="^\d{10}$"></asp:RegularExpressionValidator>
                </div>

                <div class="form-group">
                    <label for="lblCaptcha">Captcha Code:</label>
                    <asp:Label ID="lblCaptcha" runat="server" CssClass="form-control"></asp:Label>
                    <asp:TextBox ID="txtCaptcha" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvCaptcha" runat="server" ControlToValidate="txtCaptcha" 
                        ErrorMessage="Captcha Code is required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:Button ID="btnRefreshCaptcha" runat="server" Text="Refresh CAPTCHA" OnClick="btnRefreshCaptcha_Click" CssClass="btn btn-info" />
                </div>

                <div class="form-group file-upload">
                    <label for="fileUpload">Attachment:</label>
                    <div class="input-group">
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="button" id="fileUploadBtn">Choose File</button>
                        </span>
                        <asp:FileUpload ID="fileUpload" runat="server" CssClass="form-control" />
                        <span class="form-control" id="fileName">No file chosen</span>
                    </div>
                </div>

                <div class="form-group text-center">
                    <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" Text="Save" OnClick="btnSave_Click" />
                    <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-success" Text="Submit" OnClick="btnSubmit_Click" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
