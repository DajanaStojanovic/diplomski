<?php
//sessioin_start();

$nazivAplikacije="Ultra HC - Diplomski rad";

//lokalno
$putanjaApp="/diplomski/";
$mysql_host="localhost";
$mysql_database="ultra_hc_diplomski_rad";
$mysql_user="root";
$mysql_password="";

//za server
$putanjaApp="https://oziz.ffos.hr/ispiti/ispit20/";
//$mysql_host="localhost";
//$mysql_database="ispit20_baza";
//$mysql_user="ispit20";
//$mysql_password="L0C0nJ2U";

//spajanje na bazu
$veza = new PDO("mysql:dbname=". $mysql_database . "; host=" .$mysql_host . "", $mysql_user, $mysql_password);
$veza->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
$veza->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
$veza->exec("SET CHARACTER SET utf8");
$veza->exec("SET NAMES utf8");


?>