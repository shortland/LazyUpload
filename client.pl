#!/usr/bin/perl

use strict;
use warnings;
use HTTP::Request::Common;
use LWP::UserAgent;

sub upload {
	my ($pass, $fname, $url) = @_;
	my $ua = LWP::UserAgent->new();
	#$ua->proxy('http', 'http://localhost:8888/');
	my $req = POST $url, Content_Type => 'multipart/form-data', Content => [pass => $pass, fileToUpload => [$fname]];
	my $res = $ua->request($req)->content;
	return $res . "\n";
}

BEGIN {
	my $url = "http://example.com/path/server.php";
	print "\nUploading To: $url\n";
	# my $fname;
	# if (!defined $ARGV[1]) {
	# 	print "Full file path: ";
	# 	chomp($fname = <STDIN>);
	# }
	# else {
	# 	$fname = $ARGV[0];
	# }
	print "Beginning upload of file...\n";
	print upload($ARGV[0], $ARGV[1], $url);
	print "Done.\n\n";
}