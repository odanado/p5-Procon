use strict;
use warnings;
use v5.18;

use Test::More;
use Test::Exception;

use Vector;

subtest 'new のテスト' => sub {
    my $vector = Vector->new(10);
    ok( $vector->at(0) == 0 );

    $vector = Vector->new( 10, 'poyo' );
    ok( defined $vector->at(0) );
    ok( $vector->at(0) eq 'poyo' );
};

my $vector = Vector->new();
$vector->push_back($_) for ( 1 .. 10 );

subtest 'atのテスト' => sub {
    ok( $vector->at(1) == 2 );

    dies_ok {
        $vector->at(10);
    }
    'expecting to die';
    dies_ok {
        $vector->at(-1);
    }
    'expecting to die';
};

ok( $vector->front == 1, 'frontのテスト' );
ok( $vector->back == 10, 'backのテスト' );

subtest 'pop_backのテスト' => sub {
    $vector->pop_back;
    ok( $vector->back == 9, '1回目' );
    $vector->pop_back;
    $vector->pop_back;
    ok( $vector->back == 7, '2回目' );
};

done_testing;
