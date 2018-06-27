use strict;
use warnings;
use utf8;
use v5.18;

use Test::More;

use PriorityQueue;

subtest "numeric" => sub {
    my $que = PriorityQueue->new;
    $que->push($_) for ( 1, 2, 10, 7, 5 );

    ok( $que->front == 10 );

    $que->pop;
    ok( $que->front == 7 );

    $que->pop;
    ok( $que->front == 5 );

    $que->pop;
    ok( $que->front == 2 );

    $que->pop;
    ok( $que->front == 1 );
};

subtest "string" => sub {
    my $que = PriorityQueue->new( sub { $_[0] gt $_[1] } );
    $que->push($_) for ('a', 'b', 'z', 'd');

    ok( $que->front == 'z' );

    $que->pop;
    ok( $que->front == 'd' );

    $que->pop;
    ok( $que->front == 'b' );

    $que->pop;
    ok( $que->front == 'a' );
};

done_testing;
