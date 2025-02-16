<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerList.aspx.cs" Inherits="Registration2.CustomerList" Async="true"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customer Management</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="scriptManager" runat="server" /> <!-- Required for AJAX -->
        <div>
            <asp:Label ID="lblCustomerID" runat="server" Text="Enter Customer ID: "></asp:Label>
            <asp:TextBox ID="txtCustomerID" runat="server"></asp:TextBox>
            <asp:Button ID="btnFetchCustomer" runat="server" Text="Fetch Details" OnClick="btnFetchCustomer_Click" />

            <br /><br />
            <asp:UpdatePanel ID="updPanel" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="gvCustomerDetails" runat="server" AutoGenerateColumns="False"
                        UpdateMode="Always"
                        OnRowEditing="gvCustomerDetails_RowEditing"
                        OnRowCancelingEdit="gvCustomerDetails_RowCancelingEdit"
                        OnRowUpdating="gvCustomerDetails_RowUpdating"
                        DataKeyNames="CustomerID">
                        <Columns>
                            <asp:BoundField DataField="CustomerID" HeaderText="Customer ID" ReadOnly="True" />
                            
                            <asp:TemplateField HeaderText="Full Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblFullName" runat="server" Text='<%# Bind("FullName") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtFullName" runat="server" Text='<%# Bind("FullName") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Date of Birth">
                                <ItemTemplate>
                                    <asp:Label ID="lblDateOfBirth" runat="server" Text='<%# Bind("DateOfBirth", "{0:yyyy-MM-dd}") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtDateOfBirth" runat="server" Text='<%# Bind("DateOfBirth", "{0:yyyy-MM-dd}") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Gender">
                                <ItemTemplate>
                                    <asp:Label ID="lblGender" runat="server" Text='<%# Bind("Gender") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtGender" runat="server" Text='<%# Bind("Gender") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Employment">
                                <ItemTemplate>
                                    <asp:Label ID="lblEmployment" runat="server" Text='<%# Bind("Employment") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtEmployment" runat="server" Text='<%# Bind("Employment") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Contact Number">
                                <ItemTemplate>
                                    <asp:Label ID="lblContactNumber" runat="server" Text='<%# Bind("ContactNumber") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtContactNumber" runat="server" Text='<%# Bind("ContactNumber") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Email">
                                <ItemTemplate>
                                    <asp:Label ID="lblEmail" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Address">
                                <ItemTemplate>
                                    <asp:Label ID="lblAddress" runat="server" Text='<%# Bind("Address") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtAddress" runat="server" Text='<%# Bind("Address") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="City">
                                <ItemTemplate>
                                    <asp:Label ID="lblCity" runat="server" Text='<%# Bind("City") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtCity" runat="server" Text='<%# Bind("City") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="State">
                                <ItemTemplate>
                                    <asp:Label ID="lblState" runat="server" Text='<%# Bind("State") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtState" runat="server" Text='<%# Bind("State") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Country">
                                <ItemTemplate>
                                    <asp:Label ID="lblCountry" runat="server" Text='<%# Bind("Country") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtCountry" runat="server" Text='<%# Bind("Country") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Zip Code">
                                <ItemTemplate>
                                    <asp:Label ID="lblZipCode" runat="server" Text='<%# Bind("ZipCode") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtZipCode" runat="server" Text='<%# Bind("ZipCode") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:CommandField ShowEditButton="True" ShowCancelButton="True" />
                        </Columns>
                    </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
          <br />
        <asp:Button ID="btnBackToRegistration" runat="server" Text="Back to Registration" OnClick="btnBackToRegistration_Click" />
    </form>
  


</body>
</html>
