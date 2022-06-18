
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

$billie = New-Object -TypeName MusicBandPlayer -ArgumentList "Lead Vocals & Guitar", "Billie"
$mike = New-Object -TypeName MusicBandPlayer -ArgumentList "Bass", "Mike"
$tre = New-Object -TypeName MusicBandPlayer -ArgumentList "Drums", "Tre"

[MusicBandPlayer[]]$green_day = $billie, $mike, $tre

$green_day_report = $green_day | ConvertTo-HTML -Property m_strInstrument, m_strName -Fragment

$patrick = New-Object -TypeName MusicBandPlayer -ArgumentList "Lead Vocals", "Patrick"
$joe = New-Object -TypeName MusicBandPlayer -ArgumentList "Lead Guitar", "Joe"
$pete = New-Object -TypeName MusicBandPlayer -ArgumentList "Bass", "Pete"
$andy = New-Object -TypeName MusicBandPlayer -ArgumentList "Drums", "Andy"

[MusicBandPlayer[]]$fallout_boy = $patrick, $joe, $pete, $andy

$fallout_boy_report = $fallout_boy | ConvertTo-HTML -Property m_strInstrument, m_strName -Fragment

# The following will combine all the HTML Fragments into one HTML File.
ConvertTo-HTML -Body "$beatles_report $green_day_report $fallout_boy_report" -Title "Bands" | Out-File Bands.html






