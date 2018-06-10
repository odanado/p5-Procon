use strict;
use warnings;
use utf8;
use v5.18;

use Test::More;
use Test::Exception;

use UnionFind;

my $uf = UnionFind->new(10);

$uf->unite(1, 2);
$uf->unite(1, 3);

ok($uf->same(1, 3));
ok(not $uf->same(1, 4));

done_testing;
