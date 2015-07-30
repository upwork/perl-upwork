#!/usr/bin/env perl
use strict;
use Test::More tests => 9;
use lib qw(lib);
use Net::Upwork::API::Routers::Mc;

can_ok('Net::Upwork::API::Routers::Mc', 'new');
can_ok('Net::Upwork::API::Routers::Mc', 'get_trays');
can_ok('Net::Upwork::API::Routers::Mc', 'get_tray_by_type');
can_ok('Net::Upwork::API::Routers::Mc', 'get_thread_details');
can_ok('Net::Upwork::API::Routers::Mc', 'get_thread_by_context');
can_ok('Net::Upwork::API::Routers::Mc', 'get_thread_by_context_last_posts');
can_ok('Net::Upwork::API::Routers::Mc', 'start_new_thread');
can_ok('Net::Upwork::API::Routers::Mc', 'reply_to_thread');
can_ok('Net::Upwork::API::Routers::Mc', 'mark_thread');
