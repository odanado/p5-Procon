use strict;
use warnings;
use v5.18;

use Test::More;
use Test::More::UTF8;

use Test::LoadAllModules;

all_uses_ok(
    lib => [
        'lib',
    ]
);

done_testing;
