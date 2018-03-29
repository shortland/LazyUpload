# LazyUpload
Needed a quick way to upload a file to my server via command line... Too lazy to go into FTP/SSH... So here's this... Not safe nor secure so don't use this in a public setting.

<h3>Usage:</h3>
`$ perl client.pl password1234 /Users/myname/Desktop/fileToUpload.pdf`

<h3>Installation/Setup:<h3>
<p>1.) Upload 'server.pl' to your server. Make sure the file has execute permissions (chmod 755).</p>
<p>2.) Change the default password in 'server.pl' to something else. (nothing super secretive as it's in plaintext and your password will be verified over HTTP in plaintext...)</p>
<p>3a.) Create a folder named "uploads" in the same directory as 'server.pl' on your server.</p>
<p>3b.) Make sure the folder 'uploads' has correct permissions. I'm using chmod 777. Although you can definitely limit that.</p>
<p>4.) Put the file 'client.pl' somewhere easily accessible (Desktop).</p>
<p>5.) Open Terminal/Shell and navigate to the directory where 'client.pl' is located.</p>
<p>6.) Follow the <b>Usage</b> steps above to see how to execute the file.</p>
