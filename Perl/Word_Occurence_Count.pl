######################################
#
#	by: Patrick Stockton
#
#	Enter a list of words and print the 
#	occurence of each word, sort.
#
######################################

#!/usr/bin/perl

use warnings;
use strict;

print("\nWritten by: Patrick Stockton\n\n");

my %count;

my $inp = "";
my $val;
my @array;

print("Enter words, or enter STOP to end input:\n\n");

#Allow inputs until STOP is entered
while ($inp ne "STOP") {
	$inp = <STDIN>;
	chomp($inp);
	if ($inp eq "STOP") { #Exit loop
		last;
	}
	push @array, $inp;
	#chomp($inp);
}

#Count the number of occurences for each word
foreach (@array) {
	if (exists $count{$_}) {
		$count{$_}++;
	} else {
		$count{$_} = 1;
	}
}

print("\nWord occurences:\n");

#Print the number of occurences with the key words
foreach (keys %count) {
	print "$_: $count{$_}\n";
}
