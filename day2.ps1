# A = Rock
# B = Paper
# C = Scissor
# X = Rock = 1 
# Y = Paper = 2 
# Z = Scissor = 3 
# Lose = 0
# Draw = 3 
# Win = 6
#P2 = you

$data = import-csv -path .\input2.csv -Delimiter ";"
$sum = $null

foreach ($attempt in $data) {
    #equal games
    if ($attempt.P2 -eq "X" -and $attempt.P1 -eq "A") {
        $result = 3
        #determine extra Points based on choice    
        switch ($attempt.P2) {
            "X" { $extraPoints = 1 }
            "Y" { $extraPoints = 2 }
            "Z" { $extraPoints = 3 }
        }
        $total = $result + $extraPoints  
        Write-Host "Equal game!" $total
    }
    if ($attempt.P2 -eq "Y" -and $attempt.P1 -eq "B") {
        $result = 3
        #determine extra Points based on choice    
        switch ($attempt.P2) {
            "X" { $extraPoints = 1 }
            "Y" { $extraPoints = 2 }
            "Z" { $extraPoints = 3 }
        }
        $total = $result + $extraPoints  
        Write-Host "Equal game!" $total
    }
    if ($attempt.P2 -eq "Z" -and $attempt.P1 -eq "C") {
        $result = 3
        #determine extra Points based on choice    
        switch ($attempt.P2) {
            "X" { $extraPoints = 1 }
            "Y" { $extraPoints = 2 }
            "Z" { $extraPoints = 3 }
        }
        $total = $result + $extraPoints  
        Write-Host "Equal game!" $total
    }

    #Rock wins or loses (and get only Rock points)
    if ($attempt.P2 -eq "X" -and $attempt.P1 -eq "C") {
        $result = 6
        switch ($attempt.P2) {
            "X" { $extraPoints = 1 }
            "Y" { $extraPoints = 2 }
            "Z" { $extraPoints = 3 }
        }
        $total = $result + $extraPoints  
        Write-Host "Rock wins!" $total      
    }
    if ($attempt.P2 -eq "X" -and $attempt.P1 -eq "B") {
        $result = 0
        switch ($attempt.P2) {
            "X" { $extraPoints = 1 }
            "Y" { $extraPoints = 2 }
            "Z" { $extraPoints = 3 }
        }
        $total = $result + $extraPoints  
        Write-Host "Rock Loses!" $total      
    }
    
    #Paper wins or loses (and get only paper points)
    if ($attempt.P2 -eq "Y" -and $attempt.P1 -eq "A") {
        $result = 6
        switch ($attempt.P2) {
            "X" { $extraPoints = 1 }
            "Y" { $extraPoints = 2 }
            "Z" { $extraPoints = 3 }
        }
        $total = $result + $extraPoints  
        Write-Host "Paper wins!" $total      
    }
    if ($attempt.P2 -eq "Y" -and $attempt.P1 -eq "C") {
        $result = 0
        switch ($attempt.P2) {
            "X" { $extraPoints = 1 }
            "Y" { $extraPoints = 2 }
            "Z" { $extraPoints = 3 }
        }
        $total = $result + $extraPoints  
        Write-Host "Paper loses!" $total      
    }

    #Scissor wins or loses (and get only scissor points)
    if ($attempt.P2 -eq "Z" -and $attempt.P1 -eq "B") {
        $result = 6
        switch ($attempt.P2) {
            "X" { $extraPoints = 1 }
            "Y" { $extraPoints = 2 }
            "Z" { $extraPoints = 3 }
        }
        $total = $result + $extraPoints  
        Write-Host "Scissor wins" $total      
    }
    if ($attempt.P2 -eq "Z" -and $attempt.P1 -eq "A") {
        $result = 0
        switch ($attempt.P2) {
            "X" { $extraPoints = 1 }
            "Y" { $extraPoints = 2 }
            "Z" { $extraPoints = 3 }
        }
        $total = $result + $extraPoints  
        Write-Host "Scissor loses! " $total
    }
    $sum += $total

}

