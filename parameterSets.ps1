function Get-Character{
	[CmdletBindig(DefaultParameterSetName='StringValue')]
	param(
		[Parameter(Mandatory, ParameterSetName='File')]
		[String] $Path,
		[Paraameter(Mandatory, ParameterSetName='StringValue')]
		[String] $Value,
		[int] $Character =15
	)
	if ($Path) {
		$Value = Get-Content -Path $Path
	}
	$Value.Substring(0, $Character)
}

