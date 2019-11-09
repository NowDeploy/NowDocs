# NowDeploy Documentation

This guide is meant to provide you with all the information you'll need to run the NowDeploy software in your environment.  To continue, select the appropritae item from the left navigation bar, or use the search box to find specific information.

## Getting Started

If you're just getting started with NowDeploy, we recommend the following path to get up and running as quickly as possible:

1. If you haven't already, register an account and get a license key.
1. Download the Catalog Manager (CatalogMgr) and NowDeploy Application Builder (AppBuild).
1. From the folder you've download into, prepare your catalog by executing:  
    ````
    CatalogMgr -Key <Key> -Catalog catalog.xml
    ````  
1. Open the catalog.xml in your favorite text editor, and change the value of ***exclude*** on any applications you'd like included in your catalog.
1. From the same folder as above, import your new applications into Configuration Manager by executing:  
    ````
    AppBuild -Key <Key> -Catalog catalog.xml -Server <CMServer> -SiteCode <SiteCode> -PackageSource <CMPackageSourceUNC>
    ````  

## Can't find what you need?

If you can't find what you're looking for, please contact us by emailing <support@nowdeploy.com> or visiting our [support forums](https://support.nowdeploy.com/).

