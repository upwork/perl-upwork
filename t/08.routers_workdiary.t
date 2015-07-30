#!/usr/bin/env perl
use strict;
use Test::More tests => 3;
use lib qw(lib);
use Net::Upwork::API::Routers::Workdiary;

can_ok('Net::Upwork::API::Routers::Workdiary', 'new');
can_ok('Net::Upwork::API::Routers::Workdiary', 'get');
can_ok('Net::Upwork::API::Routers::Workdiary', 'get_by_contract');
