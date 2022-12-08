$data = get-content -path .\dummy_input7.txt
#$data = get-content -path .\input7.txt
$data += "$ cd .."
$dirs=$null
$counter = -1
$cds = $null 
foreach ($cd in $data){ 
    $counter = $counter + 1  
    if ($cd -like "$ cd *" -and $cd -notlike "$ cd .."){
    $cds += @{($cd+$counter) = $counter}
    }

}
$cds = $cds.GetEnumerator() | sort -Property Value 


foreach ($cd in $cds){
    $dir = $null
     $y = $cd.Value  
     for ($x=$data[$y];$x -ne "$ cd .." ; $x=$data[$y++]){

      $dir += @($data[$y])
      Write-Host $dir
         
    }
   $dirs += @{$cd.Name = $dir}
}

$sumTotal = 0
foreach ($cd in $cds) {

    $list = $dirs[$cd.Name]
    
    $sizeList = $null
    foreach ($l in $list) {
        if ($l -match ".*\d+.*" -eq $true) {
           $sizeList = @($sizeList + $l)
        }
    }
    $total = 0 
    foreach ($s in $sizeList){
        $total += [int]$s.Split(" ")[0]
        

        }
     Write-Host "$($cd.Name) = $total"   
    
     if ($total -le 100000)  {
        $sumTotal = $sumTotal + $total
     } 

     Write-Host "Total below 100000" $sumTotal

    }