<?php
function getWaterMark($image, $path, $water, $pct = 50){
    $dst = imagecreatefromjpeg($image);  // 原图资源
    $src = imagecreatefrompng($water);   // 水印资源
    $dst_info = getimagesize($image);print_r($dst_info);
	$src_info = getimagesize($water);
	imagecopymerge($dst, $src, $dst_info[0]-$src_info[0], $dst_info[0]-	$src_info[0], 0, 0, $src_info[0], $src_info[1], $pct);
	$dst_info = pathinfo($image);
	$water_file = $dst_info['filename'] . '_water.' . $dst_info['extension'];
	imagejpeg($dst, $path . '' . $water_file);
	imagedestroy($dst);
	imagedestroy($src);
}

getWaterMark('desktop.jpg', './', 'water.png');