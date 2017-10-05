######################################
#
#	by: Patrick Stockton
#
#	Squaring an inputted number
#
######################################

#!/usr/bin/perl

use warnings;
use strict;

print "\n\nThis program asks for a number and prints the square of the number\n";
print "Written by: Patrick Stockton\n\n";

my $num = 0;
my $numSqr = 0;

#input chosen number
print ("Please enter a number: \n");
$num = <STDIN>;
$numSqr = $num * $num;

print ("\nThe square of $num is = $numSqr \n\n");