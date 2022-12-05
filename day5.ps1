$data = get-content -path .\input5.txt
#$data = get-content -path .\dummy_input5.txt

foreach ($row in $data) { 

    if ($row -notmatch '\d' ) {
      $stack1 += ($row[1])
      $stack2 += ($row[5])
      $stack3 += ($row[9])
      $stack4 += ($row[13])
      $stack5 += ($row[17])
      $stack6 += ($row[21])
      $stack7 += ($row[25])
      $stack8 += ($row[29])
      $stack9 += ($row[33])
    }
}

$stack1 = $stack1.trim()
$stack2 = $stack2.trim()
$stack3 = $stack3.trim()
$stack4 = $stack4.trim()
$stack5 = $stack5.trim()
$stack6 = $stack6.trim()
$stack7 = $stack7.trim()
$stack8 = $stack8.trim()
$stack9 = $stack9.trim()

foreach ($row in $data){ 
  if ($row[0] -eq 'm') {
    $amount = ($row.Split()[1])
    $orgStackNumber = $row.Split()[3]
    $destStackNumber = $row.Split()[5]
      	for ($i=0; $i -lt [int]$amount; $i++){
          $orgStack = (Get-Variable -Name "stack$orgStackNumber").Value
          $destStack= (Get-Variable -Name "stack$destStackNumber").Value 
          $orgStackValue = $orgStack[0]
          $orgStack = $orgStack.subString(1)
          Write-Host "new OrgStack $orgStack"
          $destStack =  $orgStackValue + $destStack
          Write-Host "new destStack $destStack"
          Set-Variable -Name "stack$destStackNumber" -Value $destStack
          Set-Variable -Name "stack$orgStackNumber" -Value $orgStack
        }
    }
}
Write-Host "Answer 1:  $($stack1[0])$($stack2[0])$($stack3[0])$($stack4[0])$($stack5[0])$($stack6[0])$($stack7[0])$($stack8[0])$($stack9[0])"

##Question 2

foreach ($row in $data){ 
  if ($row[0] -eq 'm') {
    $amount = ($row.Split()[1])
    $orgStackNumber = $row.Split()[3]
    $destStackNumber = $row.Split()[5]
    $orgStack = (Get-Variable -Name "stack$orgStackNumber").Value
    $destStack= (Get-Variable -Name "stack$destStackNumber").Value 
    $orgStackValue = $orgStack.SubString(0,[int]$amount)
    $orgStack = $orgStack.subString($amount)
    Write-Host "new OrgStack $orgStack"
    $destStack =  $orgStackValue + $destStack
    Write-Host "new destStack $destStack"
    Set-Variable -Name "stack$destStackNumber" -Value $destStack
    Set-Variable -Name "stack$orgStackNumber" -Value $orgStack
    }
}

Write-Host "Answer 2: $($stack1[0])$($stack2[0])$($stack3[0])$($stack4[0])$($stack5[0])$($stack6[0])$($stack7[0])$($stack8[0])$($stack9[0])"