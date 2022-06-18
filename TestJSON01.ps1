## For more infor about HashTables (esp ordered hashtables), see :
## about_Hash_Tables
## https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_hash_tables?view=powershell-7.2
$EmployeeHashTable = [ordered]@{
  Number = 0
  Name = ""
  Nationality = ""
  Occupation = ""
}

$employee = New-Object -TypeName PSObject -Property $EmployeeHashTable 
$employee.Number = 1
$employee.Name = "David Lim"
$employee.Nationality = "Singaporean"
$employee.Occupation = "Software Engineer"

## See : ConvertTo-Json
## https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/convertto-json?view=powershell-7.2
$employee_json_string = ConvertTo-Json -InputObject $employee -Compress
Write-Host $employee_json_string 



