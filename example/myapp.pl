#!/usr/bin/env perl

use lib "./lib"; # UPDATE IF NEEDED
use Data::Dumper;
use Net::Upwork::API;
use Net::Upwork::API::Routers::Auth;

$config = Net::Upwork::API::Config->new(
    'consumer_key'    => 'xxxxxxxx',
    'consumer_secret' => 'xxxxxxxx',
    'access_token'    => 'xxxxxxxx',
    'access_secret'   => 'xxxxxxxx',
    'debug' => 1
);

$api = Net::Upwork::API->new($config);
if (!$api->has_access_token()) {
    my $authz_url = $api->get_authorization_url();

    print "Visit the authorization url and provide oauth_verifier for further authorization\n";
    print $authz_url . "\n";
    $| = "";
    $verifier = <STDIN>;
    
    my $token = $api->get_access_token($verifier);
    print Dumper $token;
    # store access token data in safe place!
}

$auth = Net::Upwork::API::Routers::Auth->new($api);
$data = $auth->get_user_info();

print Dumper $data;
