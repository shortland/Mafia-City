my $dbh = DBI->connect("DBI:mysql:database=mafia;host=localhost",
			 "mafia", "password",
			 {'RaiseError' => 1});

my $sth = $dbh->prepare(<<End_SQL) or die "Couldn't prepare statement: $DBI::errstr; stopped";
select uuid, name, energy, level, health, ammo, currentammo, cash, exp, diamonds, currentenergy FROM people WHERE uuid = '$uuid'
End_SQL

$sth->execute() or die "Couldn't execute statement: $DBI::errstr; stopped";

while ( my ($uuid, $name, $energy, $level, $health, $ammo, $currentammo, $cash, $exp, $diamonds, $currentenergy) = $sth->fetchrow_array() ){

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

body {
  -webkit-user-select: none;
     -moz-user-select: -moz-none;
      -ms-user-select: none;
	  user-select: none;
}
input,
textarea {
     -moz-user-select: text;
}

body 
{
background: -webkit-linear-gradient(#3399FF, #000000); /* For Safari 5.1 to 6.0 */
background: -o-linear-gradient(#3399FF, #000000); /* For Opera 11.1 to 12.0 */
background: -moz-linear-gradient(#3399FF, #000000); /* For Firefox 3.6 to 15 */
background: linear-gradient(#3399FF, #000000); /* Standard syntax */
/*background-repeat:no-repeat;
background-color:#000000;
background-size: cover;*/
}
	fieldset 
	{ 
	border:1px solid green 
	}
	

</style>
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

#spacer {
z-index:100;
border-radius:0px;
width:100px;
height:16px;
background-color:rgba(0,0,0,0.3);
border:1px black solid;
padding-top:2px;
padding-bottom:2px;
padding-right:2px;
padding-left:2px;
font-size:80%;
font-color:#ffffff;
font-weight:bold;
color:#ffffff;
text-align:right;
font-family:Courier New,Helvetica,sans-serif;
transition:all 320ms;
overflow:hidden;
text-overflow:ellipsis;
}
div.cash {
position:fixed;
top:10px;
right:10px;
}
div.gems {
position:fixed;
top:40px;
right:10px;
}
div.energy {
position:fixed;
top:10px;
right:130px;
}
div.ammo {
position:fixed;
top:10px;
right:250px;
}
#level {
opacity:1;
position:fixed;
top:8px;
left:8px;
z-index:100;
width:40px;
height:40px;
border:3px solid #ffffff;
border-radius:9999px;
padding-top:2px;
padding-bottom:2px;
padding-right:2px;
padding-left:2px;
font-size:150%;
font-color:#ffffff;
color:#ffffff;
text-align:center;
font-family:Arial,Helvetica,sans-serif;
transition:all 320ms;
background-color:rgba(0,0,0,0.4);
line-height:150%;
}
#level:hover {
border:3px solid #000000;
color:#000000;
background-color:rgba(255,255,255,0.4);
}

/* Begin PICs */

#energypic {
opacity:1;
position:fixed;
top:8px;
right:216px;
z-index:101;
width:35px;
height:27px;
}

#cashpic {
opacity:1;
position:fixed;
top:10px;
right:95px;
z-index:101;
width:35px;
height:27px;
}

#cashpic:hover {

}

#diamondpic {
opacity:1;
position:fixed;
top:36px;
right:98px;
z-index:101;
width:32px;
height:30px;
}

#ammopic {
opacity:1;
position:fixed;
top:7px;
right:300px;
z-index:101;
width:32px;
height:30px;
}

</style>

<!--- CASH --->
<div id='spacer' class='cash'>&nbsp;$cashe</div>
<img src="images/cash.png" id='cashpic'/></img>


<!--- GEMS --->
<div id='spacer' class='gems'>$diamondse</div>
<img src="images/diamond.png" id='diamondpic'/></img>


<!--- Energy --->
<div id='spacer' class='energy'>$currentenergy\/$energy</div>
<img src="images/energy.png" id='energypic'/></img>


<!--- Ammo --->
<div id='spacer' class='ammo' style='width:70px;'>$currentammo\/$ammo</div>
<img src="images/ammo.png" id='ammopic'/></img>


<!--- EXP --->



<!--- Buy gems --->
<form action="base.pl" method="post">
<input type="text" style="display:none;" name="uuid" value="$uuid">
<input type="submit" value="" style="opacity:1;position:fixed;top:168px;left:270px;z-index:100;width:32px;height:32px;background:url(images/add_22.png);border:0px solid #a1a1a1;padding:0px;border-radius:5px;">
</form> 

<!--- Level --->

<div id='level' onClick='nothing()'>$level</div>
<!---
<div id='exphidden'>$exp\/$nextlevelexp</div>
--->


<form action="base.pl" method="post">
<input type="text" style="display:none;" name="uuid" value="$uuid">
<input type="submit" value="Home" style="opacity:0.7;position:fixed;bottom:5px;right:5px;z-index:100;width:70px;height:70px;background:url(images/city_70.png);font-size:78%;">
</form>
		
		
		<BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR>
		
				};
		
		

print $html;