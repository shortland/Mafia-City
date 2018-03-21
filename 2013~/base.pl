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
#use Math::TrulyRandom;


BEGIN{
    $cgi = new CGI;
    $uuid = $cgi->param("uuid");
    $device = $cgi->param("device");
    $version = $cgi->param("version");
    $ENV{REMOTE_ADDR} = $ip;
    if(!defined $uuid){
        print $cgi->header(-type=>'text/html', -status=>'403 Forbidden');
        print "<h1>Please force close the application and reopen.</h1>";
        exit;
    } else {
        print $cgi->header(-type=>'text/html', -charset => 'UTF-8');
    }
    open(STDERR, ">&STDOUT");
}

{
my $range = 1;
my $minimum = 9;
my $rand1 = int(rand($range)) + $minimum;
}
{
my $range = 10;
my $minimum = 99;
my $rand2 = int(rand($range)) + $minimum;
}
{
my $range = 100;
my $minimum = 999;
my $rand3 = int(rand($range)) + $minimum;
}
$md = Digest::MD5->new;
$md->add($uuid);
$md->add(':' , 'MagicalPowers:!' );
$extra = $md->hexdigest;
$extra = uc($extra);

# rand1 rand2 rand3 extra


### Connect to database
use DBI;
use DBI();
my $dbh = DBI->connect("DBI:mysql:database=mafia;host=localhost",
                         "mafia", "password",
                         {'RaiseError' => 1});

  $dbh->do("INSERT INTO  people (uuid, jimmy) VALUES ('$uuid', 1) ON DUPLICATE KEY UPDATE jimmy=VALUES(jimmy)");

my $sth = $dbh->prepare(<<End_SQL) or die "Couldn't prepare statement: $DBI::errstr; stopped";
select uuid, name, energy, level, health, ammo, cash, exp, diamonds FROM people WHERE uuid = '$uuid'
End_SQL

$sth->execute() or die "Couldn't execute statement: $DBI::errstr; stopped";

while ( my ($uuid, $name, $energy, $level, $health, $ammo, $cash, $exp, $diamonds) = $sth->fetchrow_array() ){

	#print "UUID: $uuid\n Name: $name\n";
	
	






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

	$html = qq{
	
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
		background-color:#F0F5F5;
		background-repeat:no-repeat;
		background-size:100% 100%;
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
		
		
		
<img src="images/spacer.png" onclick="toggle_visibility('foo');" width="20" height="100px" style="position:fixed;left:0px;z-index:101;top:40%" /></img>


		<center>
	
	<iframe src="missions.pl?uuid=$uuid" frameborder="2px" height="900px" width="90%" id="foo" style="position:absolute;top:40px;left:34px;overflow:scroll;width:90%;border:2px solid #000000;border-radius:5px;"></iframe>
	
		</center>
		
		
<!---- Auto Load ---->
<body onload="toggle_visibility('foo');">
<!---- End Load ---->
		
<script type="text/javascript">
<!--
    function toggle_visibility(id) {
       var e = document.getElementById(id);
       if(e.style.display == 'none')
          e.style.display = 'block';
       else
          e.style.display = 'none';
    }
//-->
</script>
		<BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR>		};
		
		

print $html;
    	
    	

 }	
 $dbh->disconnect();	
	
	
	
	
	
	