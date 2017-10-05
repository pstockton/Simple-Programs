######################################
#
#	by: Patrick Stockton
#
#	Sums up a list of entered numbers
#
######################################

#!/usr/bin/perl

use warnings;
use strict;

print("\nWritten by: Patrick Stockton\n\n");

my @array;
my $inp;
my $element;
my $sum = 0;
my $count = 0;

#Choose the number of values you wish to enter into the list
print("How many numbers do you want to enter?\n");
$count = <STDIN>;

#Input the selected number of values
print("\nEnter a list of ", $count, " numbers\n");
while (@array < $count) {
	$inp = <STDIN>;
	chomp $inp;
	push @array, $inp;
}

#Calculate total sum of list
foreach $element(@array){
	$sum = $sum + $element;
}

print ("Sum is $sum");

