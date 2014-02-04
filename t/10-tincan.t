#!perl -T

use strict;
use warnings FATAL => 'all';
use Test::More;

my ($class);
BEGIN {
    $class = 'TinCan';
    use_ok($class);
}

is_deeply(
    \@TinCan::VERSIONS,
    [
        qw(
            1.0.1
            1.0.0
            0.95
            0.9
        )
    ],
    'supported versions'
);

done_testing();

__END__
