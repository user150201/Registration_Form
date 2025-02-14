<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerRegistration.aspx.cs" Inherits="Registration2.CustomerRegistration" Async="true" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customer Registration</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f4f4f4;
        }
        form {
            background: white;
            padding: 20px;
            border-radius: 5px;
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 10px;
            width: 50%;
        }
        label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }
        .full-width {
            grid-column: span 2;
        }
        input, select, textarea, button {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        button {
            background-color: #28a745;
            color: white;
            border: none;
            cursor: pointer;
            margin-top: 15px;
            padding: 10px;
        }
        button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h2 class="full-width" style="text-align: center;">Customer Registration</h2>

        <div>
    <label for="customerID">Customer ID</label>
    <asp:TextBox ID="customerID" runat="server" required></asp:TextBox>
</div>

        <div>
            <label for="name">Full Name</label>
            <asp:TextBox ID="name" runat="server" required></asp:TextBox>
        </div>
        <div>
            <label for="dob">Date of Birth</label>
            <asp:TextBox ID="dob" runat="server" TextMode="Date" required></asp:TextBox>
        </div>

        <div>
            <label for="gender">Gender</label>
            <asp:DropDownList ID="gender" runat="server" required>
                <asp:ListItem Value="">Select</asp:ListItem>
                <asp:ListItem Value="Male">Male</asp:ListItem>
                <asp:ListItem Value="Female">Female</asp:ListItem>
                <asp:ListItem Value="Other">Other</asp:ListItem>
            </asp:DropDownList>
        </div>

        <div>
            <label for="contact">Contact Number</label>
            <asp:TextBox ID="contact" runat="server" required></asp:TextBox>
        </div>
        <div>
            <label for="email">Email</label>
            <asp:TextBox ID="email" runat="server" required></asp:TextBox>
        </div>

        <div>
              <label for="employment">Employment</label>
    <asp:DropDownList ID="employment" runat="server" required>
        <asp:ListItem Value="">Select</asp:ListItem>
        <asp:ListItem Value="Software Engineer">Software Engineer</asp:ListItem>
        <asp:ListItem Value="Data Analyst">Data Analyst</asp:ListItem>
        <asp:ListItem Value="Project Manager">Project Manager</asp:ListItem>
        <asp:ListItem Value="Designer">Designer</asp:ListItem>
        <asp:ListItem Value="Teacher">Teacher</asp:ListItem>
    </asp:DropDownList>
        </div>

        <div class="full-width">
            <label for="address">Address</label>
            <asp:TextBox ID="address" runat="server" TextMode="MultiLine" required></asp:TextBox>
        </div>

        <div>
            <label for="city">City</label>
            <asp:TextBox ID="city" runat="server" required></asp:TextBox>
        </div>
        <div>
            <label for="state">State</label>
            <asp:TextBox ID="state" runat="server" required></asp:TextBox>
        </div>

        <div>
            <label for="country">Country</label>
            <asp:DropDownList ID="country" runat="server" required>
                <asp:ListItem Value="">Select</asp:ListItem>
                <asp:ListItem Value="USA">United States</asp:ListItem>
                <asp:ListItem Value="Canada">Canada</asp:ListItem>
                <asp:ListItem Value="India">India</asp:ListItem>
            </asp:DropDownList>
        </div>

        <div>
            <label for="zipcode">Zip Code</label>
            <asp:TextBox ID="zipcode" runat="server" required></asp:TextBox>
        </div>

        <div class="full-width">
<asp:Button ID="btnSubmit" runat="server" Text="Register" CssClass="button" OnClick="btnSubmit_Click" />
        </div>
    </form>
</body>
</html>