<?php

       # Original secutiry XOR function
	function xor_encrypt($in, $key) {
		$text = $in;
		$outText = '';
		// Iterate through each character
		for($i=0;$i<strlen($text);$i++) {
			$outText .= $text[$i] ^ $key[$i % strlen($key)];
    	}
    	return $outText;
	}

	# Array default
        $defaultData  = array("showpassword"=>"no", "bgcolor"=>"#ffffff");
	$defaultDataString  = json_encode($defaultData, true);

	# Cookie
	$dataCookieB64 = 'ClVLIh4ASCsCBE8lAxMacFMZV2hdVVotEhhUJQNVAmhSEV4sFxFeaAw=';
	$dataCookieDecoded = base64_decode($dataCookieB64);

	# Stores the strings in smaller named variables 
	$a = $defaultDataString;
        $b = 'keyToReveal';
	$c = $dataCookieDecoded;

	# Logic:
	# if A xor B = C, then A xor C = B.

print "<br/>";
	print "Applying XOR_Encrypt in input string '" . $a . "' using key '" . $c . "'.";
print "<br/><br/>";
	$b = xor_encrypt($a, $c);
print "Result: <KEY>" . $b . "'</KEY>";

	# After that I already discovered the encryption key, so I just created a new array to change the cookie
	$key = "qw8J";
print "<br/><br/><br/><br/>";
	print "Result: <COOKIE>" . base64_encode(xor_encrypt(json_encode(array("showpassword"=>"yes", "bgcolor"=>"#ff00ff"), true), $key)) . "</COOKIE>";
