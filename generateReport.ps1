param ($oncallDates, $additional1, $additional2)

function Format-Date {

    param (
        $dates
    )
    $oncallString = "Dates of oncall maintenance 6 hours a day: `n"
    
    #input will be like: 2-9,15-26
    $colection = $dates.ToString().Split(',')
    $d = Get-Date
    $d = $d.ToString()
    $n = 0;
    foreach($interval in $colection) {

        $dateStart = $d.ToString().Split(' ')[0].Split('/')
        $dateEnd = $d.ToString().Split(' ')[0].Split('/')

        $start = $interval.Split('-')[0]
        $end = $interval.Split('-')[1]
        $numDays = [int]$end - [int]$start + 1
 
        $dateStart[0] = $start
        $dateEnd[0] = $end
        $output1 = $dateStart -join '/'
        $output2 = $dateEnd -join '/'
        
        $formated = $output1 + " - " + $output2 + " " +  $numDays + " days"
        Write-Host "Writing oncall week $n" -ForegroundColor Yellow
        $oncallString += $formated + "`n"
        $n++

    }

    return $oncallString

}

# EXECUTION 

$obj = New-Object -ComObject Excel.Application
$wb = $obj.Workbooks.Open("D:\Users\v-dnikolic\Downloads\Top 5000 Incidents.csv")
$sheet = $wb.WorkSheets.Item(1)
$col = $sheet.Columns.Item(1)

$str = ""
$counter = 0;
$totalWeeks = $oncallDates.ToString().Split(',').Length
Write-Host "Tickets:"

foreach($c in $col.Cells) {
    if($c.Formula -eq "") {break}
    $str += $c.Formula + ", "
    $counter++;
}

$str = $str.Substring(3, $str.Length - 5)
$wb.Close()
$obj.Quit()
# REMOVE IT
Write-Host "Creating new file..." -ForegroundColor Yellow 
$newValue = "Support tickets processing: " + $str
$obj1 = New-Object -ComObject Excel.Application
$wb1 = $obj1.Workbooks.Open("D:\Users\v-dnikolic\Downloads\invoice.xlsx")
$sheet1 = $wb1.WorkSheets.Item(1)

$sheet1.Cells(17,2) = $newValue;
#Month
$Month = Get-Date -UFormat %B
$name = "Djordje Nikolic Invoice - " + $Month
$savePath = "C:\Users\v-dnikolic\Desktop\" + $name + ".xlsx"

$total = Format-Date($oncallDates)
$sheet1.Cells(19,2) = $total;
$wb1.SaveAs($savePath)
Write-Host "Dzondramon generated report for" $Month'!' -ForegroundColor Green 
$wb1.Close()
$obj1.Quit()
Remove-Item "D:\Users\v-dnikolic\Downloads\Top 5000 Incidents.csv"
Write-Host "Total tasks completed: $counter" -ForegroundColor Cyan
Write-Host "Number of on-call weeks: $totalWeeks" -ForegroundColor Cyan