add-pssnapin quest.activeroles.admanagement
# Builds txt file of servers to scan.
$file = "Global_Workstations.txt"
get-qadcomputer -searchroot 'DOMAIN.com/Windows7/Computers/Workstations' -sizelimit 0 | select-object Name| out-file $file
(Get-Content $file | Select-Object -Skip 3) | Set-Content $file
$content = Get-Content $file
$content | Foreach {$_.TrimEnd()} | Set-Content $file
