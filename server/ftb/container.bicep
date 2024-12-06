var container1name = 'ftbserver'
var container1image = 'ghcr.io/tflashman/ftb:latest'

resource minecraftserver 'Microsoft.ContainerInstance/containerGroups@2023-05-01' = {
  name: 'kschcontainertest'
  location: resourceGroup().location
  properties: {
    containers: [
      {
        name: container1name
        properties: {
          environmentVariables: [
            { name: 'FTB_MODPACK_ID', value: '123' }
            { name: 'FTB_MODPACK_VERSION_ID', value: '12404' }
            { name: 'ACCEPT_MOJANG_EULA', value: '1' }
          ]
          image: container1image
          resources: {
            requests: {
              cpu: 2
              memoryInGB: json('10')
            }
          }
          ports: [
            {
              port: 80
            }
            {
              port: 25565
            }
          ]
          volumeMounts: [
            {
              name: 'filesharevolume'
              mountPath: '/var/lib/minecraft'
            }
          ]
        }
      }
    ]
    osType: 'Linux'
    ipAddress: {
      type: 'Public'
      ports: [
        {
          protocol: 'tcp'
          port: 80
        }
        {
          protocol: 'tcp'
          port: 25565
        }
      ]
      dnsNameLabel: 'kschcontainertest'
    }
    volumes: [
      {
        name: 'filesharevolume'
        azureFile: {
          shareName: 'ftbshare'
          storageAccountName: 'kschftb'
          storageAccountKey: '' // put account key here
        }
      }
    ]
  }
}
