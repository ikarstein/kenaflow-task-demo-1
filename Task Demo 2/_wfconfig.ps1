@{
	# A workflow will only work with the following version of kenaflow. After you tested your workflow with
	#  a new version of kenaflow you can change the following setting.
	Version = "1.0";

	# set it to $false, if the workflow should run
	Ignore = $false; 
	
	# set it to a meaningful name
	Name = "Task Demo 2"; 
	
	# what SharePoint do you use? Possible values: "sp2013" or "sp2016" or "spo"
	Platform = "sp2016"; 
	
	# a unique (!) id (type 'System.Guid') for this workflow. must be unique in YOUR environment. 
	# Use "[guid]::newGuid().tostring('d')" to create a GUID in Powershell. 
	Id = "0963a8cb-f1b0-4cbd-80be-9bf791ae7e62"; 
	
	# option. can be used to specify the folder where the workflow scripts are in. the workflow directory 
	# (where the _wfconfig.ps1 is in) is used if empty. 
	#ScriptFolder = ""; 
	
	# "Time before execution" => minimal time difference IN SECONDS between two executions of the workflow
	TBE = 5; 
	
	# CRON-style pattern for execution scheduling. Please consult our documentation to get more infos on that. 
	#Cron = "60 * * * * *"; 
	
	# This can be used to specify a custom PowerShell libary file that will be loaded before workflow 
	# script execution.
	CustomLibrary = ""; 
	
	# Can be used to mark this workflow as "in debug" for use with cmdlet Get-KFInDebug -WorkflowDebugState
	#Debug = $false; 
	
	#DontSerialize = $false;
	
	#UserProfileCacheLifetime = 60; #In seconds. If not specified the global setting from kenaflow.conf is used

	# If set to $false the workflow will continue with the next item on workflow script errors. 
	# Default ist $true ("stop workflow on script errors")
	#StopWorkflowOnScriptError = $true; 

	
	# The following two parameters can be used to specify credentials
	# however it is possible to store credentials in a protected fashion using the parameters --setusername 
	# and --setpassword on kenaflow.exe while running the program inside a workflow folder that contains 
	# _wfconfig.ps1. this will create a file _wfconfig-cred.ps1 that contains encrypted credentials. the 
	# credentials can only decrypted on the same machine. on other machines the file is worthless.
	#spUser = "";
	#spPwd = '';

	# only if platform is 'spo' = SharePoint Online
	#spoAppId = ""; 
	# only if platform is 'spo' = SharePoint Online
	#spoAppSecret = ''; 

	
	# Full URL to the SharePoint web where the workflow list is in
	Web = "https://intranet16.sharepoint.farm/sites/taskdemo"; 
	
	# Title of the SharePoint list where the workflow operates on. This list is called "workflow list" 
	List = "Workflow Tasks"; 
	

	

	# List of mail addresses that will receive mails in case of workflow internal errors.
    AlertAddresses = @(); 
	# can be used to overwrite the global settings.
	#AlertFloodProtection = 3600; 
	# Address of the sender of mails that the workflow sends. If empty it will be taken from the kenaflow global config
	MailFrom = ""; 
	# Address to which uses can reply to. If empty it will be taken from the kenaflow global config
	MailReply = ""; 

	# Specified whether the Workflow needs Remote Event Receiver to execute the workflow scripts immediately after a change in SharePoint. 
	RER = $false; 
	
	# Optional, but must be used if multipe workflow listen to the same list!!
	#RERHandlerName = "kenaflow_wf1"; 
	
	# This can be used to overwrite the default setting from the kenaflow config file. This host name is used from SharePoint to report remote events.
	#RERHost = ""; 
	
	# This can be used to receive Remote Events by SSL. Additional config with NETSH is required!!
	#RERHostUsesSSL = $false; 
	
	# Port for remote event handling
	#RERHostPort = 80; 

	
	
	Script = "script.ps1";
	
	#LASTMODIFIED, query, all, statemachine or site  // (empty) => default is "lastmodified"
	Type = "lastmodified"; 

	
	# if false the 'last modified' flag file is used
	#LastModifiedBasedOnLastRun = true; 
	
	# Count of list items queried from SharePoint at one request. -1 = use default
	#ItemBatchCount = -1; 
	
	# Amount of time before each item is checked to be processed. -1 = use default; 0 = check immediately
	#ItemReCheckTime = -1; 
	
	# After this amount of time elasped the workflow execution will be stopped; -1 = use default
	#MaxExecutionTime = -1; 

	
	#You can specify CAML instead. {{ }} tokens are processed at runtime
	#Query="<Where><And><And><Eq><FieldRef Name='Title'/><Value Type='Text'>Test</Value></Eq><Gt><FieldRef Name='Modified'/><Value Type='DateTime' IncludeTimeValue='TRUE'><Today/></Value></Gt></And>" +
	#      "<Neq><FieldRef Name='Editor'/><Value Type='Lookup'><UserId/></Value></Neq></And></Where>";
	
		



	
	# debug settings 
	
	# if not specified here the default setting from kenaflow will be used.
	#writeMailsToDiskDuringDebug = $true; 
	
	# if not specified here the default setting from kenaflow will be used.
	#alwaysWriteMailsToDiskInsteadSending = $false; 
	
	# can be used to redirect all mails to the specified account(s) 
	#redirectAllMails = @(); 
}

if(!$kenaflow){import-module "C:\kenaflow\kenaflow.runtime.dll";Test-KFConfig;exit}
