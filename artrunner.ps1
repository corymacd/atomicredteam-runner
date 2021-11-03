#start collecting transcript to the relative path (to address cross-platform use of fully qualified paths) 
start-transcript transcript.txt
 
# List of comma seperated values corrosponding to the identifiers here https://github.com/redcanaryco/atomic-red-team/blob/master/atomics/Indexes/Indexes-Markdown/index.md
$modules_to_run = "T1003.008", "T1003.007", "T1552.003", "T1552.004"

# Fetch Atomic Red Team from github
IEX (IWR 'https://raw.githubusercontent.com/redcanaryco/invoke-atomicredteam/master/install-atomicredteam.ps1' -UseBasicParsing);
Install-AtomicRedTeam -getAtomics -Force

# run the tests from the modules_to_run list
ForEach($id in $modules_to_run){ invoke-atomictest $id}
 
