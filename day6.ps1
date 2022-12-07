$data = get-content -path .\input6.txt
$counter = 0 
DO {
$makeSet = ($data.Substring(0,14)).ToCharArray() | Sort-Object -Unique
$data = $data.Substring(1)
$counter++
Write-Host $counter
}
WHILE ($makeSet.Count -lt 14) 

Write-Host "Marker is $($counter + 13)"

