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
		my $pivot = @$a[$r];
		my $t;
		while(1){
				while(@$a[++$i] < $pivot){}
				while($i < --$j && $pivot < @$a[$j]){}
				last if($i >= $j);
				$t = @$a[$i];
				@$a[$i] = @$a[$j];
				@$a[$j] = $t;
		}
		$t = @$a[$i];
		@$a[$i] = @$a[$r];
		@$a[$r] = $t;
		return $i;
}

sub quick_sort {
		my ($a,$l,$r) = @_;
		return if($l >= $r);
		my $v = partition($a,$l,$r);
		quick_sort($a,$l,$v-1);
		quick_sort($a,$v+1,$r);
}

sub sort {
		my ($self) = @_;
		my @array = @{$self->{values}};
		my $length =  @array;
		quick_sort($self->{values},0,$length-1);
}

1;
