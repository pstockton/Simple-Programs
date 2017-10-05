######################################
#
#	by: Patrick Stockton
#
#	This program looks for dates in the 
#	format of MM-DD-YYYY and converts them 
#	to the format of year/day/month.
#
######################################

#!/usr/bin/perl

use warnings;
use strict;

print ("Written by: Patrick Stockton\n\n");
print ("This program looks for dates in the format of MM-DD-YYYY and converts them to the format of year/day/month.\n");

$_ = 'We hired John in 02-28-2015. He is working on product 45-002X-1032. John entered UTSA 10-16-2010 and graduate in 05-30-2015.';

print "\nORIGINAL TEXT:\n";
print $_;
print "\n\n";

# Hash is used to replace dates with month names
my %hash = ("01" => "January",
			"02" => "February",
			"03" => "March",
			"04" => "April",
			"05" => "May",
			"06" => "June",
			"07" => "July",
			"08" => "August",
			"09" => "September",
			"10" => "October",
			"11" => "November",
			"12" => "December"
			);

# Finds the desired pattern and replaces with new pattern until old pattern is no longer found
while (/([0-9]{2})-([0-9]{2})-([0-9]{4})/) {
	s/([0-9]{2})-([0-9]{2})-([0-9]{4})/$3\/$hash{$1}\/$2/;
}

#Printing the replaced dates in the string
print "\nNEW TEXT:\n";
print $_;
print "\n\n";


#if (/([0-9]{2})-([0-9]{2})-([0-9]{4})/) {
#	print $3."/".$hash{$1}."/".$2;
#	print "\n\n";
#}

#if (/.*([0-9]{2})-([0-9]{2})-([0-9]{4})/) {
#	print $3."/".$hash{$1}."/".$2;
#	print "\n\n";
#}