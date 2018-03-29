#!/usr/bin/perl

use strict;
use warnings;
use HTTP::Request::Common;
use LWP::UserAgent;

my $URL;

BEGIN {
	##
	# CHANGE ME
	# change the url to the upload script location on your server
	##
	$URL = "http://ilankleiman.com/uploader.pl";
}

sub upload {
	my ($pass, $fname, $url) = @_;
	my $ua = LWP::UserAgent->new();
	my $req = POST $url, Content_Type => 'multipart/form-data', Content => [pass => $pass, fileToUpload => [$fname]];
	my $res = $ua->request($req)->content;
	return $res . "\n";
}

sub parse_parameters {
	my ($pass, $fname) = @_;
	if (!defined $fname || $fname =~ m/^[(\s*)]/ || !defined $pass || $fname =~ m/^[(\s*)]/) {
		print "Error: Missing Argument\n";
		print "Correct usage: \$ perl uploader.pl [password] [full path to file]\n";
		exit;
	}
}

BEGIN {
	parse_parameters($ARGV[0], $ARGV[1]);
	print "Uploading To: $URL\n";
	print "...\n" . upload($ARGV[0], $ARGV[1], $URL) . "...\n";
	print "Done.\n";
}