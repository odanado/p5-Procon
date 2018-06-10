use strict;
use warnings;
use v5.18;

use Test::More;
use Test::Exception;

use UnorderedSet;

subtest 'count のテスト' => sub {
    my $set = UnorderedSet->new();
    $set->insert('a');

    ok($set->count('a') == 1);
    ok($set->count('b') == 0);
};

subtest 'erase のテスト' => sub {
    my $set = UnorderedSet->new();
    $set->insert('a');

    ok($set->count('a') == 1);
    $set->erase('a');
    ok($set->count('a') == 0);
};


my $set = UnorderedSet->new();
$set->insert('a');

ok($set->size == 1, 'size のテスト');
ok(!$set->empty, 'empty のテスト');

$set->clear;
ok($set->empty, 'clear のテスト');

done_testing;
