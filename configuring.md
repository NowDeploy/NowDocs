# Configuring Your System

Out of the box, no pre-configuration is necessary for AppBuilder.  Doing a little work once, however, will save you time moving forward if you plan on using a specific computer regularly for AppBuilder tasks. 
   
The following table outlines where you can configure AppBuilder settings so that they do not need to be defined at the command prompt as a parameter:

|Parameter|Registry Path|
|---|---|
|Key|(HKLM\|HCKU)\\Software\\NowDeploy\\AppBuilder\\Key|
|PackageSource|(HKLM\|HCKU)\Software\NowDeploy\AppBuilder\PackageSource|
|Server|(HKLM\|HCKU)\Software\NowDeploy\AppBuilder\Server|
|SiteCode|(HKLM\|HCKU)\Software\NowDeploy\AppBuilder\SiteCode|

When executed, AppBuilder will give preference to the parameters in the following order (#1 being the highest priority):

1. Command line (parameter of CatalogMgr or AppBuild)
1. HKEY_CURRENT_USER
1. HKEY_LOCAL_MACHINE
 
If the Server and SiteCode parameters are not defined on the command prompt and are also not configured in the Windows Registry, it will look at the following key:

`HKCU\Software\Microsoft\ConfigMgr10\AdminUI\MRU\1`

This key should be the last server and site that you attached to.

!!! Warning
    If you use your console to connect to multiple SCCM environments, allowing AppBuild to guess at which one you'd like to use may cause the application to be configured in the incorrect environment.