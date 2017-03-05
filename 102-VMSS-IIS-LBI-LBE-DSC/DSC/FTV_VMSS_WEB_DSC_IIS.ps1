configuration IIS_DSC  
{
     # ---------------------------------------------------------------------------------

     Import-DscResource -ModuleName xWebAdministration
     Import-DscResource -ModuleName PSDesiredStateConfiguration
     Import-DscResource -ModuleName WebAdministration

     node localhost
     {
          WindowsFeature Web-App-Dev_Feature  # Application Development
          {
               Name = "Web-App-Dev"
               Ensure = "Present"
          }

          WindowsFeature Web-AppInit_Feature  # Application Initialization
          {
               Name = "Web-AppInit"
               Ensure = "Present"
          }

          WindowsFeature Web-Application-Proxy_Feature  # Web Application Proxy
          {
               Name = "Web-Application-Proxy"
               Ensure = "Absent"
          }

          WindowsFeature Web-ASP_Feature  # ASP
          {
               Name = "Web-ASP"
               Ensure = "Present"
          }

          WindowsFeature Web-Asp-Net_Feature  # ASP.NET 3.5
          {
               Name = "Web-Asp-Net"
               Ensure = "Present"
          }

          WindowsFeature Web-Asp-Net45_Feature  # ASP.NET 4.5
          {
               Name = "Web-Asp-Net45"
               Ensure = "Present"
          }

          WindowsFeature Web-Basic-Auth_Feature  # Basic Authentication
          {
               Name = "Web-Basic-Auth"
               Ensure = "Present"
          }

          WindowsFeature Web-Cert-Auth_Feature  # IIS Client Certificate Mapping Authentication
          {
               Name = "Web-Cert-Auth"
               Ensure = "Present"
          }

          WindowsFeature Web-CertProvider_Feature  # Centralized SSL Certificate Support
          {
               Name = "Web-CertProvider"
               Ensure = "Present"
          }

          WindowsFeature Web-CGI_Feature  # CGI
          {
               Name = "Web-CGI"
               Ensure = "Present"
          }

          WindowsFeature Web-Client-Auth_Feature  # Client Certificate Mapping Authentication
          {
               Name = "Web-Client-Auth"
               Ensure = "Present"
          }

          WindowsFeature Web-Common-Http_Feature  # Common HTTP Features
          {
               Name = "Web-Common-Http"
               Ensure = "Present"
          }

          WindowsFeature Web-Custom-Logging_Feature  # Custom Logging
          {
               Name = "Web-Custom-Logging"
               Ensure = "Present"
          }

          WindowsFeature Web-DAV-Publishing_Feature  # WebDAV Publishing
          {
               Name = "Web-DAV-Publishing"
               Ensure = "Present"
          }

          WindowsFeature Web-Default-Doc_Feature  # Default Document
          {
               Name = "Web-Default-Doc"
               Ensure = "Present"
          }

          WindowsFeature Web-Digest-Auth_Feature  # Digest Authentication
          {
               Name = "Web-Digest-Auth"
               Ensure = "Present"
          }

          WindowsFeature Web-Dir-Browsing_Feature  # Directory Browsing
          {
               Name = "Web-Dir-Browsing"
               Ensure = "Present"
          }

          WindowsFeature Web-Dyn-Compression_Feature  # Dynamic Content Compression
          {
               Name = "Web-Dyn-Compression"
               Ensure = "Absent"
          }

          WindowsFeature Web-Filtering_Feature  # Request Filtering
          {
               Name = "Web-Filtering"
               Ensure = "Present"
          }

          WindowsFeature Web-Ftp-Ext_Feature  # FTP Extensibility
          {
               Name = "Web-Ftp-Ext"
               Ensure = "Absent"
          }

          WindowsFeature Web-Ftp-Server_Feature  # FTP Server
          {
               Name = "Web-Ftp-Server"
               Ensure = "Absent"
          }

          WindowsFeature Web-Ftp-Service_Feature  # FTP Service
          {
               Name = "Web-Ftp-Service"
               Ensure = "Absent"
          }

          WindowsFeature Web-Health_Feature  # Health and Diagnostics
          {
               Name = "Web-Health"
               Ensure = "Present"
          }

          WindowsFeature Web-Http-Errors_Feature  # HTTP Errors
          {
               Name = "Web-Http-Errors"
               Ensure = "Present"
          }

          WindowsFeature Web-Http-Logging_Feature  # HTTP Logging
          {
               Name = "Web-Http-Logging"
               Ensure = "Present"
          }

          WindowsFeature Web-Http-Redirect_Feature  # HTTP Redirection
          {
               Name = "Web-Http-Redirect"
               Ensure = "Present"
          }

          WindowsFeature Web-Http-Tracing_Feature  # Tracing
          {
               Name = "Web-Http-Tracing"
               Ensure = "Present"
          }

          WindowsFeature Web-Includes_Feature  # Server Side Includes
          {
               Name = "Web-Includes"
               Ensure = "Present"
          }

          WindowsFeature Web-IP-Security_Feature  # IP and Domain Restrictions
          {
               Name = "Web-IP-Security"
               Ensure = "Present"
          }

          WindowsFeature Web-ISAPI-Ext_Feature  # ISAPI Extensions
          {
               Name = "Web-ISAPI-Ext"
               Ensure = "Present"
          }

          WindowsFeature Web-ISAPI-Filter_Feature  # ISAPI Filters
          {
               Name = "Web-ISAPI-Filter"
               Ensure = "Present"
          }

          WindowsFeature Web-Lgcy-Mgmt-Console_Feature  # IIS 6 Management Console
          {
               Name = "Web-Lgcy-Mgmt-Console"
               Ensure = "Absent"
          }

          WindowsFeature Web-Lgcy-Scripting_Feature  # IIS 6 Scripting Tools
          {
               Name = "Web-Lgcy-Scripting"
               Ensure = "Absent"
          }

          WindowsFeature Web-Log-Libraries_Feature  # Logging Tools
          {
               Name = "Web-Log-Libraries"
               Ensure = "Present"
          }

          WindowsFeature Web-Metabase_Feature  # IIS 6 Metabase Compatibility
          {
               Name = "Web-Metabase"
               Ensure = "Present"
          }

          WindowsFeature Web-Mgmt-Compat_Feature  # IIS 6 Management Compatibility
          {
               Name = "Web-Mgmt-Compat"
               Ensure = "Present"
          }

          WindowsFeature Web-Mgmt-Console_Feature  # IIS Management Console
          {
               Name = "Web-Mgmt-Console"
               Ensure = "Present"
          }

          WindowsFeature Web-Mgmt-Service_Feature  # Management Service
          {
               Name = "Web-Mgmt-Service"
               Ensure = "Present"
          }

          WindowsFeature Web-Mgmt-Tools_Feature  # Management Tools
          {
               Name = "Web-Mgmt-Tools"
               Ensure = "Present"
          }

          WindowsFeature Web-Net-Ext_Feature  # .NET Extensibility 3.5
          {
               Name = "Web-Net-Ext"
               Ensure = "Present"
          }

          WindowsFeature Web-Net-Ext45_Feature  # .NET Extensibility 4.5
          {
               Name = "Web-Net-Ext45"
               Ensure = "Present"
          }

          WindowsFeature Web-ODBC-Logging_Feature  # ODBC Logging
          {
               Name = "Web-ODBC-Logging"
               Ensure = "Present"
          }

          WindowsFeature Web-Performance_Feature  # Performance
          {
               Name = "Web-Performance"
               Ensure = "Present"
          }

          WindowsFeature Web-Request-Monitor_Feature  # Request Monitor
          {
               Name = "Web-Request-Monitor"
               Ensure = "Present"
          }

          WindowsFeature Web-Scripting-Tools_Feature  # IIS Management Scripts and Tools
          {
               Name = "Web-Scripting-Tools"
               Ensure = "Present"
          }

          WindowsFeature Web-Security_Feature  # Security
          {
               Name = "Web-Security"
               Ensure = "Present"
          }

          WindowsFeature Web-Server_Feature  # Web Server (IIS)
          {
               Name = "Web-Server"
               Ensure = "Present"
          }

          WindowsFeature Web-Stat-Compression_Feature  # Static Content Compression
          {
               Name = "Web-Stat-Compression"
               Ensure = "Present"
          }

          WindowsFeature Web-Static-Content_Feature  # Static Content
          {
               Name = "Web-Static-Content"
               Ensure = "Present"
          }

          WindowsFeature Web-Url-Auth_Feature  # URL Authorization
          {
               Name = "Web-Url-Auth"
               Ensure = "Present"
          }

          WindowsFeature Web-WebServer_Feature  # Web Server
          {
               Name = "Web-WebServer"
               Ensure = "Present"
          }

          WindowsFeature Web-WebSockets_Feature  # WebSocket Protocol
          {
               Name = "Web-WebSockets"
               Ensure = "Present"
          }

          WindowsFeature Web-WHC_Feature  # IIS Hostable Web Core
          {
               Name = "Web-WHC"
               Ensure = "Absent"
          }

          WindowsFeature Web-Windows-Auth_Feature  # Windows Authentication
          {
               Name = "Web-Windows-Auth"
               Ensure = "Present"
          }

          WindowsFeature Web-WMI_Feature  # IIS 6 WMI Compatibility
          {
               Name = "Web-WMI"
               Ensure = "Absent"
          }

          #Download and Deployment WebPack


          Script DownloadWebDeploy
          {
            TestScript = {
            Test-Path "C:\WindowsAzure\WebDeploy_amd64_en-US.msi"
             }
        SetScript ={
            $source = "https://download.microsoft.com/download/0/1/D/01DC28EA-638C-4A22-A57B-4CEF97755C6C/WebDeploy_amd64_en-US.msi"
            $dest = "C:\WindowsAzure\WebDeploy_amd64_en-US.msi"
            Invoke-WebRequest $source -OutFile $dest
        }
        GetScript = {@{Result = "DownloadWebDeploy"}}
        DependsOn = "[WindowsFeature]WebServerRole"
    }
    Package InstallWebDeploy
    {
        Ensure = "Present"  
        Path  = "C:\WindowsAzure\WebDeploy_amd64_en-US.msi"
        Name = "Microsoft Web Deploy 3.6"
        ProductId = "{ED4CC1E5-043E-4157-8452-B5E533FE2BA1}"
        Arguments = "ADDLOCAL=ALL"
        DependsOn = "[Script]DownloadWebDeploy"
    }
    Service StartWebDeploy
    {                    
        Name = "WMSVC"
        StartupType = "Automatic"
        State = "Running"
        DependsOn = "[Package]InstallWebDeploy"
    }




          # Note this code does not detect server level IIS overrides (it assumes the IIS level settings
          # have not been overriden).  See the wiki for information about detecting server level changes.

          $logFilePath = 'c:\IISLogs'
          $appPoolRecycleHour = '02'
          
          #================== 'arquivos' site definition ==================
          xWebAppPool arquivos_Pool
          {
               Name = "arquivos"
               AutoStart = $true
               ManagedPipelineMode = "Integrated"
               ManagedRuntimeVersion = "v4.0"
               IdentityType = "ApplicationPoolIdentity"
               Enable32BitAppOnWin64 = $true
               RestartSchedule = @($appPoolRecycleHour+':00:00')  # overriding ""
               IdleTimeout = "00:00:00"  # overriding "00:20:00"
               RestartTimeLimit = "00:00:00"  # overriding "1.05:00:00"
          }


          xWebSite arquivos_Site
          {
               Name = "arquivos"
               Ensure = "Present"
               State = "Started"
               ApplicationPool = "arquivos"
               PhysicalPath = "C:\Flytour\Arquivos"  # This folder must already exist
               LogPath = $logFilePath  # overriding "%SystemDrive%\inetpub\logs\LogFiles"
               DependsOn = "[xWebAppPool]arquivos_Pool"
               BindingInfo = 
                         @(
                              MSFT_xWebBindingInformation 
                              {
                                   Protocol = "http"
                                   Port = "80"
                                   IPAddress = "10.3.1.4"
                              }
                         )
          }

          #================== 'Clube' site definition ==================
          xWebAppPool clubeflytour_Pool
          {
               Name = "clubeflytour"
               AutoStart = $true
               ManagedPipelineMode = "Integrated"
               ManagedRuntimeVersion = "v4.0"
               IdentityType = "ApplicationPoolIdentity"
               Enable32BitAppOnWin64 = $true
               RestartSchedule = @($appPoolRecycleHour+':01:00')  # overriding ""
               IdleTimeout = "00:00:00"  # overriding "00:20:00"
               RestartTimeLimit = "00:00:00"  # overriding "1.05:00:00"
          }


          xWebSite Clube_Site
          {
               Name = "Clube"
               Ensure = "Present"
               State = "Started"
               ApplicationPool = "clubeflytour"
               PhysicalPath = "C:\Flytour\Publish\Clube"  # This folder must already exist
               LogPath = $logFilePath  # overriding "%SystemDrive%\inetpub\logs\LogFiles"
               DependsOn = "[xWebAppPool]clubeflytour_Pool"
               BindingInfo = 
                         @(
                              MSFT_xWebBindingInformation 
                              {
                                   Protocol = "http"
                                   Port = "80"
                                   IPAddress = "10.3.1.4"
                              }
                         )
          }

          #================== 'Default Web Site' site definition ==================
          xWebAppPool DefaultWebSite_Pool
          {
               Name = "Default Web Site"
               AutoStart = $true
               ManagedPipelineMode = "Integrated"
               ManagedRuntimeVersion = "v4.0"
               IdentityType = "ApplicationPoolIdentity"
               Enable32BitAppOnWin64 = $false
               RestartSchedule = @($appPoolRecycleHour+':02:00')  # overriding ""
               IdleTimeout = "00:00:00"  # overriding "00:20:00"
               RestartTimeLimit = "00:00:00"  # overriding "1.05:00:00"
          }


          xWebSite DefaultWebSite_Site
          {
               Name = "Default Web Site"
               Ensure = "Present"
               State = "Started"
               ApplicationPool = "Default Web Site"
               PhysicalPath = "C:\inetpub\wwwroot"  # This folder must already exist
               LogPath = $logFilePath  # overriding "%SystemDrive%\inetpub\logs\LogFiles"
               DependsOn = "[xWebAppPool]DefaultWebSite_Pool"
               BindingInfo = 
                         @(
                              MSFT_xWebBindingInformation 
                              {
                                   Protocol = "http"
                                   Port = "80"
                                   IPAddress = "*"
                              }
                         )
          }

          #================== 'MelhorTarifa' site definition ==================
          xWebAppPool melhortarifafly_Pool
          {
               Name = "melhortarifafly"
               AutoStart = $true
               ManagedPipelineMode = "Integrated"
               ManagedRuntimeVersion = "v4.0"
               IdentityType = "ApplicationPoolIdentity"
               Enable32BitAppOnWin64 = $true
               RestartSchedule = @($appPoolRecycleHour+':03:00')  # overriding ""
               IdleTimeout = "00:00:00"  # overriding "00:20:00"
               RestartTimeLimit = "00:00:00"  # overriding "1.05:00:00"
          }


          xWebSite MelhorTarifa_Site
          {
               Name = "MelhorTarifa"
               Ensure = "Present"
               State = "Started"
               ApplicationPool = "melhortarifafly"
               PhysicalPath = "C:\Flytour\Publish\MelhorTarifa"  # This folder must already exist
               LogPath = $logFilePath  # overriding "%SystemDrive%\inetpub\logs\LogFiles"
               DependsOn = "[xWebAppPool]melhortarifafly_Pool"
               BindingInfo = 
                         @(
                              MSFT_xWebBindingInformation 
                              {
                                   Protocol = "http"
                                   Port = "80"
                                   IPAddress = "*"
                              }
                         )
          }

          #================== 'Portal' site definition ==================
          xWebAppPool flytour.com_Pool
          {
               Name = "flytour.com"
               AutoStart = $true
               ManagedPipelineMode = "Integrated"
               ManagedRuntimeVersion = "v4.0"
               IdentityType = "ApplicationPoolIdentity"
               Enable32BitAppOnWin64 = $true
               RestartSchedule = @($appPoolRecycleHour+':04:00')  # overriding ""
               IdleTimeout = "00:00:00"  # overriding "00:20:00"
               RestartTimeLimit = "00:00:00"  # overriding "1.05:00:00"
          }


          xWebSite Portal_Site
          {
               Name = "Portal"
               Ensure = "Present"
               State = "Started"
               ApplicationPool = "flytour.com"
               PhysicalPath = "C:\Flytour\Publish\Portal"  # This folder must already exist
               LogPath = $logFilePath  # overriding "%SystemDrive%\inetpub\logs\LogFiles"
               DependsOn = "[xWebAppPool]flytour.com_Pool"
               BindingInfo = 
                         @(
                              MSFT_xWebBindingInformation 
                              {
                                   Protocol = "http"
                                   Port = "80"
                                   IPAddress = "*"
                              }
                              MSFT_xWebBindingInformation 
                              {
                                   Protocol = "https"
                                   Port = "443"
                                   IPAddress = "10.3.1.4"
                                   CertificateStoreName = "My"
                                   CertificateThumbprint = "the thumbprint of the cert you want to use"
                              }
                         )
          }

          #================== 'SuaViagem' site definition ==================
          xWebAppPool Suaviagem_Pool
          {
               Name = "Suaviagem"
               AutoStart = $true
               ManagedPipelineMode = "Integrated"
               ManagedRuntimeVersion = "v4.0"
               IdentityType = "ApplicationPoolIdentity"
               Enable32BitAppOnWin64 = $true
               RestartSchedule = @($appPoolRecycleHour+':05:00')  # overriding ""
               IdleTimeout = "00:00:00"  # overriding "00:20:00"
               RestartTimeLimit = "00:00:00"  # overriding "1.05:00:00"
          }


          xWebSite SuaViagem_Site
          {
               Name = "SuaViagem"
               Ensure = "Present"
               State = "Started"
               ApplicationPool = "Suaviagem"
               PhysicalPath = "C:\Flytour\Publish\SuaViagem"  # This folder must already exist
               LogPath = $logFilePath  # overriding "%SystemDrive%\inetpub\logs\LogFiles"
               DependsOn = "[xWebAppPool]Suaviagem_Pool"
               BindingInfo = 
                         @(
                              MSFT_xWebBindingInformation 
                              {
                                   Protocol = "http"
                                   Port = "80"
                                   IPAddress = "10.3.1.4"
                              }
                         )
          }


     }
  }



