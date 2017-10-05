######################################
#
#	by: Patrick Stockton
#
#	This program looks for the words ee5203
#	and engineering_programming in the line 
#	that you input, and prints out the line 
#	if both words are present
#
######################################

#!/usr/bin/perl

use warnings;
use strict;

print ("Written by: Patrick Stockton\n\n");
print ("This program looks for the words \"ee5203\" and \"engineering_programming\" in the line you input, and prints out the line if both words are present.\n");

my $input_line = "";
my $exit_loop = "STOP";
my $input_options = 1;

while ($input_line ne $exit_loop) {
	print ("\n--------------------------------");
	print ("\nInput a new text line, or enter STOP to end input...\n");
	$input_line = <STDIN>;
	chomp($input_line);
	
	if ($input_line =~ /ee5203/ && $input_line =~ /engineering_programming/) {
		print ("\nWords found!\n", $input_line, "\n");
	} elsif ($input_line =~ /STOP/) {	#exits out of the loop if STOP is inputted
		last;
	} else {
		print ("\nWords not found\n");
	}

}

