using Newtonsoft.Json;
using Registration2.Models;
using Swashbuckle.Swagger;
using System;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Reflection.Emit;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI;
using System.Xml.Linq;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;



namespace Registration2
{
    public partial class CustomerRegistration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected async void btnSubmit_Click(object sender, EventArgs e)
        {
            await RegisterCustomerAsync();
            
        }



        private async Task RegisterCustomerAsync()
        {
            try
            {
                
                ServicePointManager.ServerCertificateValidationCallback =
                    (sender, cert, chain, sslPolicyErrors) => true;

                var customer = new
                {
                    CustomerID = int.Parse(customerID.Text),
                    FullName = name.Text,
                    DateOfBirth = DateTime.Parse(dob.Text).ToString("o"),
                    Gender = gender.SelectedValue,
                    ContactNumber = contact.Text,
                    Email = email.Text,
                    Address = address.Text,
                    City = city.Text,
                    State = state.Text,
                    Country = country.SelectedValue,
                    ZipCode = zipcode.Text,
                    Employment = employment.SelectedValue
                };

                string jsonData = JsonConvert.SerializeObject(customer, Formatting.Indented);
                System.Diagnostics.Debug.WriteLine("Serialized JSON: " + jsonData);



                using (HttpClient client = new HttpClient())
                {
                    client.BaseAddress = new Uri("https://localhost:44318/api/Customer");
                    client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                    StringContent content = new StringContent(jsonData, Encoding.UTF8, "application/json");

                    HttpResponseMessage response = await client.PostAsync("", content);

                    System.Diagnostics.Debug.WriteLine("Response Status: " + response.StatusCode);
                    string responseContent = await response.Content.ReadAsStringAsync();
                    System.Diagnostics.Debug.WriteLine("API Response: " + responseContent);

                    if (response.IsSuccessStatusCode)
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Customer registered successfully!');", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "alert", $"alert('Error: {responseContent}');", true);
                    }
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Exception: " + ex.Message);
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", $"alert('Error: {ex.Message}');", true);
            }
        }

        protected void btnNavigate_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustomerList.aspx");
        }
    }
}
