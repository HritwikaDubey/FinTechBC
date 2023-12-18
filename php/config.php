<?php 
 
//  $con = mysqli_connect("localhost","root","root","tutorial") or die("Couldn't connect");

$db_host = "localhost:3307"; 
$db_user = "root";
$db_password = "root";
$db_name = "tutorial";

$conn = mysqli_connect($db_host, $db_user, $db_password, $db_name);

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

?>