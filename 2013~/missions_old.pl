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

BEGIN{
    $cgi = new CGI;
    $uuid = $cgi->param("uuid");
    $device = $cgi->param("device");
    $page = defined $cgi->param("page") ? $cgi->param("page") : "1";
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

# MYSQL CONFIG VARIABLES
use DBI;
use DBI();
my $dbh = DBI->connect("DBI:mysql:database=mafia;host=localhost",
                         "mafia", "password",
                         {'RaiseError' => 1});

my $sth = $dbh->prepare(<<End_SQL) or die "Couldn't prepare statement: $DBI::errstr; stopped";
SELECT MissionName, XP, RequiredAllies, cash, cash2, ID, energy FROM mission WHERE page = '$page';
End_SQL


$sth->execute() or die "Couldn't execute statement: $DBI::errstr; stopped";



# HTML TABLE

# FETCHROW ARRAY

while ( my ($MissionName, $XP, $RequiredAllies, $cash, $cash2, $ID, $energy) = $sth->fetchrow_array() ){
	print "<table border='0' style='
border:2px solid #a1a1a1;
padding:10px 40px; 
background:#dddddd;
width:300px;
border-radius:25px;
'>";
print "
	
	<tr>
		
	
	<form action='do_mission.pl'>
	
	<th>
	<p>$MissionName</p>
	<p> $cash </p>
	<p> XP: $XP<p>
	</th>
	
	<th>
	<p> Required:</p>
	<p> Allies: $RequiredAllies<p>
	<p> Energy: $energy </p>
	</th>

	<th>
	<input type='text' style='display:none;' name='ID' value='$ID'>
	<input type='text' style='display:none;' name='uuid' value='$uuid'>
	<INPUT type='submit' value='Do it'/>
	</th>
	
	</form>
	
	</tr>
	</div>
	<br><br>
	 ";
}
print "</table>";


$html = qq{
<style>
input[type=submit] {
    color:white;
    font:2.4em Futura, ‘Century Gothic’, AppleGothic, sans-serif;
    font-size:100%;
   width:80px
   height:30px;
    cursor:pointer;

 background-color:rgba(255,0,0,1);
    padding:4px;
    background:url(images/obfush.png) repeat-x center #ff0000;
}
</style>
<style>
body {
	background-color: rgba(0, 0, 0, 0.2);
	
}
</style>
};
print $html;

$dbh->disconnect();