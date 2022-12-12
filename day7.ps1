$data = get-content -path .\input7.txt

class Directory {
    [string]$Name
    [int]$Size
}

[Directory[]]$dirs =  [System.Collections.ArrayList]@()
[string]$currentDir="/"

foreach ($row in $data)
{
    Write-Output($row)
    if ($row -eq "$ cd /")
    {
        $currentDir = "/"
        if (($dirs | Where-Object {$._Name -eq $currentDir}) -eq $null) # Not adding yet
        {
            $directory = New-Object Directory
            $directory.Name = $currentDir
            $directory.Size = 0
            $dirs += $directory
        }
    }
    elseif ( $row -eq "$ cd ..")
    {
        # currentPath = "/A/B" -> "/A"
        $lastIndex = $currentDir.LastIndexOf('/')
        $currentDir = $currentDir.Substring(0, $lastIndex)
    }
    elseif ($row -like "$ cd *")
    {
        $newdir = $row.Split()[2]
        if ($currentDir -match '/$') # Doesn't work yet
        {
            $currentDir += $newdir
        }
        else 
        {
            $currentDir += "/" + $newdir
        }

        if (($dirs | Where-Object {$_.Name -eq $currentDir}) -eq $null) # Not adding yet
        {
            $directory = New-Object Directory
            $directory.Name = $currentDir
            $directory.Size = 0
            $dirs += $directory
        }
    }
    elseif ( $row -like "dir *")
    {
        if ($currentDir -match '/$')
        {
            $newdir = $currentDir + $row.Split()[1]
        }
        else 
        {
            $newdir = $currentDir + "/" + $row.Split()[1]
        }

        if (!$dirs | Where-Object {$_.Name -eq $newDir})
        {
            $directory = New-Object Directory
            $directory.Name = $newdir
            $directory.Size = 0
            $dirs += $directory
        }
    }
    elseif ($row -match "[0-9]+\ *")
    {
        $length = $dirs.length
        Write-Output "Total length = $length"
        
        $directory = $dirs | Where-Object {$_.Name -eq $currentDir} 
        $directory.Size += $row.Split(" ")[0]
    }
}

$totalSizes= [System.Collections.ArrayList]@()
foreach ($dir in $dirs){
  
    $totalSizeOfDir = (($dirs | where {$_.Name.startsWith($dir.Name)}).Size | Measure-Object -Sum).Sum 

    $totalSizes.Add($totalSizeOfDir)
}

$totalUnder100K= [System.Collections.ArrayList]@()
foreach($total in $totalSizes){ 
    if ($total -le 100000) {

        $totalUnder100K.Add($total)
    } 
}

Write-Host ($totalUnder100K | Measure-Object -Sum).Sum 

#question 2: 

$totalUsed = ($dirs.Size | Measure-Object -Sum).Sum
$currentFree = 70000000 - $totalUsed
$needed = 30000000 - $currentFree

foreach($size in $totalSizes){
    $x= $x+1
  $check += @{ "$size $x" = ($size - $needed) }
}

$check | Sort-Object $_.Value -Descending
$check = $check.GetEnumerator() | sort -Property Value  
Write-Host "Size of dir that can be deleted: $((($check.GetEnumerator() | Where-Object -Property  Value -gt  0)[0].Name).Split(" ")[0])"
