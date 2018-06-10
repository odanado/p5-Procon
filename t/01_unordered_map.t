use strict;
use warnings;
use v5.18;

use Test::More;
use Test::Exception;

use UnorderedMap;
subtest 'insert のテスト' => sub {
    my $map = UnorderedMap->new();
    $map->insert('a', 10);
    $map->insert('b', 20);

    ok($map->at('b') == 20);

    $map->at('zzz');
    ok(exists $map->{_data}->{'zzz'}, '存在しないkeyにアクセスするとvalueが追加される');
    ok(!undef $map->{_data}->{'zzz'}, '追加されるvalueはundef');
};

subtest 'count のテスト' => sub {
    my $map = UnorderedMap->new();
    $map->insert('a', 10);

    ok($map->count('a') == 1);
    ok($map->count('b') == 0);
};

subtest 'erase のテスト' => sub {
    my $map = UnorderedMap->new();
    $map->insert('a');

    ok($map->count('a') == 1);
    $map->erase('a');
    ok($map->count('a') == 0);
};


my $map = UnorderedMap->new();
$map->insert('a', 10);

ok($map->size == 1, 'size のテスト');
ok(!$map->empty, 'empty のテスト');

$map->clear;
ok($map->empty, 'clear のテスト');

done_testing;
