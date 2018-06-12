@{
	# A workflow will only work with the following version of kenaflow. After you tested your workflow with
	#  a new version of kenaflow you can change the following setting.
	Version = "1.0";

	# set it to $false, if the workflow should run
	Ignore = $false; 
	
	# set it to a meaningful name
	Name = "Task Demo 1"; 
	
	# what SharePoint do you use? Possible values: "sp2013" or "sp2016" or "spo"
	Platform = "sp2016"; 
	
	# a unique (!) id (type 'System.Guid') for this workflow. must be unique in YOUR environment. 
	# Use "[guid]::newGuid().tostring('d')" to create a GUID in Powershell. 
	Id = "6ddd44aa-bf49-430b-ac2b-06ae89ee2f81"; 
	
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
	# however it is possible to store credentials in a protected fashion using the parameters --setusername and --setpassword on kenaflow.exe
	# while running the program inside a workflow folder that contains _wfconfig.ps1. this will create a file _wfconfig-cred.ps1 that contains encrypted
	# credentials. the credentials can only decrypted on the same machine. on other machines the file is worthless.
	#spUser = "";
	#spPwd = '';

	
	# only if platform is 'spo' = SharePoint Online
	#spoAppId = ""; 
	
	# only if platform is 'spo' = SharePoint Online
	#spoAppSecret = ''; 

	

	# Full URL to the SharePoint web where the workflow list is in
	Web = "https://intranet16.sharepoint.farm/sites/taskdemo"; 
	
	# Title of the SharePoint list where the workflow operates on. This list is called "workflow list" 
	List = "Workflow Items"; 
	

	# a list for global config values
	ConfigList = "WFconfig"; 
	
	# a list that can be used to store data
	DataList = "WFData"; 
	
	# a list that can be used to record log information
	HistoryList = "WFHistory"; 
	
	# can be used to create and assign a workflow task list to this workflow
	#TaskList = "WFTasks"; 
	
	# Workflow errors will be stored in this SharePoint list
	ErrorList = "WFErrors";

	
	# Can be uses to define default config entries that will be deployed to the config list if the workflow config list is created by kenaflow (kenaflow.exe)
	ConfigListDefaults = @{
		"kenaflow"="cool"
	}; 

	
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

	# lastmodified, query, all, STATEMACHINE or site  // (empty) => default is "lastmodified"
	Type = "statemachine"; 


	# lookup field in the workflow list that represents the current item state 
	StateField = "State"; 

	# list that holds all possible states
    StateList = "WFStates"; 


	# if false the 'last modified' flag file is used
	#LastModifiedBasedOnLastRun = true; 
	
	# Count of list items queried from SharePoint at one request. -1 = use default
	#ItemBatchCount = -1; 
	
	# Amount of time before each item is checked to be processed. -1 = use default; 0 = check immediately
	#ItemReCheckTime = -1; 
	
	# After this amount of time elasped the workflow execution will be stopped; -1 = use default
	#MaxExecutionTime = -1; 

	
	States = @{
		"(empty)" = @{
			# You can define the execution order for states by defining this key. 
			# All states that have not definied this setting the number 0 is used. 
			# Except for state "(empty)" for which -1 is used by default. So (empty) will be executed first. 
			# All scripts with the same "ExecutionOrder" (or none which means "0") are executed by the order of their keys.
			#ExecutionOrder = 100; 
			
			# After this run time SharePoint list items will be checked for their corrent state before processing
			#ItemReCheckTime = -1;
			
			# After this amount of time elasped the workflow execution will be stopped; -1 = use default
			#MaxExecutionTime = -1; 
			
			# Count of list items queried from SharePoint at one request. -1 = use default
			#ItemBatchCount = -1; 
			
			# Can be used to mark this state as "in debug" for use with cmdlet Get-KFInDebug -WorkflowStateDebugState
			#Debug = $false; 
			
			#LastModifiedBasedOnLastRun = true; #if false the 'last modified' flag file is used
		};
		"1.0" = @{
			# States can be disabled for processing by setting this to $true. Default is $false.
			Ignore = $false;  

			# if not set the State key ("1.0") will be used
			Title = "Create Task";  
			
			# query, lastmodified, all or (empty)
			Type="all"; 
			
			# will be translated into CAML
			#Query = ""; 
			
			# if empty the script must be named as "S_<state><your text or noting>.ps1"
			#Script = ""; 
			
			# Time Before Execution. Each state remembers the last runtime in a text file. The state script will not execute until this amount of seconds elapsed sind last run.
			#TBE = 30; 
			
			# CRON-style pattern for execution scheduling. Please consult our documentation to get more infos on that. 
			#Cron = "60 * * * * *"; 
		};
        "2.0" = @{
            Title = "Waiting for Task Completion";
        };
		"3.0" = @{
		    Ignore = $true;
            Title = "Workflow Finished";
		};
		
	}
	
	<#
	# this section can be used to create Tasks that are used inside the workflow to get data from users 
	Tasks = @{
		"Task1" = @{
			#ContentTypeName = "kenaflowTaskWF3Task1"; #default is "kenaflowTask<workflow-name><task-name>"
			Fields = @{
				# it's the display name of the field.
				"Field1" = @{ 
					Order = 1;
					
					FieldInternalName = "kenaflowTaskWF3Task1Field1"
					
					FieldType = "Text"
					
					# this is used during field creation
					CreationParameter = "Required='FALSE'" 
					
					# this is used during field creation
					#ValueParameter = "<Default/>" 
				};
				
				"Field2"= @{
					Order = 2;
					FieldType = "DateTime"
				};
				"Field3"= @{
					Order = 3;
					FieldType = "Note"
				};
				"Field4"= @{
					Order = 4;
					FieldType = "User"
				};
				"Field5"= @{
					Order = 5;
					FieldType = "Boolean"
				};
				"Field6"= @{
					Order = 6;
					FieldType = "Integer"
				};
			}
		}
	}
	#>

	# Some item permission related Cmdlets in workflows can simply set "CRUD" +M (Manage) +A (Approve) 
	#  permissions by specifying some characters from set [C, R, U, D, M, A]. They refer to permission 
	#  set that the Site Collection administrator has to create. They must also be named here
	PermissionSetCreate="kenaflow Create";
	PermissionSetRead="kenaflow Read";
	PermissionSetUpdate="kenaflow Update";
	PermissionSetDelete="kenaflow Delete";
	PermissionSetManage="kenaflow Manage";
	PermissionSetApprove="kenaflow Approve";

	# debug settings 
	
	# if not specified here the default setting from kenaflow will be used.
	#writeMailsToDiskDuringDebug = $true; 
	
	# if not specified here the default setting from kenaflow will be used.
	#alwaysWriteMailsToDiskInsteadSending = $false; 
	
	# can be used to redirect all mails to the specified account(s) 
	#redirectAllMails = @(); 
	
}

if(!$kenaflow){import-module "C:\kenaflow\kenaflow.runtime.dll";Test-KFConfig;exit}
