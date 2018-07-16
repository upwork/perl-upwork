#!/usr/bin/env perl
use strict;
use Test::More tests => 4;
use lib qw(lib);
use Net::Upwork::API::Routers::Reports::Finance::Billings;

can_ok('Net::Upwork::API::Routers::Reports::Finance::Billings', 'new');
can_ok('Net::Upwork::API::Routers::Reports::Finance::Billings', 'get_by_freelancer');
can_ok('Net::Upwork::API::Routers::Reports::Finance::Billings', 'get_by_buyers_team');
can_ok('Net::Upwork::API::Routers::Reports::Finance::Billings', 'get_by_buyers_company');
