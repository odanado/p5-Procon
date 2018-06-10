use strict;
use warnings;
use v5.18;


package Vector {
    sub new {
        my $class = shift;
        my ($size, $value) = @_;

        my $data;
        if (defined $size) {
            $data = [ map { $value } 1..$size ];
        }
        else {
            $data = [];
        }

        my $self = bless {
            _data => $data
        }, $class;
        return $self;
    }

    sub push_back {
        my ( $self, $x ) = @_;
        my $data = $self->{_data};
        push @$data => $x;
    }

    sub size {
        my $self = shift;
        my $data = $self->{_data};
        scalar(@$data);
    }

    sub at {
        my ( $self, $i ) = @_;
        my $data = $self->{_data};
        my $len = $self->size;
        die "invalid index: $i (size = $len)\n" unless 0 <= $i && $i < $self->size;
        $data->[$i];
    }

    sub front {
        my $self = shift;
        $self->at(0);
    }

    sub back {
        my $self = shift;
        $self->at($self->size - 1);
    }
};
1;
