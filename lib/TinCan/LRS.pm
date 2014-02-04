package TinCan::LRS;

use TinCan;

use Carp;
use LWP::UserAgent;
use Moo;
use namespace::clean;

our $VERSION = '0.01';

# TODO: check format
has endpoint => (
    is => 'rw',
);

has version => (
    is => 'rw',
    default => sub {
        return $TinCan::VERSIONS[0];
    },
    isa => sub {
        my $value = $_[0];
        die "$_[0]\n" unless grep { $_ eq $value } @TinCan::VERSIONS;
    },
);

has auth => (
    is => 'rw',
);

has extended => (
    is => 'rw',
);

my $_ua = LWP::UserAgent->new;

sub sendRequest {
    my $self = shift;
    my $req = HTTP::Request->new(
        GET => 'http://cloud.scorm.com/tc/3HYPTQLAI9/sandbox/about'
    );
    my $res = $_ua->request($req);

    if ($res->is_success) {
        carp "Successful response!";
        carp $res->content;
    }
    else {
        carp "Request failed: " . $res->status_line . "\n";
    }

    return 1;
}

1;

__END__

=head1 NAME

TinCan::LRS - Learning record store abstraction class

=head1 SYNOPSIS

    use TinCan::LRS;

    my $lrs = TinCan::LRS->new(
        endpoint => 'https://.....',
        username => 'tcapi_user',
        password => '****'
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
