<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditComplaint.aspx.cs" Inherits="ComplaintApplication.EditComplaint" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Complaint</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <!-- Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <!-- Custom CSS -->
    <style>
        .form-container {
            max-width: 600px;
            margin: auto;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
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
            transition: box-shadow 0.3s;
        }
        .form-group input:focus, .form-group textarea:focus {
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }
    </style>
    <!-- Custom JavaScript -->
    <script>
        $(document).ready(function() {
            $('.form-group input, .form-group textarea').on('focus', function() {
                $(this).css('box-shadow', '0 0 5px rgba(0, 123, 255, 0.5)');
            }).on('blur', function() {
                $(this).css('box-shadow', 'none');
            });
        });
        $(document).ready(function () {
            $('.form-group input, .form-group textarea').on('focus', function () {
                $(this).animate({ boxShadow: '0 0 10px rgba(0, 123, 255, 0.8)' }, 300);
            }).on('blur', function () {
                $(this).animate({ boxShadow: 'none' }, 300);
            });

            $('.btn-primary').hover(function () {
                $(this).animate({ backgroundColor: '#0056b3' }, 300);
            }, function () {
                $(this).animate({ backgroundColor: '#007bff' }, 300);
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="form-container">
                <h2>Edit Complaint</h2>
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                <div class="form-group">
                    <label for="txtName">Name of Complainant:</label>
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtEmail">Email of Complainant:</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtSubject">Subject:</label>
                    <asp:TextBox ID="txtSubject" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtComplaintAgainst">Complaint Against:</label>
                    <asp:TextBox ID="txtComplaintAgainst" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtDetails">Details of Allegation:</label>
                    <asp:TextBox ID="txtDetails" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtAddress">Address:</label>
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtMobile">Mobile Number:</label>
                    <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtCaptcha">Captcha Code:</label>
                    <asp:TextBox ID="txtCaptcha" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group text-center">
                    <asp:Button ID="btnUpdate" runat="server" CssClass="btn btn-primary" Text="Update" OnClick="btnUpdate_Click" />
                    <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-secondary" Text="Cancel" OnClick="btnCancel_Click" />
                     <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-success" Text="Submit" OnClick="btnSubmit_Click" />
                </div>
            </div>
        </div>
    </form>
</body>

</html>
