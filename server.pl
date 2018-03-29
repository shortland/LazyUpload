#!/usr/bin/perl

# skeleton of http://perlmeme.org/tutorials/cgi_upload.html
# removed all parameter safety checking...
# this shouldn't be a public useable version.

# make sure to change the password in the BEGIN block.

use strict;
use warnings;
use CGI;

my $PASS;

BEGIN {
	$PASS = "password";
}

sub do_upload {
	my ($cgi) = @_;
	my ($bytesread, $buffer);
	my $num_bytes = 1024;
	my $totalbytes;
	my $filename = $cgi->upload('fileToUpload');
	my $file = "uploads/$filename";

	open (OUTFILE, ">", "$file") or die "Couldn't open $file for writing: $!";

	while ($bytesread = read($filename, $buffer, $num_bytes)) {
	    $totalbytes += $bytesread;
	    print OUTFILE $buffer;
	}

	die "Read failure" unless defined($bytesread);

	unless (defined($totalbytes)) {
	    print "<p>Error; unable to read file ${filename}, ";
	}
	else {
		print "success";
		close OUTFILE or die "Couldn't close $file: $!";
	}
}

BEGIN {
	my $cgi = CGI->new;
	print $cgi->header(-status=> '200 OK', -type => 'text');

	if ($cgi->param('pass') eq $PASS) {
		if (!$cgi->upload('fileToUpload')) {
			print "No file to upload.";
			exit;
		}
		do_upload($cgi);
	}
	else {
		print "Invalid pass.";
	}
}