use strict;
use warnings;
use utf8;
use v5.18;

use Vector;

package UnionFind {
    sub new {
        my ($class, $size) = @_;

        my $parent = Vector->new;
        $parent->push_back($_) for ( 0 .. $size );
        my $rank = Vector->new($size, 0);

        my $self = bless {
            size      => $size,
            parent => $parent,
            rank   => $rank
          },
          $class;
        return $self;
    }

    sub find {
        my ( $self, $x ) = @_;
 
        return $x if $self->{parent}->at($x) == $x;
 
        $self->{parent}->at($x, $self->find( $self->{parent}->at($x) ));
        $self->{parent}->at($x);
    }

    sub unite {
        my ( $self, $x, $y ) = @_;
        $x = $self->find($x);
        $y = $self->find($y);
        return if $x == $y;
 
        my $rank   = $self->{rank};
        my $parent = $self->{parent};
 
        if ( $rank->at($x) < $rank->at($y) ) {
            $parent->at($x, $y);
        }
        else {
            $parent->at($y, $x);
            if ( $rank->at($x) == $rank->at($y) ) {
                $rank->at($x, $rank->at($x) + 1);
            }
        }
    }

    sub same {
        my ( $self, $x, $y ) = @_;
        $self->find($x) == $self->find($y);
    }
};

1;
