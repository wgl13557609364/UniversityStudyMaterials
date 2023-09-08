<?php
function getCaptcha($width, $height, $lines = 10, $length = 4)
{
    $img = imagecreatetruecolor($width, $height);
    $bg_color = imagecolorallocate($img, mt_rand(200,255),  mt_rand(200,255), mt_rand(200,255)); 
    imagefill($img, 0, 0, $bg_color); 
	$str_arr = range('A', 'Z');
	shuffle($str_arr);
	$captcha = '';
	for($i = 0; $i < $length; $i++){
		$captcha .= $str_arr[$i];
	}
	$str_color = imagecolorallocate($img, mt_rand(0, 80), mt_rand(0, 80), mt_rand(0, 80)); 
	imagestring($img, 5, 30, 10, $captcha, $str_color);
	for ($i = 0; $i < $lines; $i++) {
		$line_color = imagecolorallocate($img, mt_rand(100, 160), mt_rand(100, 160), mt_rand(100, 160));
		imageline($img, mt_rand(0, $width), mt_rand(0, $height), mt_rand(0, $width), mt_rand(0, $height), $line_color);
	}
	header('content-type:image/png');
	imagepng($img);
	imagedestroy();
}

getCaptcha(100, 30);