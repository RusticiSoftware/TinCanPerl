package TinCan::Verb;

use Carp;
use Moo;
use namespace::clean;

use TinCan::LanguageMap;

our $VERSION = '0.01';

# TODO: check format
has id => (
    is => 'rw',
);

has display => (
    is => 'rw',
    default => sub {
        return TinCan::LanguageMap->new();
    },
    isa => sub {
        my $value = $_[0];
        die "$_[0]\n" unless grep { $_ eq $value } @TinCan::VERSIONS;
    },
);

1;

__END__

=head1 NAME

TinCan::Verb - Verb model

=head1 SYNOPSIS

    use TinCan::Verb;

    my $verb = TinCan::Verb->new(
        id => 'http://.....',
        display => {
            'en-US': 'Sample'
        }
    );
    ...

=head1 LICENSE AND COPYRIGHT

Copyright 2014 Rustici Software

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    L<http://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

=cut
