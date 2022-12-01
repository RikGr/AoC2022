$data = get-content -path .\adventofcode22\input1.1.txt
$data = [string]$data
$data = $data.Split("  ")

foreach ($set in $data) { 
    $arrSet = $set.Split( )

    $sum = ($arrSet | Measure-Object -sum).Sum 
    
    foreach ($s in $sum) {
        $total += @($sum)
    }
}

#Find highest amount of calories 
$total | Measure-Object -Maximum

#Find top three amount of calories 

#number 1: 
$number1 = ($total | Measure-Object -Maximum).Maximum
Write-Host $number1
#number 2: 
$total = $total | Where-Object { $_ –ne "$number1" }
$number2 = ($total | Measure-Object -Maximum).Maximum
Write-Host $number2
#number3: 
$total = $total | Where-Object { $_ –ne "$number2" }
$number3 = ($total | Measure-Object -Maximum).Maximum
Write-Host $number3

#Total amount of top 3
$TopThreeTotal = $number1 + $number2 + $number3 
Write-Host $TopThreeTotal 
