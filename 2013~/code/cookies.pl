#!/usr/bin/perl

use v5.10;
use Digest::MD5;
use CGI;
use File::Temp qw(tempfile);
use HTTP::Cookies;
use LWP::UserAgent;
use MIME::Base64;
use HTTP::Cookies;

BEGIN {
    $cgi = new CGI;
    $game = $cgi->param("game");
	print $cgi->header(-type=>'text/html', -charset => 'UTF-8');
    open(STDERR, ">&STDOUT");
}

if ($game =~ /^(wwar)$/) {

}
if ($game =~ /^(im)$/) {

}
if ($game =~ /^(vl)$/) {

}
if ($game =~ /^(zl)$/) {

}
if ($game =~ /^(kl)$/) {

}
if ($game =~ /^(rl)$/) {

}
### SQL loop of account udids + cookies (where userd=...)
$CURL = "curl -s -b cookies -L";
$URL = "$game.storm8.com/home.php";
$GET = "$CURL '$URL'";

$req = `$GET`;

my ($level) = ($req =~ /\/profile\.php\?formNonce[^>]*>([^<]+)/);
my ($name) = ($req =~ /profileName[^>]*>([^<]+)/);


#print $game;
#print $req;

print "Account Level: $level\n";
print "Account Name: $name\n";
print "Would you like to change the account password?";

print "<form action='cookies.pl' method='post'>";
print "<input type='hidden' name='' value=''/>";
print "<input type='hidden' name='' value=''/>";



