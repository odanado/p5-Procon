use strict;
use warnings;
use v5.18;

use Test::More;
use Test::Exception;

use Vector;

my $vector = Vector->new();
$vector->push_back($_) for (1..10);

subtest 'atのテスト' => sub {
    ok($vector->at(1) == 2);

    dies_ok {
        $vector->at(10);
    } 'expecting to die';
    dies_ok {
        $vector->at(-1);
    } 'expecting to die';
};

ok($vector->front == 1, 'frontのテスト');
ok($vector->back == 10, 'backのテスト');

done_testing;
