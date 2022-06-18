## For more info on converting a string array into HTML, see :
## Powershell piping an array of strings to ConvertTo-Html
## https://stackoverflow.com/questions/50685884/powershell-piping-an-array-of-strings-to-convertto-html
[string[]]$beatles = "John", "Paul", "George", "Ringo"
$beatles | ConvertTo-HTML -Property @{ l="Musician"; e={ "Name = $_" } } | Out-File beatles.html




