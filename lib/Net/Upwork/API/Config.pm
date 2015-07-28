package Net::Upwork::API::Config;

use strict;
use warnings;

=pod

=head1 NAME

Config

=head1 FUNCTIONS

=over 4

=item new(%params)

Create a new Config

B<Parameters>

$params

    List of configuration options

=cut

sub new {
    my $class = shift;
    my %opts = @_;
    $opts{consumer_key} ||= "";
    $opts{consumer_secret} ||= "";
    $opts{access_token} ||= "";
    $opts{access_secret} ||= "";
    $opts{callback} ||= "oob";
    $opts{signature_method} ||= "HMAC-SHA1";
    $opts{debug} ||= 0;
    unless ($opts{consumer_key} && $opts{consumer_secret}) {
        die "You must specify a consumer key and a secret in the config\n";
    }
    my $self = bless \%opts, $class;

    return $self;
}

=back

=head1 AUTHOR

Maksym Novozhylov C<< <mnovozhilov@upwork.com> >>

=head1 COPYRIGHT

Copyright E<copy> Upwork Global Corp., 2015

=cut

1;
