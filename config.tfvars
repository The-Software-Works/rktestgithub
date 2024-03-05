subscription_id = "147bcd7c-5abf-4fea-a95c-1e1c8e6d4abe"
client_id = "f938191a-7cd1-4d92-a9e6-e13f894733b4"
client_secret = "m5Y8Q~egfXXleMkS1FCF.xkVhSYL6VX_.5MuTbYt"
tenant_id = "dd559b05-19eb-4957-af73-9ee420d71796"
location = "East US"

##################################################################
# Azure configuration
resource_group_name = "mygitenvrg"
#location            = "East US"

# VM configuration
vm_name             = "myVM"
vm_size             = "Standard_DS1_v2"
#admin_username      = "adminuser"
#admin_password      = "P@ssw0rd1234"  # It's advisable to use environment variables for sensitive data like passwords.

# Network configuration
vnet_name           = "myVNet"
subnet_name         = "mySubnet"
public_ip_name      = "myPublicIP"
nic_name            = "myNIC"

# Add more variables as needed.


##################################################################
/*
resource_group_name = "rg-tsw-test-vnet"
vnet_names = ["tsw_test_vnet1", "tsw_test_vnet2", "tsw_test_vnet3"]
address_space = ["10.0.0.0/16", "10.1.0.0/16", "10.2.0.0/16"]
#subnet_names = ["tsw_test_subnet1", "tsw_test_subnet2", "tsw_test_subnet3"]
#subnet_address = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
subnet_names = [
  {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  },
  {
    name           = "subnet2"
    address_prefix = "10.0.2.0/24"
  },
  {
    name           = "subnet3"
    address_prefix = "10.0.3.0/24"
  }
]
*/