use strict;
use warnings;
use v5.18;

package UnorderedSet {
    sub new {
        my $class = shift;

        my $self = bless {
            _data => {}
        }, $class;
        return $self;
    }

    sub insert {
        my ( $self, $x ) = @_;
        $self->{_data}->{$x} = undef;
    }

    sub erase {
        my ( $self, $x ) = @_;
        delete $self->{_data}->{$x};
    }

    sub count {
        my ( $self, $x ) = @_;
        exists $self->{_data}->{$x} ? 1 : 0;
    }

    sub size {
        my $self = shift;
        scalar(keys %{$self->{_data}});
    }

    sub empty {
        shift->size == 0;
    }

    sub clear {
        undef shift->{_data};
    }
};

1;
