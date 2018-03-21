if ($action =~ /^(energize)$/) {

my $dbhy = DBI->connect("DBI:mysql:database=mafia;host=localhost",
                         "mafia", "password",
                         {'RaiseError' => 1}); 
my $sthy = $dbhy->prepare(<<End_SQL) or die "Couldn't prepare statement: $DBI::errstr; stopped";
select cash, cash2, xp, MissionName, ID, energy FROM mission WHERE ID = '$ID'
End_SQL
$sthy->execute() or die "ERROR ON CONNECT: $DBI::errstr; stopped";

while ( my ($cash, $cash2, $XP, $MissionName, $ID, $energy) = $sthy->fetchrow_array() ){




$gize = qq{
<div class="section" style="padding: 0;">
<div class="sectionContent">
<div style="padding: 0 70px;">
<div class="boxedItem ">
<div class="itemBackgr "></div>
<h3><center><font color='white'> Success! You&apos;re Energy has been completely refilled.</font></center> </h3></div></div></div></div>
<div style="height:10px"></div>
};

};
print $gize;
}