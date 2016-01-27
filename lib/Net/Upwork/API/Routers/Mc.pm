# Licensed under the Upwork's API Terms of Use;
# you may not use this file except in compliance with the Terms.
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Author::    Maksym Novozhylov (mnovozhilov@upwork.com)
# Copyright:: Copyright 2015(c) Upwork.com
# License::   See LICENSE.txt and TOS - https://developers.upwork.com/api-tos.html

package Net::Upwork::API::Routers::Mc;

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
    my ($class, $api) = @_;
    return Net::Upwork::API::init_router($class, $api, ENTRY_POINT);
}

=item get_trays

    Get trays

B<Return value>

    JSON response as a string

=cut

sub get_trays {
    my $self = shift;

    return $self->client()->get("/mc/v1/trays");
}

=item get_tray_by_type

    Get tray by type

B<Parameters>

$username

    Username

$type

    Thread type

$params

    (Optional) Hash of parameters

B<Return value>

    JSON response as a string

=cut

sub get_tray_by_type {
    my $self = shift;
    my $username = shift;
    my $type = shift;
    my %params = @_;

    return $self->client()->get("/mc/v1/trays/" . $username . "/" . $type, %params);
}

=item get_thread_details

    List thread details based on thread id

B<Parameters>

$username

    Username

$thread_id

    Thread ID

B<Return value>

    JSON response as a string

=cut

sub get_thread_details {
    my $self = shift;
    my $username = shift;
    my $thread_id = shift;

    return $self->client()->get("/mc/v1/threads/" . $username . "/" . $thread_id);
}

=item get_thread_by_context

    Get a specific thread by context

B<Parameters>

$username

    Username

$job_key

    Thread ID

$application_id

    Application ID

$context

    Optional, by default 'Interviews'. Context

B<Return value>

    JSON response as a string

=cut

sub get_thread_by_context {
    my $self = shift;
    my $username = shift;
    my $job_key = shift;
    my $application_id = shift;
    my $context = shift;
    $context ||= 'Interviews';

    return $self->client()->get("/mc/v1/contexts/" . $username . "/" . $context . ":" . $job_key . ":" . $application_id);
}

=item get_thread_by_context_last_posts

    Get a specific thread by context (last message content)

B<Parameters>

$username

    Username

$job_key

    Thread ID

$application_id

    Application ID

$context

    Context

B<Return value>

    JSON response as a string

=cut

sub get_thread_by_context_last_posts {
    my $self = shift;
    my $username = shift;
    my $job_key = shift;
    my $application_id = shift;
    my $context = shift;
    $context ||= 'Interviews';

    return $self->client()->get("/mc/v1/contexts/" . $username . "/" . $context . ":" . $job_key . ":" . $application_id . "/last_posts");
}

=item start_new_thread

    Send new message

B<Parameters>

$username

    Username

$params

    Hash of parameters

B<Return value>

    JSON response as a string

=cut

sub start_new_thread {
    my $self = shift;
    my $username = shift;
    my %params = @_;

    return $self->client()->post("/mc/v1/threads/" . $username, %params);
}

=item reply_to_thread

    Reply to existent thread

B<Parameters>

$username

    Username

$thread_id

    Thread ID

$params

    Hash of parameters

B<Return value>

    JSON response as a string

=cut

sub reply_to_thread {
    my $self = shift;
    my $username = shift;
    my $thread_id = shift;
    my %params = @_;

    return $self->client()->post("/mc/v1/threads/" . $username . "/" . $thread_id, %params);
}

=item mark_thread

    Update threads based on user actions

B<Parameters>

$username

    Username

$thread_id

    Thread ID

$params

    Hash of parameters

B<Return value>

    JSON response as a string

=cut

sub mark_thread {
    my $self = shift;
    my $username = shift;
    my $thread_id = shift;
    my %params = @_;

    return $self->client()->put("/mc/v1/threads/" . $username . "/" . $thread_id, %params);
}

=back

=head1 AUTHOR

Maksym Novozhylov C<< <mnovozhilov@upwork.com> >>

=head1 COPYRIGHT

Copyright E<copy> Upwork Global Corp., 2015

=cut

1;
