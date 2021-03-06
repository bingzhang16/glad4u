#!/usr/local/bin/perl
#
#/********************************************************************************************
# * This code will go through geneidspubids.txt file and create a new file where             *
# * each line contains a gene ID with the total number of publications related to this gene. *
# ********************************************************************************************/

my (@buf1H, $buf2H, @buf1, $buf2);
open(INPUTH, "<../pubidsgeneids-homo.txt");			# will only use the human genes
open(OUTPUTH, ">../pubidsnbgeneids-homo.txt");
open(INPUT, "<../pubidsgeneids.txt");				# will use all species genes
open(OUTPUT, ">../pubidsnbgeneids.txt");

while (<INPUTH>) {
    @buf1H = split(/\t/);
    $buf1H[0] =~ s/\n//g;
	$buf2H = split(/,/, $buf1H[1]);
	print(OUTPUTH "$buf1H[0]\t$buf2H\n");
}

while (<INPUT>) {
    @buf1 = split(/\t/);
    $buf1[0] =~ s/\n//g;
	$buf2 = split(/,/, $buf1[1]);
	print(OUTPUT "$buf1[0]\t$buf2\n");
}

close(INPUT);
close(OUTPUT);
close(INPUTH);
close(OUTPUTH);
