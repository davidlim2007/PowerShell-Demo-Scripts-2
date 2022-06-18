
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

# The following will create an Array of MusicBandPlayer instances.
[MusicBandPlayer[]]$beatles = $john, $paul, $george, $ringo

# The following will create a HTML Fragment with a Report on the Beatles with 2 columns : m_strInstrument and m_strName.
$beatles_report = $beatles | ConvertTo-HTML -Property m_strInstrument, m_strName -Fragment

$process_report = Get-WmiObject -Class Win32_Process | Select Name, ProcessId | ConvertTo-HTML -Fragment

$Header = @"
<style>
TABLE {border-width: 1px; border-style: solid; border-color: black; border-collapse: collapse;}
TH {border-width: 1px; padding: 3px; border-style: solid; border-color: black; background-color: #6495ED;}
TD {border-width: 1px; padding: 3px; border-style: solid; border-color: black;}
</style>
"@

# The following will combine all the HTML Fragments into one HTML File.
ConvertTo-HTML -Body "$beatles_report $process_report" -Title "Beatles" -Head $Header | Out-File BeatlesOS.html






