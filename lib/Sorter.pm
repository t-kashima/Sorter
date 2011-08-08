package Sorter;
use strict;
#use warnings;
use Data::Dumper;

sub new {
		my ($class) = @_;
		my $data_structure = {
				values => [],
		};
		my $self = bless $data_structure, $class;
		return $self;
}

sub set_values {
		my ($self, @values) = @_;
		$self->{values} = [@values];
		return $self;
}

sub get_values {
		my ($self) = @_;
		return @{ $self->{values} };
}

sub quick_sort {
		my ($a,$p,$r) = @_;
		if($p < $r){
				my $q = &partition($a,$p,$r);
				&quick_sort($a,$p,$q-1);
				&quick_sort($a,$q+1,$r);
		}
}

sub partition {
    my ($a, $p, $r) = @_;
    my $x = @$a[$r-1];
    my $i = $p - 1;
    foreach my $j (($p..$r-1)){
				if (@$a[$j-1] <= $x) {
						$i++;
						my $tmp = @$a[$i-1];
						@$a[$i-1] = @$a[$j-1];
						@$a[$j-1] = $tmp;
				}
    }
    my $tmp = @$a[$i+1-1];
    @$a[$i+1-1] = @$a[$r-1];
    @$a[$r-1] = $tmp;
    return $i+1;
}

sub sort {
		my ($self) = @_;
		my @a = @{$self->{values}};
		my $len = $#a+1;
		quick_sort($self->{values},1,$len);
}

1;
