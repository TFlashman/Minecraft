param location string = resourceGroup().location
param registryName string
param sku string = 'Basic'

resource containerRegistry 'Microsoft.ContainerRegistry/registries@2021-09-01' = {
  name: registryName
  location: location
  sku: {
    name: sku
  }
  properties: {
    adminUserEnabled: true
  }
}

output registryLoginServer string = containerRegistry.properties.loginServer
