#!perl -T

use strict;
use warnings FATAL => 'all';
use Test::More;
use Test::Exception;

my ($class, $lrs, $endpoint);
BEGIN {
    $class = 'TinCan::LRS';
    use_ok($class);
}

$lrs = new_ok($class);
is($lrs->endpoint, undef, 'endpoint() undefined');
is($lrs->version, '1.0.1', 'version defaults to latest');

throws_ok(
    sub {
        $lrs = $class->new( version => '0.0.1');
    },
    qr/\Aisa check for "version" failed: 0.0.1$/,
    'invalid version'
);

$lrs = $class->new(
    endpoint => $endpoint
);
is($lrs->endpoint, $endpoint, 'endpoint() get');

my $value = $lrs->sendRequest;
is($value, 1, 'sendRequest');

done_testing();

__END__
