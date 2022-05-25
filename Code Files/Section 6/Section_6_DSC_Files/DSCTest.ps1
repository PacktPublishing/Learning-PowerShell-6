Configuration DSCTest 
{


    Node 'localhost' {

        # The first resource block ensures that the Web-Server (IIS) feature is enabled.
        WindowsFeature WebServer {
            Ensure = "Present"
            Name   = "Web-Server"
        }

        # The second resource block ensures that the website content copied to the website root folder.
        File WebsiteContent {
            Ensure = 'Present'
            SourcePath = 'c:\Users\sysadmin\default.htm'
            DestinationPath = 'c:\inetpub\wwwroot\'
        }
    }
}