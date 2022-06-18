
$CSharpSourceCodes = @"

public class MusicBandPlayer
{
	public MusicBandPlayer(string strInstrument, string strName)
	{
		m_strInstrument = strInstrument;
		m_strName = strName;
	}

	public string m_strInstrument;
	public string m_strName;
}

"@

Add-Type -TypeDefinition $CSharpSourceCodes -Language CSharp

$john = New-Object -TypeName MusicBandPlayer -ArgumentList "Guitar", "John"
$paul = New-Object -TypeName MusicBandPlayer -ArgumentList "Bass", "Paul"
$george = New-Object -TypeName MusicBandPlayer -ArgumentList "Lead Guitar", "George"
$ringo = New-Object -TypeName MusicBandPlayer -ArgumentList "Drums", "Ringo"

## For more info on converting a string array into HTML, see :
## Powershell piping an array of strings to ConvertTo-Html
## https://stackoverflow.com/questions/50685884/powershell-piping-an-array-of-strings-to-convertto-html
[MusicBandPlayer[]]$beatles = $john, $paul, $george, $ringo
$beatles | ConvertTo-HTML -Property m_strName, m_strInstrument -Title Beatles | Out-File Beatles.html







