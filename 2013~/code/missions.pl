#!/usr/bin/perlml

use DBI;
use CGI;
use v5.10;
use Digest::MD5;
use CGI;
use File::Temp qw(tempfile);
use HTTP::Cookies;
use LWP::UserAgent;
use MIME::Base64;
use DBI;
use DBI();

BEGIN{
    $cgi = new CGI;
    $uuid = $cgi->param("uuid");
    $action = $cgi->param("action");
    $device = $cgi->param("device");
    $ID = $cgi->param("ID");
    $page = defined $cgi->param("page") ? $cgi->param("page") : "1";
    $refill = $cgi->param("refill");
    $ENV{REMOTE_ADDR} = $ip;
    if(!defined $uuid){
        print $cgi->header(-type=>'text/html', -status=>'403 Forbidden');
        print "<h1>Please force close the application and reopen, Sorry for the inconvenience.</h1>";
        exit;
    } else {
        print $cgi->header(-type=>'text/html', -charset => 'UTF-8');
    }
    open(STDERR, ">&STDOUT");
}


my @chars = ("a".."z", "1".."9");
my $rand3;
$rand3 .= $chars[rand @chars] for 1..30;


######################################
######################################
######################################
print "<BR><BR><BR><BR>";



if ($action =~ /^(energize)$/) {

my $dbhy = DBI->connect("DBI:mysql:database=mafia;host=localhost",
                         "mafia", "password",
                         {'RaiseError' => 1}); 
my $sthy = $dbhy->prepare(<<End_SQL) or die "Couldn't prepare statement: $DBI::errstr; stopped";
select cash, cash2, xp, MissionName, ID, energy FROM mission WHERE ID = '$ID'
End_SQL
$sthy->execute() or die "ERROR ON CONNECT: $DBI::errstr; stopped";

while ( my ($cash, $cash2, $XP, $MissionName, $ID, $energy) = $sthy->fetchrow_array() ){




$gize = qq{<div class="section" style="padding: 0;">
<div class="sectionContent">
<div style="padding: 0 70px;">
<div class="boxedItem ">
<div class="itemBackgr "></div>
<h3><center><font color='white'> Success! You&apos;re Energy has been completely refilled.</font></center> </h3></div></div></div></div>
<div style="height:10px"></div>
};

};
print $gize;



if ($ID =~ /^(1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30|31|32|33|34|35|36)$/) { 

my $dbh = DBI->connect("DBI:mysql:database=mafia;host=localhost",
                         "mafia", "password",
                         {'RaiseError' => 1}); 
                         
my $sth = $dbh->prepare(<<End_SQL) or die "Couldn't prepare statement: $DBI::errstr; stopped";
select cash, cash2, xp, MissionName, ID, energy FROM mission WHERE ID = '$ID'
End_SQL
$sth->execute() or die "ERROR ON CONNECT: $DBI::errstr; stopped";

while ( my ($cash, $cash2, $XP, $MissionName, $ID, $energy) = $sth->fetchrow_array() ){

$maximum = $cash2;
$minimum = $cash;
$gained = $minimum + int(rand($maximum - $minimum));


####nasty code here
my $dbh3 = DBI->connect("DBI:mysql:database=mafia;host=localhost",
                         "mafia", "password",
                         {'RaiseError' => 1}); 
my $sth3 = $dbh3->prepare(<<End_SQL) or die "Couldn't prepare statement: $DBI::errstr; stopped";
select currentenergy FROM people WHERE uuid = '$uuid'
End_SQL
$sth3->execute() or die "ERROR ON CONNECT: $DBI::errstr; stopped";

while ( my ($currentenergy) = $sth3->fetchrow_array() ){

if ($currentenergy =~ m/-/) {
my $dbh = DBI->connect("DBI:mysql:database=mafia;host=localhost",
                         "mafia", "password",
                         {'RaiseError' => 1});

my $sth = $dbh->prepare(<<End_SQL) or die "Couldn't prepare statement: $DBI::errstr; stopped";
select uuid, name, energy, level, health, ammo, cash, exp, diamonds, currentenergy FROM people WHERE uuid = '$uuid'
End_SQL

$sth->execute() or die "Couldn't execute statement: $DBI::errstr; stopped";

while ( my ($uuid, $name, $energy, $level, $health, $ammo, $cash, $exp, $diamonds, $currentenergy) = $sth->fetchrow_array() ){

    sub commify {
        local $_  = shift;
        1 while s/^(-?\d+)(\d{3})/$1,$2/;
        return $_;
    }
    $n = $cash;
$cashe = commify($n);

    sub commify {
        local $_  = shift;
        1 while s/^(-?\d+)(\d{3})/$1,$2/;
        return $_;
    }
    $h = $diamonds;
$diamondse = commify($h);

	$htmle = qq{
	
<style>
@font-face { font-family: dumb; src: url('fonts/dumb.ttf'); } 
div {
font-family: dumb;
}
p {
font-family: dumb;
}
b {
font-family: dumb;
}
h1 {
font-family: dumb;
}

input[type='text']{

    color: #333;
    width: 150px;
    height: 20px;
    left: 50%;
    top: 50%;
    padding-left: 1px;
    padding-right: 1px;

    transition: box-shadow 320ms;

    box-shadow: 0px 0px 8px 10px rgba(0,0,0,0.1);

    border-radius: 2px;
    font-size: 15px;
    border: 0px;
}
</style>
<style>
body 
{
background-image:url('images/bg.jpg');
background-color:#000000;
}
	fieldset 
	{ 
	border:1px solid green 
	}
</style>

	
		
		
		
		<!--- CASH --->
<img src="images/spacer.png" style="opacity:0.7;position:fixed;top:5px;left:15px;z-index:100;border-radius:10px;width:140px;height:28px;"></img>
		
		<div style="opacity:0.7;position:fixed;top:10px;left:44px;z-index:101;border-radius:10px;width:120px;height:25px;color:white;"><B>$cashe</B></div>
		
		<img src="images/cashe.png" style="opacity:1;position:fixed;top:6px;left:16px;z-index:101;width:30px;height:25px;"></img>
		
		
		
		<!--- GEMS --->
		<img src="images/gems.png" style="opacity:1;position:fixed;top:5px;left:170px;z-index:101;width:45px;height:35px;"/></img>
		
<div style="opacity:0.7;position:fixed;top:10px;left:210px;z-index:101;border-radius:10px;width:120px;height:25px;color:white;"><B>$diamondse</B></div>
		
<img src="images/spacer.png" style="opacity:0.7;position:fixed;top:5px;left:170px;z-index:100;border-radius:10px;width:140px;height:28px;"/></img>



		<!--- Energy --->
		<img src="images/energy.png" style="opacity:1;position:fixed;top:10px;left:326px;z-index:101;width:25px;height:18px;"/></img>
		
<div style="opacity:0.7;position:fixed;top:10px;left:355;z-index:101;border-radius:10px;width:100px;height:25px;color:white;"><B>$currentenergy / $energy</B></div>
		
<img src="images/spacer.png" style="opacity:0.7;position:fixed;top:5px;left:320px;z-index:100;border-radius:10px;width:130px;height:28px;"/></img>



		<!--- EXP --->
		<img src="images/exp.png" style="opacity:1;position:fixed;top:43px;right:74px;z-index:101;width:24px;height:24px;"/></img>
		
<div style="opacity:0.7;position:fixed;top:43px;right:0px;z-index:101;border-radius:10px;width:70px;height:25px;color:white;font-size:70%;"><B>$exp /<br> $nextlevelexp 000</B></div>
		
<img src="images/spacer.png" style="opacity:0.7;position:fixed;top:37px;right:2px;z-index:100;border-radius:10px;width:100px;height:38px;"/></img>



<!--- Buy gems --->
<form action="base.pl" method="post">
<input type="text" style="display:none;" name="uuid" value="$uuid">
<input type="submit" value="" style="opacity:1;position:fixed;top:8px;left:270px;z-index:100;width:22px;height:22px;background:url(images/add_22.png);border:0px solid #a1a1a1;padding:0px;border-radius:15px;">
</form>	

<!--- Level --->
<form action="base.pl" method="post">
<input type="text" style="display:none;" name="uuid" value="$uuid">
<input type="submit" value="$level" style="opacity:1;position:fixed;top:8px;right:8px;z-index:100;width:24px;height:36px;border:1px solid #a1a1a1;padding-top:2px;padding-bottom:2px;border-radius:5px;padding-right:3px;padding-left:3px;font-size:150%;background-color:#C0C0C0;">
</form>	

<!--- Home button --->
<form action="base.pl" method="post">
<input type="text" style="display:none;" name="uuid" value="$uuid">
<input type="submit" value="Home" style="opacity:0.7;position:fixed;bottom:5px;right:5px;z-index:100;width:70px;height:70px;background:url(images/home_70.png)">
</form>

		
 };
print $htmle;
    	
    	


 };
$dbh->disconnect();
	
	

$failure = qq{

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
<link rel="stylesheet" type="text/css" href="css/missions.css"/>

<div class="section" style="padding: 0;">
<div class="sectionContent">
<div style="padding: 0 70px;">
<div class="boxedItem ">
<div class="itemBackgr "></div>
<table class="missionTable" style="position: relative;">
<tr>

<td class="missionDetails" style="padding: 0;" colspan="3">                       
<font color="white">

<div class="missionName "><font color="red">Failure!</font> You have no more energy!</div></font>
</td>
</tr>
<tr>
<td class="missionDetails">

</td>
<td class="missionAction" align="right">        
   <form action='missions.pl'  method='post'>
<input type='submit' value='Refill for 10 Gems'/>
<input type='text' name='action' style='display:none;' value='energize'>
<input type='text' name='uuid' style='display:none;' value='$uuid'>
<input type='text' name='ch1' style='display:none;' value='$rand1'>
<input type='text' name='hash' style='display:none;' value='$rand2'>
<input type='text' name='lot' style='display:none;' value='$rand3'>
</form>  
   </td>          
</div></div></td></tr></table></div></div></div></div></tr></table></form></div></div></div>
<div style="height:10px"></div>
};
print $failure;
exit;
};

}
$dbh3->disconnect();
### end

$html_mission = qq{
<div class="section" style="padding: 0;">
<div class="sectionContent">
<div style="padding: 0 70px;">
<div class="boxedItem ">
<div class="itemBackgr "></div>
<table class="missionTable" style="position: relative;">
<tr>

<td class="missionDetails" style="padding: 0;" colspan="3">                       
<font color="white">

<div class="missionName ">Success! You accomplished the "<i>$MissionName</i>" Mission<br><HR><small>You gained:</small></div></font>
</td>
</tr>
<tr>
<td class="missionDetails">
<div class="cash">
<span style="white-space: nowrap;"><img src="images/cashe.png" width="15" height="12" style="padding:0 2px -1px 0;"><font color="white">$gained</span>                      
</div>  
<div>+ $XP XP</div>
</td>
<td class="missionAction" align="right">        
   <form action='missions.pl'  method='post'>
<input type='submit' value='Do Again'/>
<input type='text' name='ID' style='display:none;' value='$ID'>
<input type='text' name='uuid' style='display:none;' value='$uuid'>
<input type='text' name='ch1' style='display:none;' value='$rand1'>
<input type='text' name='hash' style='display:none;' value='$rand2'>
<input type='text' name='lot' style='display:none;' value='$rand3'>
</form>  
   </td>          
</div></div></td></tr></table></div></div></div></div></tr></table></form></div></div></div>
<div style="height:10px"></div>

};

 $sql2 = "UPDATE people SET cash = cash + '$gained', exp = exp + '$XP', currentenergy = currentenergy - '$energy' WHERE uuid = '$uuid'";
 $sth2 = $dbh->prepare($sql2);
 $sth2->execute
 or die "SQL Error: $DBI::errstr\n";
};

$dbh->disconnect();

$dbh->disconnect();






print $html_mission;

};


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
input[type=reset], /* CSS3 attribute-equals selector */
#resetButtonID,
.resetButtonClass-Name {
    /* the reset button */
}

input[type=reset]:hover,
#resetButtonID:hover,
.resetButtonClass-Name:hover {
    /* the reset button when hovered over */
}

input[type=reset]:active,
#resetButtonID:active,
.resetButtonClass-Name:active {
    /* the reset button when mouse-down */
}

input[type=reset]:focus,
#resetButtonID:focus,
.resetButtonClass-Name:focus {
    /* the reset button when focussed by keyboard-navigation */
}

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




#################################









my $dbh = DBI->connect("DBI:mysql:database=mafia;host=localhost",
                         "mafia", "password",
                         {'RaiseError' => 1});

my $sth = $dbh->prepare(<<End_SQL) or die "Couldn't prepare statement: $DBI::errstr; stopped";
select uuid, name, energy, level, health, ammo, cash, exp, diamonds, currentenergy FROM people WHERE uuid = '$uuid'
End_SQL

$sth->execute() or die "Couldn't execute statement: $DBI::errstr; stopped";

while ( my ($uuid, $name, $energy, $level, $health, $ammo, $cash, $exp, $diamonds, $currentenergy) = $sth->fetchrow_array() ){

    sub commify {
        local $_  = shift;
        1 while s/^(-?\d+)(\d{3})/$1,$2/;
        return $_;
    }
    $n = $cash;
$cashe = commify($n);

    sub commify {
        local $_  = shift;
        1 while s/^(-?\d+)(\d{3})/$1,$2/;
        return $_;
    }
    $h = $diamonds;
$diamondse = commify($h);

	$htmle = qq{
	
<style>
input[type='text']{

    color: #333;
    width: 150px;
    height: 20px;
    left: 50%;
    top: 50%;
    padding-left: 1px;
    padding-right: 1px;

    transition: box-shadow 320ms;

    box-shadow: 0px 0px 8px 10px rgba(0,0,0,0.1);

    border-radius: 2px;
    font-size: 15px;
    border: 0px;
}
body
{
background-image:url('images/bg.jpg');
background-color:#000000;
}
	fieldset 
	{ 
	border:1px solid green 
	}
</style>

	
		
		
		
		<!--- CASH --->
<img src="images/spacer.png" style="opacity:0.7;position:fixed;top:5px;left:15px;z-index:100;border-radius:10px;width:140px;height:28px;"></img>
		
		<div style="opacity:0.7;position:fixed;top:10px;left:44px;z-index:101;border-radius:10px;width:120px;height:25px;color:white;"><B>$cashe</B></div>
		
		<img src="images/cashe.png" style="opacity:1;position:fixed;top:6px;left:16px;z-index:101;width:30px;height:25px;"></img>
		
		
		
		<!--- GEMS --->
		<img src="images/gems.png" style="opacity:1;position:fixed;top:5px;left:170px;z-index:101;width:45px;height:35px;"/></img>
		
<div style="opacity:0.7;position:fixed;top:10px;left:210px;z-index:101;border-radius:10px;width:120px;height:25px;color:white;"><B>$diamondse</B></div>
		
<img src="images/spacer.png" style="opacity:0.7;position:fixed;top:5px;left:170px;z-index:100;border-radius:10px;width:140px;height:28px;"/></img>



		<!--- Energy --->
		<img src="images/energy.png" style="opacity:1;position:fixed;top:10px;left:326px;z-index:101;width:25px;height:18px;"/></img>
		
<div style="opacity:0.7;position:fixed;top:10px;left:355;z-index:101;border-radius:10px;width:100px;height:25px;color:white;"><B>$currentenergy / $energy</B></div>
		
<img src="images/spacer.png" style="opacity:0.7;position:fixed;top:5px;left:320px;z-index:100;border-radius:10px;width:130px;height:28px;"/></img>



		<!--- EXP --->
		<img src="images/exp.png" style="opacity:1;position:fixed;top:43px;right:74px;z-index:101;width:24px;height:24px;"/></img>
		
<div style="opacity:0.7;position:fixed;top:43px;right:0px;z-index:101;border-radius:10px;width:70px;height:25px;color:white;font-size:70%;"><B>$exp /<br> $nextlevelexp 000</B></div>
		
<img src="images/spacer.png" style="opacity:0.7;position:fixed;top:37px;right:2px;z-index:100;border-radius:10px;width:100px;height:38px;"/></img>



<!--- Buy gems --->
<form action="base.pl" method="post">
<input type="text" style="display:none;" name="uuid" value="$uuid">
<input type="submit" value="" style="opacity:1;position:fixed;top:8px;left:270px;z-index:100;width:22px;height:22px;background:url(images/add_22.png);border:0px solid #a1a1a1;padding:0px;border-radius:15px;">
</form>	

<!--- Level --->
<form action="base.pl" method="post">
<input type="text" style="display:none;" name="uuid" value="$uuid">
<input type="submit" value="$level" style="opacity:1;position:fixed;top:8px;right:8px;z-index:100;width:24px;height:36px;border:1px solid #a1a1a1;padding-top:2px;padding-bottom:2px;border-radius:5px;padding-right:3px;padding-left:3px;font-size:150%;background-color:#C0C0C0;">
</form>	

<!--- Home button --->
<form action="base.pl" method="post">
<input type="text" style="display:none;" name="uuid" value="$uuid">
<input type="submit" value="Home" style="opacity:0.7;position:fixed;bottom:5px;right:5px;z-index:100;width:70px;height:70px;background:url(images/home_70.png)">
</form>

		
 };
print $htmle;
    	
    	


 };
$dbh->disconnect();
