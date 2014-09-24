package TinCan::About;

use Moo;
use namespace::clean;

use TinCan::Extensions;

our $VERSION = '0.01';

with 'TinCan::Role::FromJSON';

# TODO: set default array?
has version => (
    is => 'rw',
    isa => sub {
        my $value = $_[0];
        die "$_[0]\n" unless ref $value eq 'ARRAY';
    },
    default => sub { return []; }
);

has extensions => (
    is => 'rw',
    isa => sub {
        die "$_[0] not a TinCan::Extensions\n" unless ref $_[0] eq 'TinCan::Extensions';
    },
    default => sub {
        return TinCan::Extensions->new();
    },
    # NEXT - coerce?
);

1;

__END__

=head1 NAME

TinCan::About -

=head1 SYNOPSIS

    use TinCan::About;

    my $about = TinCan::About->new(
        version    => 'http://.....',
        extensions => {
        },
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
