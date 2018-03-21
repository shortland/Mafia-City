my $dbh = DBI->connect("DBI:mysql:database=mafia;host=localhost",
                         "mafia", "password",
                         {'RaiseError' => 1});

my $sth = $dbh->prepare(<<End_SQL) or die "Couldn't prepare statement: $DBI::errstr; stopped";
SELECT MissionName, XP, RequiredAllies, cash, cash2, ID, energy FROM mission WHERE page = '$page';
End_SQL


$sth->execute() or die "Couldn't execute statement: $DBI::errstr; stopped";

$stable = qq{
<link rel="stylesheet" type="text/css" href="css/missions.css"/>
<div class="section" style="padding: 0;">
<div class="sectionContent">
<div style="padding: 0 70px;">
<div class="boxedItem ">
<div class="itemBackgr "></div>
<table class="missionTable" style="position: relative;">
};


while ( my ($MissionName, $XP, $RequiredAllies, $cash, $cash2, $ID, $energy) = $sth->fetchrow_array() ){




my $range = 100000000000;
my $minimum = 10000000000000;
my $range2 = 10000000000000000;
my $minimum2 = 1000000000000000000;
my $rand1 = int(rand($range)) + $minimum;
my $rand2 = int(rand($range2)) + $minimum2;
#my $rand3 = $rand1 + $rand2;
$html = qq{
<tr>
<td class="missionDetails" style="padding: 0;" colspan="3">                       
<font color="white"><div class="missionName ">$MissionName<hr></div></font>
</td>

</tr>
<tr>
<td class="missionDetails">
<div class="cash">
<span style="white-space: nowrap;"><img src="images/cashe.png" width="15" height="12" style="padding:0 2px -1px 0;"><font color="white">$cash</span> - 
<span style="white-space: nowrap;"><img src="images/cashe.png" width="15" height="12" style="padding:0 2px -1px 0;">$cash2</span>                       
</div>  
<div>+ $XP XP</div>
</td>
<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
<td class="missionAction" align="right">                          
<form action='missions.pl'  method='post'>
<input type='submit' value='Do Job'/>
<input type='text' name='ID' style='display:none;' value='$ID'>
<input type='text' name='uuid' style='display:none;' value='$uuid'>
<input type='text' name='ch1' style='display:none;' value='$rand1'>
<input type='text' name='hash' style='display:none;' value='$rand2'>
<input type='text' name='lot' style='display:none;' value='$rand3'>
</form>

</td>
<td class="missionSp"></td>
</tr>


<tr>
<td class="missionDetails" style="padding: 5px 0 0 0;" colspan="3">
<div class="requiredText">
Required:
</div>
<BR>
<div width="10px" style="width:10px"></div><span style="white-space: nowrap;"> <img src="images/energy.png" width="15" height="12" style="padding:0 2px -1px 0;"><font color="white">- $energy</span>                        
</div>
</div>
</td>
</tr>
</table>
</div>
</div>
</div>
</div>
</tr></table>
</form>
</div>
</div>
</div>
<div style="height:10px"></div>


	 };
	 print $stable;
print $html;
}


$style = qq{
<style>
input[type=submit] {
    color:white;
    font:2.4em Futura, ‘Century Gothic’, AppleGothic, sans-serif;
    font-size:100%;
    width:80px
    height:30px;
    cursor:pointer;
    border-radius:10px;
    background-color:rgba(255,0,0,1);
    border:2px solid #a1a1a1;
    padding:4px;
    background:url(images/obfush.png) repeat-x center #ff0000;
}
input[type="submit"]:hover{
    border: 2px solid #999;color:#000;
}
</style>
};

print $style;

$dbh->disconnect();
