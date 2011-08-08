#!/usr/bin/env perl

use strict;
use lib './lib';
use Sorter;

sub main {
		my $sorter = Sorter->new;
		$sorter->set_values(5,5,4,4,4,3,2,1);
		$sorter->sort;
		print $sorter->get_values;
}

&main;

1;
