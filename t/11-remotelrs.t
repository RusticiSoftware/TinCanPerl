#!perl -T

use strict;
use warnings FATAL => 'all';
use Test::More;
use Test::Exception;

my ($class, $lrs, $endpoint);
BEGIN {
    $class = 'TinCan::RemoteLRS';
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

# TODO: make this configurable
$endpoint = 'https://www.example.com/tc/';

$lrs = $class->new(
    endpoint => $endpoint
);
is($lrs->endpoint, $endpoint, 'endpoint() get');

my $value = $lrs->about;
#is($value, 1, 'sendRequest');
#diag explain $value;

done_testing();

__END__
