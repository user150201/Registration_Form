using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using Registration2.Models; // Ensure this matches the namespace of your Customer class

namespace Registration2
{
    public partial class CustomerList : System.Web.UI.Page
    {
        private static readonly string apiUrl = "https://localhost:44318/api/Customer/";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                gvCustomerDetails.Visible = false;
            }
        }

        // Fetch Customer Details
        protected async void btnFetchCustomer_Click(object sender, EventArgs e)
        {

            if (int.TryParse(txtCustomerID.Text, out int customerId))
            {
                await FetchCustomerDetails(customerId);
            }
            else
            {
                DisplayError("Please enter a valid Customer ID.");
            }
        }

        private async Task FetchCustomerDetails(int customerId)
        {
            ServicePointManager.ServerCertificateValidationCallback = (sender, cert, chain, sslPolicyErrors) => true;

            using (HttpClient client = new HttpClient())
            {
                client.BaseAddress = new Uri(apiUrl);
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                HttpResponseMessage response = await client.GetAsync(customerId.ToString());

                if (response.IsSuccessStatusCode)
                {
                    string jsonData = await response.Content.ReadAsStringAsync();
                    Customer customer = JsonConvert.DeserializeObject<Customer>(jsonData);

                    List<Customer> customerList = new List<Customer> { customer };
                    gvCustomerDetails.DataSource = customerList;
                    gvCustomerDetails.DataBind();
                    gvCustomerDetails.Visible = true;
                }
                else
                {
                    DisplayError("Customer not found.");
                }
            }
        }

        private void DisplayError(string message)
        {
            gvCustomerDetails.DataSource = null;
            gvCustomerDetails.Visible = false;
            Response.Write("<script>alert('" + message + "');</script>");
        }

        // Enable GridView Edit Mode
        protected async void gvCustomerDetails_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvCustomerDetails.EditIndex = e.NewEditIndex;
            int customerId = int.Parse(txtCustomerID.Text);
            await FetchCustomerDetails(customerId); // Refresh data to show textboxes
                                                    
        }

            // Cancel Edit Mode
            protected void gvCustomerDetails_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvCustomerDetails.EditIndex = -1;
            int customerId = int.Parse(txtCustomerID.Text);
            FetchCustomerDetails(customerId).Wait();
        }

        // Update Customer Details

        protected async void gvCustomerDetails_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int customerId = Convert.ToInt32(gvCustomerDetails.DataKeys[e.RowIndex].Value);

            GridViewRow row = gvCustomerDetails.Rows[e.RowIndex];

            // Extract updated values from TextBoxes
            Customer updatedCustomer = new Customer
            {
                CustomerID = customerId,
                FullName = ((TextBox)row.FindControl("txtFullName")).Text,
                DateOfBirth = DateTime.TryParse(((TextBox)row.FindControl("txtDateOfBirth")).Text, out DateTime dob) ? dob : DateTime.MinValue,
                Gender = ((TextBox)row.FindControl("txtGender")).Text,
                Employment = ((TextBox)row.FindControl("txtEmployment")).Text,
                ContactNumber = ((TextBox)row.FindControl("txtContactNumber")).Text,
                Email = ((TextBox)row.FindControl("txtEmail")).Text,
                Address = ((TextBox)row.FindControl("txtAddress")).Text,
                City = ((TextBox)row.FindControl("txtCity")).Text,
                State = ((TextBox)row.FindControl("txtState")).Text,
                Country = ((TextBox)row.FindControl("txtCountry")).Text,
                ZipCode = ((TextBox)row.FindControl("txtZipCode")).Text
            };

            using (HttpClient client = new HttpClient())
            {
                client.BaseAddress = new Uri(apiUrl);
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                string json = JsonConvert.SerializeObject(updatedCustomer);
                HttpContent content = new StringContent(json, Encoding.UTF8, "application/json");

                HttpResponseMessage response = await client.PutAsync(customerId.ToString(), content);

                if (response.IsSuccessStatusCode)
                {
                    gvCustomerDetails.EditIndex = -1; // Exit edit mode
                    await FetchCustomerDetails(customerId); // Refresh data
                }
                else
                {
                    DisplayError("Update failed.");
                }
            }
        }

        protected async void gvCustomerDetails_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {


            int customerId = Convert.ToInt32(gvCustomerDetails.DataKeys[e.RowIndex].Value);

            using (HttpClient client = new HttpClient())
            {
                client.BaseAddress = new Uri(apiUrl);
                HttpResponseMessage response = await client.DeleteAsync(customerId.ToString());

                if (response.IsSuccessStatusCode)
                {
                    ShowMessage("Customer deleted successfully.");

                    gvCustomerDetails.EditIndex = -1;
                    gvCustomerDetails.Visible = false; // Hide the table if no records are left
                }
                else
                {
                    ShowMessage("Failed to delete");

                }
            }

           
        }

        private void ShowMessage(string message)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", $"alert('{message}');", true);
        }

        protected void btnBackToRegistration_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustomerRegistration.aspx");
        }
    }
}
