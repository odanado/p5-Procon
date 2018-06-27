use strict;
use warnings;
use utf8;
use v5.18;

use Vector;

package PriorityQueue {

    sub new {
        my ( $class, $cmp ) = @_;
        $cmp = sub { $_[0] > $_[1] }
          unless defined($cmp);
        my $data = Vector->new;

        my $self = bless {
            _data => $data,
            _cmp  => $cmp
          },
          $class;
        return $self;
    }

    sub push {
        my ( $self, $x ) = @_;
        $self->{_data}->push_back($x);
        $self->_upheap();
    }

    sub front {
        shift->{_data}->front;
    }

    sub pop {
        my $self = shift;
        my $data = $self->{_data};

        my $x = $data->back;
        $data->at( 0, $x );

        $data->pop_back;
        $self->_downheap();
    }

    sub _upheap {
        my $self = shift;
        my $data = $self->{_data};
        my $i    = $data->size - 1;

        while ( $i > 0 ) {
            $self->_comp_and_swap( $i, int( ( $i - 1 ) / 2 ) );
            $i = int( ( $i - 1 ) / 2 );
        }
    }

    sub _downheap {
        my $self = shift;
        my $data = $self->{_data};

        my $i = 0;
        while ( $i < $data->size ) {
            $self->_comp_and_swap( 2 * $i + 2, 2 * $i + 1 );
            if ( $self->_comp_and_swap( 2 * $i + 1, $i ) ) {
                $i = 2 * $i + 1;
                next;
            }
            else {
                last;
            }
        }
    }

    sub _comp_and_swap {
        my ( $self, $i, $j ) = @_;
        my $data = $self->{_data};

        return 0 unless $i < $data->size;
        return 0 unless $j < $data->size;

        my $x = $data->at($i);
        my $y = $data->at($j);
        if ( $self->{_cmp}->( $x, $y ) ) {
            $data->at( $i, $y );
            $data->at( $j, $x );
            return 1;
        }
        return 0;
    }
}

1;
