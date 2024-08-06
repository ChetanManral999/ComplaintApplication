<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ComplaintsList.aspx.cs" Inherits="ComplaintApplication.ComplaintsList" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Complaints List</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <!-- Custom CSS -->
    <style>
        .complaint-item {
            padding: 15px;
            margin: 15px 0;
            border-radius: 5px;
            color: white;
        }
        .submitted {
            background-color: red;
        }
        .saved {
            background-color: green;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2 class="text-center my-4">Complaints List</h2>
            <asp:Repeater ID="RepeaterComplaints" runat="server">
                <ItemTemplate>
                    <div class="complaint-item <%# (bool)Eval("IsSubmitted") ? "submitted" : "saved" %>">
                        <p><strong>Name:</strong> <%# Eval("Name") %></p>
                        <p><strong>Email:</strong> <%# Eval("Email") %></p>
                        <p><strong>Subject:</strong> <%# Eval("Subject") %></p>
                        <p><strong>Complaint Against:</strong> <%# Eval("ComplaintAgainst") %></p>
                        <p><strong>Details:</strong> <%# Eval("Details") %></p>
                        <p><strong>Address:</strong> <%# Eval("Address") %></p>
                        <p><strong>Mobile:</strong> <%# Eval("Mobile") %></p>
                        <p><strong>Timestamp:</strong> <%# Eval("Timestamp") %></p>
                        <asp:HyperLink ID="lnkEdit" runat="server" NavigateUrl='<%# "EditComplaint.aspx?Id=" + Eval("Id") %>' Visible='<%# !(bool)Eval("IsSubmitted") %>'>Edit</asp:HyperLink>
                        <asp:Label ID="lblStatus" runat="server" Text="Submitted" Visible='<%# (bool)Eval("IsSubmitted") %>'></asp:Label>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </form>
</body>
</html>
