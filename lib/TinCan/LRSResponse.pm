package TinCan::LRSResponse;

use Moo;
use namespace::clean;

our $VERSION = '0.01';

has success => ( is => 'rw' );
has content => ( is => 'rw' );
has httpRequest => ( is => 'rw' );
has httpResponse => ( is => 'rw' );

1;

__END__

=head1 NAME

TinCan::LRSResponse - Object provided as return from LRS calls

=head1 SYNOPSIS

    use TinCan::LRSResponse;

    my $verb = TinCan::Verb->new(
        success => true,
        content => ...
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
