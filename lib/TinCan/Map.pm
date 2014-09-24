package TinCan::Map;

use Moo;
use namespace::clean;

our $VERSION = '0.01';

has _map => (
    is => 'rw',
    default => sub {
        return {};
    },
    isa => sub {
        my $value = $_[0];
        die "$_[0]\n" unless ref $value eq 'HASH';
    },
);

sub asVersion {
    my $self = shift;

    my $result;
    if (! $self->isEmpty()) {
        # TODO: wantarray?
        return %{ $self->_map };
    }

    return;
}

sub isEmpty {
    return keys %{$_[0]->_map};
}

sub set {
    my $self = shift;
    my ($key, $val) = @_;

    $self->_map->{$key} = $val;

    return $self;
}

sub get {
    my $self = shift;
    my ($key) = @_;

    return $self->_map->{$key};
}

1;

__END__

=head1 NAME

TinCan::Map - Base class of key/value pair objects

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
