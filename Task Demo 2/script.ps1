param($wf, $web, $item, $config, $eventData)


# This is the code you need to debug. It does not hurt the workflow during prdoction but can be removed of course. 
if($wf-eq$null){import-module "C:\kenaflow\kenaflow.runtime.dll";Invoke-Kenaflow;exit}

if($item["PercentComplete"] -ge 1 ) {
    $originalId = $item["wfitem"].LookupId
    $originalItem = get-pnplistitem -list "Workflow Items" -id $originalId
    $OriginalItem["taskdone"] = $true
    $originalItem.update()
    Write-KFHistory "Task #$($item.id) done and removed"
    Remove-KFItem ## Coming in the next version 1.0.140 ;-)
}
