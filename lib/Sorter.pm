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

sub partition{
		my ($a,$l,$r) = @_;
		my $i = $l - 1;
		my $j = $r;
		my $pivot = $a->[$r];
		my $t;
		while(1){
				while($a->[++$i] < $pivot){}
				while($i < --$j && $pivot < $a->[$j]){}
				last if($i >= $j);
				$t = $a->[$i];
				$a->[$i] = $a->[$j];
				$a->[$j] = $t;
		}
		$t = $a->[$i];
		$a->[$i] = $a->[$r];
		$a->[$r] = $t;
		return $i;
}

sub quick_sort {
		my ($a,$l,$r) = @_;
		return if($l >= $r);
		my $v = partition($a,$l,$r);
		quick_sort($a,$l,$v-1);
		quick_sort($a,$v+1,$r);
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
		#quick_sort($self->{values},0,$length-1);
		#bubble_sort($self->{values},$length);
		insertion_sort($self->{values},$length);
}

1;
