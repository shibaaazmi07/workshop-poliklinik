<?php 
$host= "localhost";
$username= "root";
$password= "";
$database= "poliklinik";


$koneksi= mysqli_connect($host, $username, $password, $database);
if($koneksi){
    echo"Database terhubung";
}else{
    echo"Database error";
}
?>