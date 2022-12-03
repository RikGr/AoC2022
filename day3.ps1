$data = get-content -path .\input3.txt

foreach ($sack in $data){
    $measureItems = $sack | Measure-Object -Character
    $compartment1Amount = $measureItems.Characters / 2
    $compartment1 = $sack.Substring(0,$compartment1Amount)
    $compartment2 = $sack.Substring($compartment1Amount, $compartment1Amount)
    $array1 = $compartment1.ToCharArray()
    $array2 = $compartment2.ToCharArray()
    $check = (Compare-Object -ReferenceObject $array1 -DifferenceObject $array2 -ExcludeDifferent).InputObject | select -Unique
    $mistakes += $check
}

$alphabetLowerCase = 'a'..'z'
$hashTableLowerCase = @{}
$value = 0
foreach ($letter in $alphabetLowerCase) {
    $value = $value + 1
    $hashTableLowerCase += @{"$letter" = $value}
}

$alphabetUpperCase = 'A'..'Z'
$hashTableUpperCase = @{}
$value = 26
foreach ($letter in $alphabetUpperCase) {
    $value = $value + 1
    $hashTableUpperCase += @{"$letter" = $value}
}

$mistakes = $mistakes.ToCharArray()
foreach ($mistake in $mistakes) {
 
    if ($mistake -cmatch “[A-Z]”) {
        $priorityUpperCase += $hashTableUpperCase["$mistake"]
    } 
    else {
        $priorityLowerCase += $hashTableLowerCase["$mistake"]
    }
}

Write-Host "Total priority of mistakes = $($priorityLowerCase+$priorityUpperCase)"


##QUESTION 2##


$total = $data.Count
$numberOfGroups = $total / 3 

for ($i=0 ; $i -lt $total ; $i = $i+3){
$x=$i
$check1 = Compare-Object -ReferenceObject ($data[$x]).ToCharArray() -DifferenceObject ($data[$x+1]).ToCharArray() -ExcludeDifferent
$check2 = Compare-Object -ReferenceObject $check1.InputObject -DifferenceObject ($data[$x+2]).ToCharArray() -ExcludeDifferent
$badges += $check2.InputObject | select -Unique
}



$badges = $badges.ToCharArray()
foreach ($badge in $badges) {
 
    if ($badge -cmatch “[A-Z]”) {
        $priorityUpperCase += $hashTableUpperCase["$badge"]
    } 
    else {
        $priorityLowerCase += $hashTableLowerCase["$badge"]
    }
}

Write-Host "Total priority of badges = $($priorityLowerCase+$priorityUpperCase)"
