# Challenge for Azure Developer Students :green_apple:
## Deployment on Azure App Service from a published content and zipped :cloud:	

> [!NOTE]
>
> if you make changes in the code and want to deploy it, consider building with the following commands:
>
> `dotnet publish --configuration Release --output publish`
>
> **Compress destination path and its content:**
>
> `Compress-Archive -Path .\publish\* -DestinationPath WebAppMasterDotNet6.zip -Force`

### Create the specific resource for your web app before doing the deployment

1. **Resource Group:**

   `az group create --name [ResourceGroup Name] --location [name]`

2. **Service Plan and Pricing:**

   `az appservice plan create --name [plan name] --resource-group [ResourceGroup name] --sku B1 --is-linux`

> [!IMPORTANT]
>
> To determine the available runtimes before deployment
>
> `az webapp list-runtimes --linux`

3. **Web App Services:**

   `az webapp create -g [ResourceGroup name] -p [plan name] -n [webapp service name] --runtime DOTNETCORE:6.0"`

### Start deployment

- **Deploy to Azure (whether you have changed the code or not):**

  `az webapp deploy --resource-group [ResourceGroup name] --name [webapp service name] --src-path WebAppMasterDotNet6.zip`

### **Testing**

- **Opening a web browser**

  If everything has gone well, you should be able to navigate to the URL of the App Service and see the following page.

  ![](img/01.png)

## Conclusion

In this challenge, you have the opportunity to create a web project, upload it to Git, and deploy it on Azure App Service from a Git repository. Before deployment, build the project with specified commands, create necessary resources including a resource group, services plan, and pricing. Verify available runtimes with the provided command. Finally, deploy to Azure using the given deployment command, whether code changes were made or not.

**Happy Coding!**



> :wink: **Remember to connect to Azure**

```powershell
az account set --subscription [Subscription ID]
az login
az group list --output table
```

> All commands used here to create your own scripts ​on **​pow​er​sh​el​l** :smile_cat:

```powershell
$RG_Group="[ResourceGroup Name]"
$Location="[name]"
$PlanName="[plan name]"
$WaS="[webapp service name]"

Write-Output "publishing and compressing the project for deployment"
dotnet publish --configuration Release --output publish
Compress-Archive -Path .\publish\* -DestinationPath WebAppMasterDotNet6.zip -Force

Write-Output "Creating resource group: $RG_Group in location: $Location"
az group create --name $RG_Group --location $Location

Write-Output "Creating App Service plan: $PlanName in resource group: $RG_Group"
az appservice plan create --name $PlanName --resource-group $RG_Group --sku B1 --is-linux

Write-Output "Creating App Service: $WaS in resource group: $RG_Group with plan: $PlanName"
az webapp create -g $RG_Group -p $PlanName -n $WaS --runtime DOTNETCORE:6.0

Write-Output "Deploying the compressed file WebAppMasterDotNet6.zip to App Service: $WaS"
az webapp deploy --resource-group $RG_Group --name $WaS --src-path WebAppMasterDotNet6.zip`
```

