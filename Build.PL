use 5.006;
use strict;
use warnings FATAL => 'all';
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'TinCan',
    license             => 'Apache_2_0',
    dist_author         => q{Brian J. Miller <brian.miller@tincanapi.com>},
    dist_version_from   => 'lib/TinCan.pm',
    release_status      => 'stable',
    configure_requires => {
        'Module::Build' => 0,
    },
    build_requires => {
        'Test::More' => 0,
        'Test::Exception' => 0,
    },
    requires => {
        'Moo'  => 1.004002,
        'LWP'  => 6.04,
        'JSON' => 2.90,
        #'UUID::Tiny' => ,
    },
    recommends => {
        #'JSON::XS' => '>2.34, <3',
        'JSON::XS' => 0,
    },
    add_to_cleanup     => [ 'tincan-*' ],
    create_makefile_pl => 'traditional',
);

$builder->create_build_script();
