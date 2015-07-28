package Net::Upwork::API::Routers::Auth;

use strict;
use warnings;
use parent "Net::Upwork::API";

use constant ENTRY_POINT => Net::Upwork::API::Client::ENTRY_POINT_API;

=pod

=head1 NAME

Auth

=head1 FUNCTIONS

=over 4

=item new($api)

Create a new object for accessing Auth API

B<Parameters>

$api

    API object

=cut

sub new {
    my $class = shift;
    my $api = shift;
    my %opts = @_;
    $opts{client} = $api->{client};
    $opts{client}{epoint} = ENTRY_POINT;
    my $self = bless \%opts, $class;

    return $self;
}

=item get_user_info

    Get user info

=cut

sub get_user_info {
    my $self = shift;
    my %params = @_;

    return $self->client()->get("/auth/v1/info", %params);
}

=back

=head1 AUTHOR

Maksym Novozhylov C<< <mnovozhilov@upwork.com> >>

=head1 COPYRIGHT

Copyright E<copy> Upwork Global Corp., 2015

=cut

1;
