#start collecting transcript to the relative path (to address cross-platform use of fully qualified paths) 
start-transcript -path "./transcript.txt"

if($IsWindows -eq $true) { $PSDefaultParameterValues = @{"Invoke-AtomicTest:PathToAtomicsFolder"="C:\AtomicRedTeam\atomics"}}
 
# List of comma seperated values corrosponding to the identifiers here https://github.com/redcanaryco/atomic-red-team/blob/master/atomics/Indexes/Indexes-Markdown/index.md
$modules_to_run = "G0102"
 
function Invoke-ArtTest() {
    param ($id)
    
    write-host "TEST $id - Getting Prereqs..."
    invoke-atomictest $id -GetPrereqs
    write-host "TEST $id - Running Test..."
    invoke-atomictest $id 
}

# run the tests from the modules_to_run list

ForEach($id in $modules_to_run){ invoke-arttest $id }

Invoke-AtomicTest G0102 -CleanUp