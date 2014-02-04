#!perl -T

use strict;
use warnings FATAL => 'all';
use Test::More tests => 2;

BEGIN {
    use_ok( 'TinCan' ) || print "Bail out!\n";
    use_ok( 'TinCan::LRS' ) || print "Bail out!\n";
}

diag( "Testing TinCan $TinCan::VERSION, Perl $], $^X" );

__END__
