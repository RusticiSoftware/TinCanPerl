package TinCan::Role::FromJSON;

our $VERSION = '0.01';

use JSON;

use Moo::Role;

sub fromJSON {
    my $self = shift;
    my $json_string = shift;

    return $self->new(%{ decode_json $json_string });
}

1;

__END__

=head1 NAME

TinCan::Role::FromJSON -

=head1 SYNOPSIS

    use TinCan::Role::FromJSON;

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
