<?php

include "config.php";
// for opening pdf in browser
$sql = "SELECT * from mimetry where id=13";
$res = mysqli_query($con, $sql);
$row = mysqli_fetch_assoc($res);
echo "<script>console.log({$row['file']})</script>";

header('Pragma: public');
header('Expires: 0');
header('Content-Type: application/pdf');
header('Content-Description: File Transfer');
header('Content-Disposition: attachment; filename=hi.pdf');
header('Content-Transfer-Encoding: binary');
header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
header('Content-Length' . filesize($row['file']));
ob_clean();
flush();
readfile($row['file']);
?>
