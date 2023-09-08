<?php
header('Content-type:text/html;charset=utf-8');
$info = array('id' => 234, 'name' => '王五');
$filename = './upload/default.jpg';
// var_dump($_FILES);

if (!empty($_FILES['upload'])) {
    
     
    $pic_info = $_FILES['upload'];
    //1、判断文件是否有错误
    if ($pic_info['error'] > 0) {
        $error_msg = '上传错误';
        switch ($pic_info['error']) {
            case 1:
                $error_msg .= '文件大小超过了php.ini中upload_max_file_size选项限制的值';
                break;
            case 2:
                $error_msg .= '文件大小超过了表单中 max_filesize选项限制的值';
                break;
            case 3:
                $error_msg .= '文件只有部分被上传';
                break;
            case 4:
                $error_msg .= '没有文件被上传';
                break;
            case 6:
                $error_msg .= '找不到临时文件夹';
                break;
            case 7:
                $error_msg .= '文件写入失败';
                break;
            default:
                $error_msg .= '未知错误';
                break;
        }
        echo $error_msg;
        return false;
    }
    //2、获取文件类型
    $type = $pic_info['type']; 
    $allow_type = array('image/jpeg', 'image/png', 'image/gif');
    //判断上传文件类型
    if (!in_array($type, $allow_type)) {
        echo '图像类型不符合要求，允许的类型为:' . implode(",", $allow_type);
        return false;
    }
    //3、允许上传文件的大小,1048576表示1M
    $max_size = 1048576;
    $size = $pic_info['size'];
    if ($size > $max_size) {
        echo '文件不能超过' . $max_size . '字节';
        return false;
    }
    //4、将文件保存到upload目录
    $new_file = $info['id'] . strrchr($pic_info['name'], '.');
    if(!file_exists('./upload')){
        mkdir('./upload');
    }
    $filename = './upload/' . $new_file;
    echo $filename;
    //5、若用户现有头像存在则删除
    if (file_exists($filename)) {
        unlink($filename);
    }
    //6、头像上传到临时目录成功，将其保存到脚本所在目录下upload文件夹中
    if (!move_uploaded_file($pic_info['tmp_name'], $filename)) {
        echo '头像上传失败';
    }
}
// echo $filename;

require 'file_upload.html';
