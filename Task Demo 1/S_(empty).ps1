param($wf, $states, $web, $item, $eventData, $config)


# This is the code you need to debug. It does not hurt the workflow during prdoction but can be removed of course. 
if($wf-eq$null){import-module "C:\kenaflow\kenaflow.runtime.dll";Invoke-Kenaflow;exit}

Set-KFState "1.0"
