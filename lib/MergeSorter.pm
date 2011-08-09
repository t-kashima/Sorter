package MergeSorter;
use base "Sorter";
use strict;
use warnings;

sub new {
		my ($class) = @_;
		my $self = $class->SUPER::new();
		return $self;
}

sub merge_sort {
		my ($a,$low,$high) = @_;
		return if($low >= $high);
		my $mid = int(($low + $high)/2);
		merge_sort($a,$low,$mid);
		merge_sort($a,$mid+1,$high);
		my @b = [];
		for(my $i=$low;$i<=$mid;$i++){
				$b->[$i] = $a->[$i];
		}
		for(my $i = $mid+1,my $j=$high;$i<=$high;$i++,$j--){
				$b->[$i] = $a->[$j];
		}
		my $i = $low;
		my $j = $high;
		for(my $k = $low;$k<=$high;$k++){
				if($b->[$i] <= $b->[$j]){
						$a->[$k] = $b->[$i++];
				}else{
						$a->[$k] = $b->[$j--];
				}
		}
}

sub sort {
		my ($self) = @_;
		my @array = @{$self->{values}};
		my $length =  @array;
		merge_sort($self->{values},0,$length-1);
}

1;
