<?php
    $password="*****";
    $file=$_POST['file'];
    $version=$_POST['version'];
    $pwd=$_POST['pwd'];
    $DOCUMENT_ROOT=$_SERVER['DOCUMENT_ROOT'];
    //设置时区
    date_default_timezone_set('Asia/Shanghai');
    //按指定格式输出日期
    $date=date('Y-m-d H:i');
 
?>
<!DOCTYPE html>
<html>
<head lang="zh_CN">
    <meta charset="UTF-8">
    <title>更新</title>
</head>
<body>
<h3>结果</h3>
<?php
    echo '<p>提交中时间：'.$date.'</p>';
    echo '<p>当前运行脚本所在目录：'.$DOCUMENT_ROOT.'</p>';
    //判断数据
    if($file == null && $version == null ){
        echo '<p>您未更新.软件版本！</p>';
        exit;
    }else{
        echo '<p>文件名称：'.$file.'.version</p>';
        echo '<p>软件版本：'.$version.'</p>';
    }
    //判断密码
    if($pwd != $password ){
        echo '<p>更新密码错误！</p>';
        exit;
    }
    //设置文件输出内容和格式
    $out_put_string="$version";
    //打开文件,（写入文件）
    $dir = './version';
    if(!is_dir($dir)) {
        mkdir($dir, 0755, true);
    } 
    @$fp=fopen("./version/$file.version",'w');
    flock($fp,LOCK_EX);
    if(!$fp){
        echo "<p><strong>软件版本.更新未完成！</strong></p></body></html>";
        exit;
    }
    //将数据写入到文件
    fwrite($fp,$out_put_string);
    flock($fp,LOCK_UN);
    //关闭文件流
    fclose($fp);
    echo "<p>软件版本.保存完成</p>";
?>
</body>
</html>