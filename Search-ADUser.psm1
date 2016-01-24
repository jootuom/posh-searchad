Function Search-ADUser {
	[CmdletBinding()]
	Param(
		[Parameter(Mandatory=$true)]
		[ValidateNotNullOrEmpty()]
		[string[]] $Names
	)
	begin {
		if (!(Get-Module ActiveDirectory)) {
			Import-Module ActiveDirectory
		}
	}
	process {
		foreach ($name in $Names) {
			$user = Get-ADUser -Filter {Name -like $name}
			
			if (!$user) {
				Write-Error "User '$name' not found."
			}
			
			$user
		}
	}
}
