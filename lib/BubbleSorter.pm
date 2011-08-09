package BubbleSorter;
use base "Sorter";
use strict;
use warnings;

sub new {
		my ($class) = @_;
		my $self = $class->SUPER::new();
		return $self;
}

sub bubble_sort {
		my ($a,$n) = @_;
		my $t;
		for(my $i=0;$i<$n-1;$i++){
				for(my $j=$n-1;$j>$i;$j--){
						if($a->[$j-1] > $a->[$j]){
								$t = $a->[$j];
								$a->[$j] = $a->[$j-1];
								$a->[$j-1] = $t;
						}
				}
		}
}

sub sort {
		my ($self) = @_;
		my @array = @{$self->{values}};
		my $length =  @array;
		bubble_sort($self->{values},$length);
}

1;
