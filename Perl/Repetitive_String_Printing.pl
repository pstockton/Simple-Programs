######################################
#
#	by: Patrick Stockton
#
#	Print a string a number of times
#
######################################

#!/usr/bin/perl

use warnings;
use strict;

print "\n\nThis program asks for a string, and the number of times to repeat it\n";
print "Written by: Patrick Stockton\n\n";

my $num = 0;
my $str = "";

#input chosen string
print "Input your chosen string: \n";
$str = <STDIN>;

#input chosen repetition time
print "\nInput an integer value for the number of times to repeat the string: \n";
$num = <STDIN>;

print "$str" x$num;