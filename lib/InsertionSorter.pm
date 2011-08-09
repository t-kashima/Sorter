package InsertionSorter;
use base "Sorter";
use strict;
use warnings;

sub new {
		my ($class) = @_;
		my $self = $class->SUPER::new();
		return $self;
}

sub insertion_sort {
		my ($a,$n) = @_;
		my ($j,$t);
		for(my $i=1;$i<$n;$i++){
				$j = $i;
				while($j >= 1 && $a->[$j-1] > $a->[$j]){
						$t = $a->[$j];
						$a->[$j] = $a->[$j-1];
						$a->[$j-1] = $t;
						$j--;
				}
		}
}

sub sort {
		my ($self) = @_;
		my @array = @{$self->{values}};
		my $length =  @array;
		insertion_sort($self->{values},$length);
}

1;
