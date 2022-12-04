$data = import-csv -path .\input4.csv -Delimiter ","

#Question 1 
$counter = 0 
foreach ($pair in $data) {
    $elf1 = $pair.Elf1.Split("-")[0]..$pair.Elf1.Split("-")[1]
    $elf2 = $pair.Elf2.Split("-")[0]..$pair.Elf2.Split("-")[1]

    $elf1Amount = $elf1.Count
    $elf2Amount = $elf2.Count

    $check = Compare-Object $elf1 $elf2 -ExcludeDifferent

    $amountOfEqual = ($check.InputObject).Count

    if ($amountOfEqual -eq $elf1Amount -or $amountOfEqual -eq $elf2Amount) {

        $counter++
    }
}
Write-Host "Amount of fully contained pairs: $counter"

#Question 2 

$counter2 = 0
foreach ($pair in $data) {
    $elf1 = $pair.Elf1.Split("-")[0]..$pair.Elf1.Split("-")[1]
    $elf2 = $pair.Elf2.Split("-")[0]..$pair.Elf2.Split("-")[1]

    $check = Compare-Object $elf1 $elf2 -ExcludeDifferent
    
    if ($check -ne $null) {

        $counter2++
    }
}
Write-Host "Amount of overlapping pairs: $counter2"