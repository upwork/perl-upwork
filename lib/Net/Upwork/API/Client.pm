package Net::Upwork::API::Client;

use strict;
use warnings;

use Net::OAuth;
use Net::OAuth::Client;

$Net::OAuth::PROTOCOL_VERSION = Net::OAuth::PROTOCOL_VERSION_1_0A;

use constant BASE_HOST      => "https://www.upwork.com/";
use constant DEFAULT_EPOINT => "api";

use constant DATA_FORMAT  => "json";
use constant OVERLOAD_VAR => "http_method";

use constant URI_AUTH    => "/services/api/auth";
use constant URI_RTOKEN  => "/auth/v1/oauth/token/request";
use constant URI_ATOKEN  => "/auth/v1/oauth/token/access";

use constant ENTRY_POINT_API => "api";
use constant ENTRY_POINT_GDS => "gds";

=pod

=head1 NAME

Client

=head1 FUNCTIONS

=over 4

=item new($config)

Create a new Client

B<Parameters>

$config

    Config object

=cut

sub new {
    my $class = shift;
    my $config = shift;
    my %opts = @_;
    $opts{config} = $config;
    my $self = bless \%opts, $class;

    $self->get_oauth_client();

    return $self;
}

=item get_oauth_client

    Initialize OAuth client

=cut

sub get_oauth_client {
    my $self = shift;

    $self->{oauth_client} = Net::OAuth::Client->new(
        $self->{config}{consumer_key},
        $self->{config}{consumer_secret},
        site => BASE_HOST,
        request_token_path => "/" . DEFAULT_EPOINT . URI_RTOKEN,
        authorize_path => URI_AUTH,
        access_token_path => "/" . DEFAULT_EPOINT . URI_ATOKEN,
        signature_method => $self->{config}{signature_method},
        request_token_method => 'POST',
        access_token_method => 'POST',
        callback => $self->{config}{callback},
        debug => $self->{config}{debug},
    );
}

=item get

    GET request to protected resource

B<Parameters>

$url

    Resource URL

B<Return value>

    Hash

=cut

sub get {
    my $self = shift;
    my $uri = shift;
    my %params = @_;

    return $self->send_request($uri, "GET", \%params);
}

=item send_request

    Send a signed OAuth request to a specific protected resource

B<Parameters>

$uri

    Resource URI

$method

    Request method

$params

    API parameters

B<Return value>

    String, a response content

=cut

sub send_request {
    my ($self, $uri, $method, $params) = @_;

    my $request = $self->{oauth_client}->_make_request(
                    "protected resource",
                    site => BASE_HOST,
                    token => $self->{config}{access_token} || $self->{access_token}{token},
                    token_secret => $self->{config}{access_secret} || $self->{access_token}{token_secret},
                    signature_method => $self->{config}{signature_method},
                    request_method => $method,
                    request_url => $self->{oauth_client}->site_url(format_uri($uri, $self->{epoint}), %$params),
                    callback => $self->{config}{callback},
                    debug => $self->{config}{debug},
                );
    $request->sign;

    my $response = $self->{oauth_client}->request(HTTP::Request->new(
        $method => $request->to_url
    ));

    return $response->decoded_content;
}

=item format_uri

    Create a path to a specific resource

B<Parameters>

$uri

    URI to the protected resource

$epoint

    Specific epoint

B<Return value>

    String

=cut

sub format_uri {
    my ($uri, $epoint) = @_;
    $epoint ||= DEFAULT_EPOINT;

    return $epoint . $uri . "." . DATA_FORMAT;
}

=item version

    Get version of native OAuth client

=cut

sub version {
    return $Net::OAuth::VERSION;
}

=back

=head1 AUTHOR

Maksym Novozhylov C<< <mnovozhilov@upwork.com> >>

=head1 COPYRIGHT

Copyright E<copy> Upwork Global Corp., 2015

=cut

1;
