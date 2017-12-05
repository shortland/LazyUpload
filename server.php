<?php
	if($_POST['pass'] !== "password") {
		echo "Error: invalid password";
		exit;
	}
	$target_dir = "uploads/";
	$target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
	$imageFileType = pathinfo($target_file, PATHINFO_EXTENSION);
	if (file_exists($target_file)) {
	    echo "File already exists. It will be overwritten.\n";
	}
    if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) {
        echo "The file ". basename( $_FILES["fileToUpload"]["name"]). " has been uploaded.";
    } else {
        echo "Sorry, there was an error uploading your file.";
    }
?>