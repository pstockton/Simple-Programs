######################################
#
#	by: Patrick Stockton
#
#	Convert chosen decimal number into binary
#
######################################

#!/usr/bin/perl

use warnings;
use strict;

print "\n\nThis program asks for a decimal number and converts it to binary\n";
print "Written by: Patrick Stockton\n\n";

my $num = 0;
my @binaryValue;

#Ask for decimal number
print "Enter your chosen Decimal value: \n";

$num = <STDIN>;

#Calculate the binary value
while ($num >= 1) {
	if ($num % 2 == 0) {
		@binaryValue = (@binaryValue, 0);
	} elsif ($num % 2 == 1) {
		@binaryValue = (@binaryValue, 1);
	} else {
		#print "x";
	}
	$num = $num / 2;

}

print "The binary representation is ", reverse(@binaryValue), " \n";