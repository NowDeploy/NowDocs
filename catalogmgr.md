# NowDeploy Catalog Manager

## What is Catalog Manager?

NowDeploy CatalogMgr is a command line tool that will allow you to create and maintain a catalog file, saved as plain text XML, used by NowDeploy AppBuilder to download and configure applications in our environment.

## System Requirements

NowDeploy CatalogMgr (Catalog Manager) requires: 

* Windows 7 Service Pack 1 / Windows Server 2008 R2 (or greater).
* Microsoft .NET Framework 4.5+.
* Internet Access (direct, or through a proxy).
* Local administrator access on the system it is excuted.
 
You do not need to run CatalogMgr on a site server, nor on a system that has any Configuration Manager components installed.

## Using for the First Time

The first time you use CatalogMgr it will be to create a new catalog file.  This can be done by executing a command similar to:
    ````
    CatalogMgr -Key <Key> -Catalog catalog.xml  
    ````  

A new file named catalog.xml will be created in the folder you specify. This file can be named anything you'd like (following normal Windows file naming rules) and can be stored in any path that you have access to write to.

!!! TIP
    If you've configured the **key** parameter according to [Configuring Your System](configuring.md), you do not need to supply it on the command line.

Once the file has been created, open it using any standard text or XML editor, such as Notepad or Notepad++.  It will look similar to the following snippet:

````
<NowDeploy>
  <Applications>
    <Application Path="/" Exclude="True">7zip</Application>
    <Application Path="/" Exclude="True">chrome</Application>
  </Applications>
</NowDeploy>
````  
  
### Exclude Attribute
You'll notice that each application has the attribute Exclude with a value of True.  This implies that the tools that will later read this file will not download and import this application for you.  This is the default and is configured this way so that all of the applications aren't mistakenly downloaded and configured when this isn't the desired result.  You may remove this attribute or set it to False on any application that you'd like to later have configured.
   
### Path Attribute
You'll also notice a Path attribute with a default value of /. When this application is imported into Configuration Manager (SCCM), the path attribute will be used to determine which folder it will be created it.  The default value will add the application to the root "Applications" node.  If you'd like it created elsewhere, include the path here, always beginning with a forward slash, and using a forward slash to separate folders in a path.  For example, you could use a path such as  /Free Applications/Web Browsers for Google Chrome and Mozilla Firefox.  The path will be created if it does not exist.

## Subsequent Usage

During each subsequent use of the tool, if the catalog file specified exists, it will update the existing file and not overwrite any changes that you've made.  Specifically, the following actions will be taken for each application in the catalog:

|Scenario|Action|
|---|---|
|Application from NowDeploy already in XML file|No change to this entry in the XML|
|Application in XML is no longer available through NowDeploy|Attribute Exclude is added with a value of True|
|New application is available through NowDeploy but not in XML|Application entry added with Exclude value of True|

CatalogMgr does not need to be rerun regularly.  The resultant XML file is not application version specific, so you do not need to update or regenerate it when newer versions of Chrome, Firefox, or 7-zip (for example) are released.

You should update your XML with CatalogMgr when you change your tier with NowDeploy, when new applications have been released by NowDeploy, or if you get errors when downloading applications that they are no longer available.

## Viewing Available Applications

Running CatalogMgr.exe with only a key parameter (or with no parameters, if a key is defined in the Windows Registry) will output a list of applications that your license key has access to.
