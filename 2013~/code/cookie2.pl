 #!/usr/bin/perl
    use strict;
    use warnings;
    use LWP::UserAgent;
    use HTTP::Request::Common qw(GET);
    use HTTP::Cookies;

    my $ua = LWP::UserAgent->new;

    # Define user agent type
    $ua->agent('Mozilla/8.0');

    # Cookies
    $ua->cookie_jar(
        HTTP::Cookies->new(
            file => 'mycookies.txt',
            autosave => 1
        )
    );

    # Request object
    my $req = GET 'http://www.perlmeme.org';

    # Make the request
    my $res = $ua->request($req);