## Question 2 
#A= Rock
#B= Paper 
#C= Scissors
#X = lose
#Y = draw
#Z = win 

$data = import-csv -path .\input2.csv -Delimiter ";"
$sum2 = $null

foreach ($attempt in $data) {
    
    #Draws
    if ($attempt.P2 -eq "Y" -and $attempt.P1 -eq "A") {
        $P2 = "A"
        $result = 3
        #determine extra Points based on choice    
        switch ($P2) {
            "A" { $extraPoints = 1 }
            "B" { $extraPoints = 2 }
            "C" { $extraPoints = 3 }
        }
        $total = $result + $extraPoints  
        Write-Host "Equal game!" $total
    }

    if ($attempt.P2 -eq "Y" -and $attempt.P1 -eq "B") {
        $P2 = "B"
        $result = 3
        #determine extra Points based on choice    
        switch ($P2) {
            "A" { $extraPoints = 1 }
            "B" { $extraPoints = 2 }
            "C" { $extraPoints = 3 }
        }
        $total = $result + $extraPoints  
        Write-Host "Equal game!" $total
    }

    if ($attempt.P2 -eq "Y" -and $attempt.P1 -eq "C") {
        $P2 = "C"
        $result = 3
        #determine extra Points based on choice    
        switch ($P2) {
            "A" { $extraPoints = 1 }
            "B" { $extraPoints = 2 }
            "C" { $extraPoints = 3 }
        }
        $total = $result + $extraPoints  
        Write-Host "Equal game!" $total
    }

    #Winning
    if ($attempt.P2 -eq "Z" -and $attempt.P1 -eq "A") {
        $P2 = "B" 
        $result = 6
        switch ($P2) {
            "A" { $extraPoints = 1 }
            "B" { $extraPoints = 2 }
            "C" { $extraPoints = 3 }
        }
        $total = $result + $extraPoints  
        Write-Host "You win!" $total      
    }
    if ($attempt.P2 -eq "Z" -and $attempt.P1 -eq "B") {
        $P2 = "C"
        $result = 6
        switch ($P2) {
            "A" { $extraPoints = 1 }
            "B" { $extraPoints = 2 }
            "C" { $extraPoints = 3 }
        }
        $total = $result + $extraPoints  
        Write-Host "You win!" $total      
    }
    if ($attempt.P2 -eq "Z" -and $attempt.P1 -eq "C") {
        $P2 = "A"
        $result = 6
        switch ($P2) {
            "A" { $extraPoints = 1 }
            "B" { $extraPoints = 2 }
            "C" { $extraPoints = 3 }
        }
        $total = $result + $extraPoints  
        Write-Host "You win!" $total      
    }

    #Losing 
    if ($attempt.P2 -eq "X" -and $attempt.P1 -eq "A") {
        $P2 = "C"
        $result = 0
        switch ($P2) {
            "A" { $extraPoints = 1 }
            "B" { $extraPoints = 2 }
            "C" { $extraPoints = 3 }
        }
        $total = $result + $extraPoints  
        Write-Host "You lose!" $total      
    }
    if ($attempt.P2 -eq "X" -and $attempt.P1 -eq "B") {
        $P2 = "A"
        $result = 0
        switch ($P2) {
            "A" { $extraPoints = 1 }
            "B" { $extraPoints = 2 }
            "C" { $extraPoints = 3 }
        }
        $total = $result + $extraPoints  
        Write-Host "You lose!" $total      
    }
    if ($attempt.P2 -eq "X" -and $attempt.P1 -eq "C") {
        $P2 = "B"
        $result = 0
        switch ($P2) {
            "A" { $extraPoints = 1 }
            "B" { $extraPoints = 2 }
            "C" { $extraPoints = 3 }
        }
        $total = $result + $extraPoints  
        Write-Host "You lose!" $total      
    }
    $sum2 += $total


}
    Write-Host = "Total points Question 1" $sum 
    Write-Host = "Total points Question 2" $sum2 
