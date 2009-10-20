#!perl

# testing sequenced ordered events
# this is a more relaxed and flexible implementation of ADAMK's version
# it allows to define order by previous occured events
# instead of number of specific occurrence.
# that way, you can define which events should have preceded
# instead of what exact global order it had

# we don't care whether next run the correct number of times
# only that it ran with the correct dependencies that followed
package Session;
use Test::More tests => 14;
use MooseX::POE;
with 'POE::Test::Helpers';
has '+seq_ordering' => (
    default => sub { {
        'START' => 1,
        'next'  => [ 'START' ],
        'more'  => { 4 => [ 'START', 'next'                 ] },
        'last'  => { 1 => [ 'START', 'next', 'more'         ] },
        'STOP'  => { 1 => [ 'START', 'next', 'more', 'last' ] },
} } );

my $count = 0;
sub START           { $_[KERNEL]->yield('next') }
event 'next' => sub { $_[KERNEL]->yield('more') };
event 'more' => sub {
    $count++ < 3 ? $_[KERNEL]->yield('next') :
                   $_[KERNEL]->yield('last');
};
event 'last' => sub { 1 };

package main;
use POE::Kernel;
Session->new();
POE::Kernel->run();

