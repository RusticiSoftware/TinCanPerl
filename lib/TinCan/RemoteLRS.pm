package TinCan::RemoteLRS;

use Carp;
use LWP::UserAgent;
use Moo;
use namespace::clean;

use TinCan;
use TinCan::LRSResponse;
use TinCan::About;

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

my $_ua = LWP::UserAgent->new(
    ssl_opts => { verify_hostname => 0 }
);

sub _sendRequest {
    my $self = shift;
    my ($method, $resource, $options) = @_;

    my $url = $self->endpoint . $resource;

    my $response = TinCan::LRSResponse->new;

    my $req = HTTP::Request->new(
        $method => $url,
    );
    $response->httpRequest($req);

    my $res = $_ua->request($req);
    $response->httpResponse($res);

    $response->content($res->content);
    $response->success($res->is_success);

    return $response;
}

sub about {
    my $self = shift;

    my $response = $self->_sendRequest('GET', 'about');
    if ($response->success) {
        $response->content(TinCan::About->fromJSON($response->content));
    }

    return $response;
}

1;

__END__

=head1 NAME

TinCan::RemoteLRS - Learning record store abstraction class

=head1 SYNOPSIS

    use TinCan::RemoteLRS;

    my $lrs = TinCan::RemoteLRS->new(
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
