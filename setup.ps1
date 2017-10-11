if ($env:computername -ne "agent")
{
  wmic computersystem where name="%COMPUTERNAME%" call rename name="agent"
  Restart-Computer
}
