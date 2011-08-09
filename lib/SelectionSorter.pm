package SelectionSorter;
use base "Sorter";
use strict;
use warnings;

sub new {
		my ($class) = @_;
		my $self = $class->SUPER::new();
		return $self;
}

sub selection_sort {
		my ($a,$n) = @_;
		my ($lowest,$lowkey,$t);
		for(my $i=0;$i<$n-1;$i++){
				$lowest = $i;
				$lowkey = $a->[$i];
				for(my $j = $i+1;$j<$n;$j++){
						if($a->[$j] < $lowkey){
								$lowest = $j;
								$lowkey = $a->[$j];
						}
				}
				$t = $a->[$i];
				$a->[$i] = $a->[$lowest];
				$a->[$lowest] = $t;
		}
}

sub sort {
		my ($self) = @_;
		my @array = @{$self->{values}};
		my $length =  @array;
		selection_sort($self->{values},$length);
}

1;
