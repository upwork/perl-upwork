package Net::Upwork::API;

use strict;
use warnings;

use Net::Upwork::API::Config;
use Net::Upwork::API::Client;

=pod

=head1 NAME

API

=head1 FUNCTIONS

=over 4

=item new($config)

Create a new Config

B<Parameters>

$config

    Config object

=cut

sub new {
    my $class = shift;
    my $config = shift;
    my %opts = @_;
    $opts{config} = $config;

    my $client = Net::Upwork::API::Client->new($config);
    $opts{client} = $client;

    my $self = bless \%opts, $class;

    return $self;
}

=item get_access_token()

    Get access token key/secret pair

B<Parameters>

$verifier

    OAuth verifier

B<Return value>

    A hash that contains access token and secret

=cut

sub get_access_token {
    my $self = shift;
    my ($verifier) = @_;

    chomp($verifier);

    $self->{client}{access_token} = $self->{client}{oauth_client}->get_access_token(
                    $self->{client}{request_token}{token},
                    $verifier,
                    token_secret => $self->{client}{request_token}{token_secret},
                );

    return {access_token => $self->{client}{access_token}{token}, access_secret => $self->{client}{access_token}{token_secret}}
}

=item get_authorization_url()

    Get Authorization Url and request token

B<Return value>

    A string for authorization in the browser

=cut

sub get_authorization_url {
    my $self = shift;

    $self->{client}{request_token} = $self->{client}{oauth_client}->get_request_token();
    return $self->{client}{oauth_client}->site_url($self->{client}{oauth_client}->_make_url('authorize', oauth_token => $self->{client}{request_token}{token}));
}

=item has_access_token()

    Check if access token has been already received

B<Return value>

    Boolean

=cut

sub has_access_token {
    my $self = shift;

    return defined $self->{client}{access_token} ||
            (!($self->{config}{access_token} eq "") && !($self->{config}{access_secret} eq ""));
}

=back

=item client()

    Get client object

B<Return value>

    Object

=cut

sub client {
    my $self = shift;
    return $self->{client};
}

=head1 AUTHOR

Maksym Novozhylov C<< <mnovozhilov@upwork.com> >>

=head1 COPYRIGHT

Copyright E<copy> Upwork Global Corp., 2015

=cut

1;
