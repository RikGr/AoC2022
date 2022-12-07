#Question 1 
$data = get-content -path .\input6.txt
$counter = 0 
DO {
$makeSet = ($data.Substring(0,4)).ToCharArray() | Sort-Object -Unique
$data = $data.Substring(1)
$counter++
}
WHILE ($makeSet.Count -lt 4) 

Write-Host "Marker 1 is $($counter + 3)"

#Question 2 
$data = get-content -path .\input6.txt
$counter = 0 
DO {
$makeSet = ($data.Substring(0,14)).ToCharArray() | Sort-Object -Unique
$data = $data.Substring(1)
$counter++
}
WHILE ($makeSet.Count -lt 14) 

Write-Host "Marker 2 is $($counter + 13)"