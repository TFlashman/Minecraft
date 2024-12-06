## Instructions used

### to create dockerfile:
https://github.com/flobernd/docker-minecraft-ftb/blob/master/minecraft-ftb/data/Dockerfile



### commands to create container registry:

#### create azure file share:

# Change these four parameters as needed

```
ACI_PERS_RESOURCE_GROUP=kschtest
ACI_PERS_STORAGE_ACCOUNT_NAME=kschftb
ACI_PERS_LOCATION=northeurope
ACI_PERS_SHARE_NAME=ftbshare
```

# Create the storage account with the parameters
```
az storage account create --resource-group $ACI_PERS_RESOURCE_GROUP --name $ACI_PERS_STORAGE_ACCOUNT_NAME --location $ACI_PERS_LOCATION --sku Standard_LRS
```

# Create the file share


# get storage account key

```
STORAGE_KEY=$(az storage account keys list --resource-group $ACI_PERS_RESOURCE_GROUP --account-name $ACI_PERS_STORAGE_ACCOUNT_NAME --query "[0].value" --output tsv)
echo $STORAGE_KEY
```


##
build for architecture other than the one running on your machine:
example:
```
docker build --platform=linux/amd64 -t ghcr.io/tflashman/ftb .
```