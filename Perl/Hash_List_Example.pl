######################################
#
#	by: Patrick Stockton
#
#	Input or read student info from a Hash list
#
######################################

#!/usr/bin/perl

use warnings;
use strict;

print("\nWritten by: Patrick Stockton\n\n");

my $studentName = "";
my $studentNumber = 0;

my %studentInfo = (
);


print("Enter 1 for insert student number and student name,\n2 for retrieving student name,\n0 for quit\n");
my $chosenOption = <STDIN>;

#Loop for inputting and read inputted student information
while ($chosenOption != 0) {
	if ($chosenOption == 1) { #Input new student number and name
		print("\nEnter student number and student name: ");
		$studentNumber = <STDIN>;
		$studentName = <STDIN>;
		$studentInfo{$studentNumber} = $studentName;
	} elsif ($chosenOption == 2) { #Read a student's name from entered number
		print("\nEnter student number: \n");
		$studentNumber = <STDIN>;
		print($studentInfo{$studentNumber}, "\n");
	} elsif ($chosenOption == 0) { #Quit the program
		print("\nExiting program...\n");
	}
	print("\nEnter 1 for insert student number and student name,\n2 for retrieving student name,\n0 for quit\n");
	$chosenOption = <STDIN>;
}
