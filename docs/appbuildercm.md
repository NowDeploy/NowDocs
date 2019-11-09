# NowDeploy Application Builder for ConfigMgr

## What is Catalog Manager?

NowDeploy AppBuilder is the command line tool used to read a catalog file (typically created by CatalogMgr), download the requested applications, and load them into your ConfigMgr environment.

## System Requirements

NowDeploy CatalogMgr (Catalog Manager) requires: 

* Windows 7 Service Pack 1 / Windows Server 2008 R2 (or greater).
* Microsoft .NET Framework 4.5+.
* The Microsoft SCCM Console Installed.
* Internet Access.
* Local Administrator Rights.
 
Additionally, the user who executes the application must have the necessary permissions to download applications, save them in the package source folder you define, and add applications to SCCM.

Your Configuration Manager (SCCM) Environment must be running SCCM Current Branch (CB). Builds 1802+ have been tested and are supported. If you require older builds, please contact support.

Your Client Systems that will install/uninstall the packages must be running at least Windows 7 SP1, or the requirements defined by the publisher, whichever is greater. Server Operating systems are also supported.

## Using Application Builder

### Getting Help

To see the available command line parameters, execute ``AppBuild.exe --help`` and press enter.

### Downloading an Application

Assuming no other pre-configuration has been done, the following command line can be used to download and configure a single application:

````
AppBuild -Key <Key> -Application Chrome -Server <CMServer> -SiteCode <SiteCode> -PackageSource <CMPackageSourceUNC>
````

!!! TIP
    If you've configured any of the above parameters according to [Configuring Your System](configuring.md), you do not need to supply them on the command line.


### Downloading the Entire Catalog

When you want to download more than one application from NowDeploy, the best method is to use a catalog file instead of running multiple AppBuild commands in sequence.  The first step in doing this is to first create a catalog file using CatalogMgr.

Once you have your completed XML and you've removed at least one of the Exclude attributes as outlined in the documentation, you can use the -catalog parameter in place of the -application parameter, like so:
 
````
AppBuild -Key <Key> -Catalog catalog.xml -Server <CMServer> -SiteCode <SiteCode> -PackageSource <CMPackageSourceUNC>`
````

!!! TIP
    If you've configured any of the above parameters according to [Configuring Your System](configuring.md), you do not need to supply them on the command line.
