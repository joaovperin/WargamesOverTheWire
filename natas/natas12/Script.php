<?php

	# Path to the password file
	$path = "/etc/natas_webpass/natas13";
	$array = explode("\n", file_get_contents($path));

	echo "The Pass for natas13:" . $array[0];
	
?>

