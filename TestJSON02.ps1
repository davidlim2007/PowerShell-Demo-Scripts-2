
$json_string = '{"Number":1,"Name":"David Lim","Nationality":"Singaporean","Occupation":"Software Engineer"}'

$employee  = $json_string  | ConvertFrom-Json 

Write-Host $employee




