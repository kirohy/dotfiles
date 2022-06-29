set-alias vim 'C:\Program Files\Vim\vim82\vim.exe'

If(Test-Path '~\posh-git\src\posh-git.psd1'){
    Import-Module '~\posh-git\src\posh-git.psd1'
    function global:Prompt {
        $origLastExitCode = $LASTEXITCODE
    
        $prompt = ""
    
        $prompt += Write-Prompt $(Get-Date -UFormat "[%H:%M:%S] ") -ForegroundColor ([ConsoleColor]::Magenta)
        $prompt += Write-Prompt $((Get-Location).Path) -ForegroundColor ([ConsoleColor]::Green)
        $prompt += Write-VcsStatus
        $prompt += "`n$('> ' * ($nestedPromptLevel + 1))"
    
        $LASTEXITCODE = $origLastExitCode
        $prompt
    }
}Else{
    function global:Prompt {
        Write-Host -NoNewline $(Get-Date -UFormat "[%H:%M:%S] ") -ForegroundColor Magenta
        Write-Host $((Get-Location).Path) -ForegroundColor Green
        "> "
    }
}

