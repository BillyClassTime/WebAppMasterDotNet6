$RG_Group="MyAppService01"
$Location="eastus"
$PlanName="miplan01"
$WaS="mywebbmvb2024"

Write-Output "Creating App Service plan: $PlanName in resource group: $RG_Group"
az appservice plan create --name $PlanName --resource-group $RG_Group --sku B1 --is-linux

Write-Output "Creating App Service: $WaS in resource group: $RG_Group with plan: $PlanName"
az webapp create -g $RG_Group -p $PlanName -n $WaS --runtime DOTNETCORE:6.0

Write-Output "Deploying the compressed file WebAppMasterDotNet6.zip to App Service:" $WaS
az webapp deploy --resource-group $RG_Group --name $WaS --src-path WebAppMasterDotNet6.zip