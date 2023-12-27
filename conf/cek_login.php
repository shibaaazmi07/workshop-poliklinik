<?php
include 'koneksi.php';

if (isset($_POST['login'])) {
	$user = mysqli_real_escape_string($koneksi, $_POST['username']);
	$pass = mysqli_real_escape_string($koneksi, $_POST['password']);
	$query = mysqli_query($koneksi, "SELECT * FROM users WHERE username='$user' AND password='$pass'");

	$data = mysqli_fetch_array($query);
	$username = $data['username'];
	$password = $data['password'];
	$level = $data['level'];

	if ($user==$username && $pass==$password){

		session_start();
		$_SESSION['nama'] = $username;
		$_SESSION['level'] = $level;

		if ($level === 'admin') {
			echo "<script> alert('Anda berhasil Login. Sebagai : $level');</script>";
			echo "<meta http-equiv='refresh' content='0; url=../admin/home.php'>";

		}else if($level === 'Dokter') {
			echo "<script> alert('Anda berhasil Login. Sebagai : $level');</script>";
			echo "<meta http-equiv='refresh' content='0; url=../dokter/home.php'>";

		}
        else{
			echo "<script> alert('Anda berhasil Login. Sebagai : $level');</script>";
			echo "<meta http-equiv='refresh' content='0; url=guest/home.php'>";
		}
	}else{
		echo "<script> alert('Username dan Password Tidak Ditemukan');</script>";
			echo "<meta http-equiv='refresh' content='0; url=../index.php'>";
	}

}

?>